package com.project.boader.web;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.boader.service.BoarderService;
import com.project.boader.vo.ArticleVO;
import com.project.member.vo.LoginVO;
import com.project.member.vo.MemberVO;

@Controller
public class BoaderController {
	
	private BoarderService boarderService;
	



	public void setBoarderService(BoarderService boarderService) {
		this.boarderService = boarderService;
	}

/*	@RequestMapping(value="/send", method=RequestMethod.POST)
	public String sendBody(@RequestParam("editor") String body) {
		System.out.println(body);
		return "";
	}
	*/
	// 다중파일업로드
    @RequestMapping(value = "/fileUploader",
                  method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
        // 파일정보
        StringBuffer sb = new StringBuffer();
        try {
            // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            // 파일 기본경로 _ 상세경로
            String filePath = "C:/Users/Administrator/Documents/Boarder/src/main/webapp/WEB-INF/photoUpload/";
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(filePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // 정보 출력
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
              .append("&sFileURL=").append("http://localhost:8080/photoUpload/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }



	
	@RequestMapping("/")
	public String mainPage() {
		
		
		return "main";
	}

	
	@RequestMapping("/category1")
	public ModelAndView category1() {
		
		List<ArticleVO> articleList;
		ModelAndView view = new ModelAndView();
		articleList = boarderService.selectAll();
		
		if ( articleList == null ) {
			return new ModelAndView("redirect:/404");
		}
		
		
		view.addObject("articleList", articleList);
		view.setViewName("/category/category1");
		
		
		
		return view;
	}
	
	@RequestMapping("/view/{id}")
	public ModelAndView viewPage(@PathVariable int id) {
		
		ModelAndView view = new ModelAndView();
		
		ArticleVO article = boarderService.selectViewPage(id);
		
		view.addObject("article", article);
		view.setViewName("/category/categoryView1");
		
		
		
		return view;
	}
	

	/*
	@RequestMapping(value="/write2", method=RequestMethod.GET)
	public String article2() {
		
		return "editor";
	}
*/
	
	
	
	
	@RequestMapping(value="/write1", method=RequestMethod.GET)
	public String article1() {
		
		return "/category/categoryWrite1";
	}

	@RequestMapping(value="/write1", method=RequestMethod.POST)
	public ModelAndView categoryWrite(@ModelAttribute("articleForm") ArticleVO articleVO, 
							HttpServletRequest request, HttpSession session) {
		
		/*ModelAndView view = new ModelAndView();*/
		MemberVO member = (MemberVO) session.getAttribute("__USER__");
		if ( member == null ) {
			return new ModelAndView("redirect:/");
		}
		System.out.println(member.getId());
		System.out.println(articleVO.getBody());
		System.out.println(articleVO.getFile().getOriginalFilename());
		
		articleVO.setRequestIp(request.getRemoteAddr());
		articleVO.setMemberId(member.getId());// 로그인한 멤버 아이디 넣어줌
		articleVO.save();
		
		if( articleVO != null ) {
			
			boarderService.insertArticle(articleVO);
			return new ModelAndView("redirect:/category1");
		}
		
		
		return new ModelAndView("redirect:/write1");
		
	}
	
	
	@RequestMapping("/category2")
	public String category2() {
		
		
		return "/category/category2";
	}
	
	@RequestMapping("/category3")
	public String category3() {
		
		
		return "/category/category3";
	}
	
	@RequestMapping("/category4")
	public String category4() {
		
		
		return "/category/category4";
	}


		

}
