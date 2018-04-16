package com.project.boader.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.boader.service.BoarderService;
import com.project.boader.vo.ArticleIpVO;
import com.project.boader.vo.ArticleVO;
import com.project.constants.Article;
import com.project.constants.Member;
import com.project.member.vo.LoginVO;
import com.project.member.vo.MemberVO;
import com.project.util.DownloadUtil;
import com.project.util.Pager;

@Controller
public class BoaderController {
	
	private BoarderService boarderService;
	



	public void setBoarderService(BoarderService boarderService) {
		this.boarderService = boarderService;
	}

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
	public ModelAndView mainPage() {
		
		ModelAndView view = new ModelAndView();
		view.setViewName("main");
		
		List<ArticleVO> articleList = boarderService.selectCategory1();
		
		if ( articleList == null ) {
			return new ModelAndView("/view/error/404");
		}	
		
		view.addObject("articleList", articleList);
		
		
		
		return view;
	}
	
	@RequestMapping("/category1")
	public ModelAndView category1(HttpServletRequest request
			, @RequestParam(defaultValue="1") int pagenum
			) {
		Pager pager = new Pager();
		List<ArticleVO> articleList;
		ModelAndView view = new ModelAndView();
		
		
		int totalCount = boarderService.selectAllcount();
		
		//TODO pager 정리
		
		pager.setTotalCount(totalCount); //전체 게시글 개수
		pager.setPageNum(pagenum); // 현재 페이지
		
		pager.setCurrentBlock(pagenum); // 현재 페이지 블록이 몇번째 블록인지
		pager.setLastBlock(); // 마지막 블록 번호
		
		pager.setStartRow(pagenum);
		pager.setEndRow(pagenum);
		
		pager.prevNext(pagenum);
		//현재 페이지 번호로 화살표를 나타낼지 정한다
		pager.setStartPage();
		//해당 블럭의 시작페이지
		pager.setEndPage();
		//해당블럭의 마지막 페이지
		//pageNation
		
		
		articleList = boarderService.selectAll(pager);
		if ( articleList == null ) {
			return new ModelAndView("redirect:/404");
		}
		
		
		view.addObject("articleList", articleList);
		view.addObject("pager", pager);
		view.setViewName("/category/category1");
		
		
		
		return view;
	}
	
	
	/*@RequestMapping("/read/{id}") 
	public String readPage( @PathVariable int id ) {
		
		
		return "redirect:/view/"+id;
	}*/
	
	
	//category1 글보기
	@RequestMapping("/view/{id}")
	public ModelAndView viewPage(@PathVariable int id, HttpSession session, HttpServletRequest request) {
		
		ModelAndView view = new ModelAndView();
		
		ArticleVO article = boarderService.selectViewPage(id);
		
		if ( article == null ) {
			return new ModelAndView("redirect:/category1");
		}
		
		MemberVO member = (MemberVO) session.getAttribute(Member.USER);
		
		String memberId = member.getId();
		
		
		String ip = request.getRemoteAddr();
		
		boarderService.increamentViewCount(id, memberId, ip) ;
		
		
		view.addObject("article", article);
		view.setViewName("/category/categoryView1");
		
		return view;
	}
	
	
	//category1 글쓰기
	@RequestMapping(value="/write1", method=RequestMethod.GET)
	public String article1(HttpSession session) {
		
		return "/category/categoryWrite1";
	}

