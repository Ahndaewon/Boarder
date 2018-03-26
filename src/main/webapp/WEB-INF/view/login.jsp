<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/login.css"/>">
<script type="text/javascript" src="/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$().ready(function(){
		
		
		
		<c:if test="${not empty sessionScope.__USER__}">
			$("#logid").hide();
			$("#loginBtn").hide();
			$(".log").show();
			$("#logout").show();
			$("#logpassword").hide();
			
		</c:if>
	
		
		
		
		$("#loginBtn").click(function(){
			
			$("#loginForm").attr({
				"action" : "<c:url value="/login"/>",
				"method" : "post"
			}).submit();
			
			
			
			
			
		});
		
	});


</script>


 <!--login-->
 <div class="logInput" >
     
     <div>
     	<form:form modelAttribute="loginForm">
     		<div>
     			<div class="innerLog1" >
       		<input type="text" id="logid" name="id" placeholder="ID를 입력하세요" value="${loginForm.id}">
       		<div class="log" style="display: none">${sessionScope.__USER__.id}</div>
       		<div>
       			<form:errors path="id"/>
       		</div>
       		
       		<input type="password" id="logpassword" name="password" placeholder="비밀번호를 입력하세요" value="${loginForm.password}">
      		<div>
       			<form:errors path="password"/>
       		</div>
      		</div>
      	
      		<div class="innerLog2">
       		<input type="button"  id="loginBtn" value="로그인"  style=" height: 46px;">
	       	<a href="<c:url value="/logout"/>">
	       			<input type="button"  id="logout" value="로그아웃"  style=" height: 46px; display: none">
	       	</a>
	       	</div>
       		

     		</div>
     		
     		<p><a href="<c:url value="/join"/>">회원가입</a>&nbsp;&nbsp;
     		   <a href="<c:url value="/find"/>">아이디/비밀번호 찾기</a></p>
     	
     	
     	</form:form>
     </div>  
 </div>

 <!--category list-->
 <div class="category">
 	<p>&nbsp;</p>
 	<p>&nbsp;</p>
     
     <p><a href="<c:url value="/category1"/>">category1</a></p>
     <p>&nbsp;</p>
     <p><a href="<c:url value="/category2"/>">category2</a></p>
     <p>&nbsp;</p>
     <p><a href="<c:url value="/category3"/>">category3</a></p>
     <p>&nbsp;</p>
     <p><a href="<c:url value="/category4"/>">category4</a></p>
     <p>&nbsp;</p>

     
     
     
 </div>
