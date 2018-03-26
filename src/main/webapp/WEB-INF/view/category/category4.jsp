<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/main.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/category1.css"/>"> 

		<title>category4</title>
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
   --><div class="totalList">
      	
      	<jsp:include page="/WEB-INF/view/page/listPage4.jsp"></jsp:include>
      
      </div>
      	




     </div>



   </div>
	
</body>
</html>