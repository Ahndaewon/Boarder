<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에디터</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/main.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/category1Write.css"/>">  
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/static/editor/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
 
</head>
<script type="text/javascript">
	
	function strCheck(){
		
		var str = $("#title").val();
		if ( $("#title").val().length > 50 ) {
			alert("글자수는 50글자로 제한합니다.");
			var subStr = str.substring(0,39);
			$("#title").val(subStr);
			return false;
			
	    }
	}





	$().ready(function(){
		$("#title").focus();
		
		$("#title").keyup(function(){
			strCheck();
		});
		
		
	});

	




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
            
            strCheck();
             
        	if ( $("#title").val() == "") {
    			alert("제목을 입력하세요");
    			$("#title").focus();
    			return false;
    		}
    		if ( $("#editor").val().length == 0 || $("#editor").val() == "<p>&nbsp;</p>" || $("#editor").val() == "" ) {
    			alert("내용을 입력하세요");
    			$("#editor").focus();
    			return false;
    		}
			
    		var mode = "${mode}";
    		if ( mode == "modify" ) {
    			$(".formClass").attr("action","/modify/${article.id}");
    		}
    		
    		
			
			
            $("#insertBoardFrm").submit();
        });
    });
    
    
   
    
</script>
<body>
 
    <div id="smartEditor">
   		<form:form action="/write1" method="post" modelAttribute="insertBoardFrm"  class="formClass" enctype="multipart/form-data">
			<p style="margin-bottom: 100px;"></p>
			<p></p>
			<p></p>
			
			<div id="titleBox" style="text-align: left">
				<input type="text" id="title" name="title" placeholder="제목을 입력하세요" 
												style="width: 650px;" value="${article.title}" >
			</div>
			<div>
				<form:errors path="title"/>
			</div>
   
			
			<div id="bodyBox">
				<textarea id="editor"; name="body" style="width: 650px; height: 400px;">${article.body}</textarea>
			</div>
			<div>
				<form:errors path="body"/>
			</div>
			<div style="text-align: right;">
				<input type="button" id="insertBoard" value="글쓰기" >
			</div>
			
			<c:if test="${ mode eq 'modify' && not empty article.fileName }">
			
				<div class="inputFile">
					첨부파일:<input type="checkbox" id="fileName" name="fileName" class="fileName" value="${article.fileName}">
					<label for="fileName">${article.fileName}</label>
					
				</div>
			</c:if>
			
			<div class="inputFile">
				<input type="file" id="file" name="file">			
			</div>
			
		
				
		</form:form>
    </div>
 
</body>
</html>
