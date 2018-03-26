<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <style type="text/css">
			#wrapper {
				width: 1000px;
				margin: 0px;
			}
			
			.main {
				width: 1000px;
				height: 50px;
				text-align: center;
				display: table-cell;
				vertical-align: middle;
			}
			
			.login {
				display : inline-block; 
				width: 300px; 
				height: 700px; 
				vertical-align : top;
			}
			
			.main, .list1, .login, .totalList {
				 box-sizing: border-box; 
				 border: 1px solid blue; 
				 
			}
			
			.list1 {
				display : inline-block; 
				width : 350px; 
				height : 350px;
			}
			
			.totalList {
				display : inline-block;
				width: 700px;
				height: 700px;



				 
			}
			.total {
				position: relative;
			}
			
		
		</style>
		
		<title>회원가입</title>
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
  	    <jsp:include page="/WEB-INF/view/page/joinPage.jsp"></jsp:include>
      </div>




     </div>



   </div>
	
</body>
</html>