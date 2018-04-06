<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에디터</title>
 
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/static/editor/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
 
</head>
<script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "editor",
            sSkinURI: "/static/editor/editor/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
        //전송버튼
        $("#insertBoard").click(function(){
        	console.log("");
            //id가 smarteditor인 textarea에 에디터에서 대입
            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
            //폼 submit
            $("#insertBoardFrm").submit();
        });
    });
</script>
<body>
 
   
    <div id="smartEditor">
   		<form:form action="/write1" method="post" modelAttribute="insertBoardFrm"  enctype="multipart/form-data">
				
			<div>
				<input type="text" id="title" name="title" placeholder="제목을 입력하세요" style="width: 650px;" >
			</div>
			
			<div id="bodyBox">
				<textarea id="editor"; name="body" style="width: 650px; height: 400px; margin: 0 px auto"></textarea>
			</div>
			
			<div style="text-align: left;">
				<input type="button" id="insertBoard" value="글쓰기" >
			</div>
			<div>
				<input type="file" id="file" name="file">			
			</div>
			
		
				
		</form:form>
    </div>
 
</body>
</html>

