<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/main.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/category1.css"/>"> 

		<title>유효하지 않은 링크</title>
	</head>
<body>
	    <div id="wrapper">

       <!--main-->
     <div class="main">
         <a href="<c:url value="/"/>">main</a>
     </div>

     <!--total-->
     <div class="total">
       <!-- login,, category list-->
         <div class="login">
          <!--login-->
     <jsp:include page="/WEB-INF/view/login.jsp"></jsp:include>


         </div><!--

	
         total list
   --><div class="totalList1">
      	<div class="innerBox">
      		<div style="margin-top: 150px;">
      			<h3>비밀번호 변경이 실패하였습니다.</h3>
      		</div>
      	</div>
      </div>
      	




     </div>



   </div>
	
</body>
</html>