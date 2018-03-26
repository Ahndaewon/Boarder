<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/main.css"/>">
		<title>Main</title>
	</head>
	<body>
	     <div id="wrapper">
	
	        <!--main-->
	      <div class="main">
	          <a href="<c:url value="/"/>">main</a>
	      </div>
	
	      <!--total-->
	      <div>
	        <!-- login,, category list-->
	          <div class="login">
             <!--login-->
				<jsp:include page="/WEB-INF/view/login.jsp"></jsp:include>
	          </div><!--
	
	
	          total list 
	       --><div class="totalList">
	            <!--list 1,2-->
	            <div>
	              <!--list 1-->
	              <div class="list1">
	                  리스트1
	              </div><!--
	                list 2
	         --><div class="list1">
	                  리스트2
	              </div>
	            </div>
	
	            <!--list 3,4-->
	            <div>
	              <!--list 3-->
	              <div class="list1">
	                리스트3
	              </div><!--
	                list 4
	          --><div class="list1">
	                리스트4
	              </div>
	            </div>
	
	          </div>
	
	
	
	
	      </div>
	
	
	
	
	
	
	
	
	
	
	
	
	    </div>
	
	
	</body>
</html>