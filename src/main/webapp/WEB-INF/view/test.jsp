<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		    height: 50px;
		    text-align: center;
		  }
		
		  .login {
		    display : inline-block;
		    width: 300px;
		    height: 700px;
		    vertical-align : top;
		  }
		
		  .main, .login, .totalList  {
		     box-sizing: border-box;
		     border: 1px solid blue;
		
		  }
		  
		  .totalList {
		  display : inline-block;
		   width: 700px;
		   height: 700px;
		  }
	
	
	</style>
		<title>structure</title>
	</head>
<body>
	    <div id="wrapper">

       <!--main-->
     <div class="main">
         <a href="<c:url value="/test"/>">main</a>
     </div>

     <!--total-->
     <div>
       <!-- login,, category list-->
         <div class="login">
          <!--login-->
     <c:import url="/login"></c:import>


         </div><!--


         total list
      --><div class="totalList">





         </div>




     </div>



   </div>
	
</body>
</html>