<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>">
</script>
<script type="text/javascript">
	
	$().ready(function(){
		
		<c:if test="${not empty exists}">
			alert("이메일을 확인해주세요");
		</c:if>
		
		
		$("#pwBtn").click(function(){
			
			$("#findPwForm").attr({
				"method" : "post",
				"action" : "<c:url value="/sendpw"/>"
				
			}).submit();
			
		});
	});
	
</script>

<style>
.list1 {
	margin-top: 150px; 
	border: 1px solid #000;
}
.idBox, .pwBox{
	margin-top: 50px;
    margin-bottom: 50px;
}


</style>


<body>

	

	<div class="list1">
	
		
			
		<div class="idBox">
			<p>아이디 찾기</p>
			<form id="findIdForm">
				Email : <input type="text" id="idMail" name="idMail" placeholder="email">
				<input type="button" id="idBtn" value="확인">
			</form>
		
		</div>
		
		<hr/>
	
	
		<div class="pwBox">
			<p>비밀번호 찾기</p> 
			<form id="findPwForm">
			
				Email : <input type="text" id="mail" name="mail" placeholder="email">
				<input type="button" id="pwBtn" value="확인">
			
			</form>
		</div>
	
	</div>
	

	

</body>
</html>