	@RequestMapping(value="/write1", method=RequestMethod.POST)
	public ModelAndView categoryWrite(@ModelAttribute("articleForm") @Valid ArticleVO articleVO, Errors errors, 
							HttpServletRequest request, HttpSession session) {
		
		
		
		if ( errors.hasErrors() || articleVO.getBody().equals("<p>&nbsp;</p>") ) {
			System.out.println("글작성 실패");
			return new ModelAndView("/category/categoryWrite1");
		}
		
		
		
		/*ModelAndView view = new ModelAndView();*/
		MemberVO member = (MemberVO) session.getAttribute("__USER__");
		if ( member == null ) {
			return new ModelAndView("redirect:/");
		}
		System.out.println(member.getId());
		System.out.println(articleVO.getBody());
		System.out.println(articleVO.getFile().getOriginalFilename());
		
		articleVO.setMemberId(member.getId());// 로그인한 멤버 아이디 넣어줌
		articleVO.save();
		
		ArticleIpVO articleIp = new ArticleIpVO();
		articleIp.setMemberId(member.getId());
		articleIp.setRequestIp( request.getRemoteAddr() );
		
		
		if( articleVO != null ) {
			
			boarderService.insertArticle(articleVO, articleIp);
			return new ModelAndView("redirect:/category1");
		}
		
		
		return new ModelAndView("redirect:/write1");
		
	}
	@RequestMapping("/remove/{id}")
	public String removeArticle (@PathVariable int id, HttpSession session) {
		
		LoginVO member = (LoginVO)session.getAttribute(Member.USER);
		ArticleVO article = boarderService.selectViewPage(id);
		
		
		//존재하지 않는 글이면
		if ( article == null ) {
			return "redirect:/";
		}
		
		
		System.out.println(id);
		session.removeAttribute(Article.REMOVE);
		
		//url로의 접근을 막음
		//자신의 글이 아니면 삭제 못하게
		if ( !member.getId().equals(article.getMemberId()) ) {
			
			session.setAttribute(Article.REMOVE, "fail");
			
			return "redirect:/view/"+id;
		}
		
		String fileName = article.getFileName();
		
		//업로드한 파일이 존재하면 지워줌
		if ( fileName != null ) {
			File file = 
					new File("D:\\Upload/"+ fileName);
			file.delete();
		}
		//iptatable에서 
		
		boolean isDelete = boarderService.removeArticle(id);
		
		
		if ( isDelete ) {

			return "redirect:/category1";
			
		}
		
		return "redirect:/view/"+ id;
	}
	
	
	@RequestMapping(value="modify/{id}", method=RequestMethod.GET)
	public ModelAndView modifyGet(@PathVariable int id, HttpSession session) {
		
		ModelAndView view = new ModelAndView();
		
		MemberVO member = (MemberVO)session.getAttribute(Member.USER);
		
		ArticleVO article = boarderService.selectViewPage(id);
		
		if ( !article.getMemberId().equals(member.getId()) ) {
			//본인의 글이 아닐시 수정 막음
			return new ModelAndView("redirect:/view"+id);
		}
		System.out.println(article.getFileName());
		view.addObject("article", article);
		view.addObject("mode", "modify");
		view.setViewName("/category/categoryWrite1");
		
		
		
		return view;
	}
	
	@RequestMapping(value="/modify/{id}", method=RequestMethod.POST)
	public String modifyPost( @PathVariable int id 
				,@ModelAttribute("articleForm") @Valid ArticleVO articleVO, Errors errors, 
				HttpServletRequest request, HttpSession session) {
		
		if ( errors.hasErrors() || articleVO.getBody().equals("<p>&nbsp;</p>") ) {
			System.out.println("글수정 실패");
			return "/category/categoryWrite1";
		}
		
		MemberVO member = (MemberVO) session.getAttribute(Member.USER);
		ArticleVO originalArticle = boarderService.selectViewPage(id);
		
		
		
		if ( !member.getId().equals(originalArticle.getMemberId()) ) {
			System.out.println("본인글 아님");
			return "redirect:/";
		}
		
		boolean isModify = false;
		ArticleVO newArticle = new ArticleVO();
		
		/*
		0. 아이피 변경 확인  
		1. 제목 변경확인
		2. 내용 변경 확인
		3. 파일변경 확인
		4. 변경이 모두 안됬는지
		
		변경될때 날짜
		*/
		newArticle.setId(originalArticle.getId());
		newArticle.setMemberId( member.getId() );
		
		
		//아이피 변경
		String ip = request.getRemoteAddr();
		String originalIp = originalArticle.getArticleIpVO().getRequestIp();
		
		ArticleIpVO newArticleIpVO = new ArticleIpVO();
		
		if ( !ip.equals( originalIp ) ) {
			newArticleIpVO.setRequestIp(ip);
			System.out.println("1");
			isModify = true;
		}
		
		if ( !originalArticle.getTitle().equals( articleVO.getTitle()) ) {
			newArticle.setTitle( articleVO.getTitle() );
			System.out.println("2");
			isModify = true;
		}
		
		if ( !originalArticle.getBody().equals(articleVO.getBody()) ) {
			newArticle.setBody(articleVO.getBody());
			isModify = true;
			System.out.println("3");
		}
		
		if ( articleVO.getFileName().length() > 0 ) {
			File file = 
					new File("D:\\Upload/" + articleVO.getFileName());
			file.delete();
			newArticle.setFileName("");
			System.out.println("4");
		}
		else {
			System.out.println("5");
			newArticle.setFileName(originalArticle.getFileName());
		}
		
		
		articleVO.save();//변경됬으면 sava
		if ( !originalArticle.getFileName().equals(articleVO.getFileName()) ) {
			newArticle.setFileName(articleVO.getFileName());
			isModify = true;
			
			System.out.println("6");
		}
		
		if ( isModify ) {
			System.out.println("수정완료");
			
			boarderService.updateArticle(newArticle, newArticleIpVO);
			return "redirect:/category1";
		}
		System.out.println("변경없음");		
		return "redirect:/category1";
	}
	

	@RequestMapping("/download/{id}")
	public void downloadFile(@PathVariable int id, HttpServletRequest request
									, HttpServletResponse response) {
		
		ArticleVO article = boarderService.selectViewPage(id);
		
		String filename = article.getFileName();
		
		DownloadUtil download = new DownloadUtil("D:\\Upload/"+ filename);
		
		try {
			download.download(request, response, filename);
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		
		
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
