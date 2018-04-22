<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/login.css"/>">
<script type="text/javascript" src="/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">


	function submitLogin(){
		
		$(".fail").remove();
		var needId = $("<div class='fail'>아이디를 입력하세요 </div>");
		var needPass = $("<div class='fail'>비밀번호를 입력하세요 </div>");
		
		if ($("#logid").val() == "") {
			
			$("#logid").focus();
			$(".innerLog1").append(needId);
			return false;
		}
		
		if ($("#logpassword").val() == "") {
			
			$("#logpassword").focus();
			$(".innerLog1").append(needPass);
			return false;
			
		}
		
		$("#loginForm").attr({
			"action" : "<c:url value="/login"/>",
			"method" : "post"
		}).submit();
	} 



	$().ready(function(){
		
		var failLogin = $("<div class='fail'>아이디, 비밀번호를 확인하세요 </div>");
		<c:choose>
			<c:when test="${empty sessionScope.__FAIL__ eq 'fail'}">
				$(".innerLog1").append(failLogin);	
			</c:when>
			
			<c:otherwise>
				$(".fail").remove();	 
			</c:otherwise>
		</c:choose>  
		
		<c:remove var="__FAIL__" scope="session" />
		
		
		<c:if test="${not empty sessionScope.__USER__}">
			$("#logid").hide();
			$("#loginBtn").hide();
			$(".log").show();
			$("#logout").show();
			$("#logpassword").hide();
			
		</c:if>
	
		
	<!--로그인 엔터 구현 및 입력값 validation check-->	
		
		$("#loginBtn").click(function(){
			
			
			
			
			submitLogin();
			
		});
		
		$("#logid").keyup(function(e){
			if ( e.keyCode == 13 ) {
				submitLogin();
			}
		});
		
		$("#logpassword").keyup(function(e){
			
			if ( e.keyCode == 13 ) {
				submitLogin();
			}
		});
		 

	});


</script>


 <!--login-->
 <div class="logInput" >
     
     <div>
     	<!--validation check로 인한 메시지 나오지 않음 /login에서 / url로 redirect -->
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
     		<c:if test="${empty sessionScope.__USER__}">
	     		<p>
	     			<a href="<c:url value="/join"/>">회원가입</a>&nbsp;&nbsp;
	     			<a href="<c:url value="/find"/>">아이디/비밀번호 찾기</a>
	     		</p>
			</c:if>     	
     	
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
