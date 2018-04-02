<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/findPage.css"/>">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>">
</script>
<script type="text/javascript">
	
	$().ready(function(){
		
		
		$("#pwBtn").click(function(){
			
			$("#findPwForm").attr({
				"method" : "post",
				"action" : "<c:url value="/sendpw"/>"
				
			}).submit();
			
		});
	});
	
</script>



</head>
<body>

	<div class="list">
	
		
		<div>
			<p>아이디 찾기</p>
			<form id="findIdForm">
				  
			</form>
		
		</div>
		
		<hr/>
	
	
		<div>
			<p>비밀번호 찾기</p> 
			<form id="findPwForm">
			
				Email : <input type="text" id="mail" name="mail" placeholder="email">
				<input type="button" id="pwBtn" value="확인">
			
			</form>
		</div>
	</div>
	

	

</body>
</html>