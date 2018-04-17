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
	            <div style="height: 350px;">
	              <!--list 1-->
	              <div class="list1">
	                 
	                 <div class="listInner">
	                 
	                  <div class="categoryInner" >자유게시판</div>
	                  <div class="titleBox">
	                  	<c:forEach items="${articleList}" var="article">
	                  		
	                  	<a href="<c:url value="/view/${article.id}"/>"><p>- ${article.title}</p></a>
	                  	
	                  	</c:forEach>
	                  </div>
	                 </div>
	              </div><!--
	                list 2
	         --><div class="list1">
	                 
	                 <div class="listInner">
	                 
	                  <div class="categoryInner" >자유게시판</div>
	                  <div class="titleBox">
	                  	<c:forEach items="${articleList}" var="article">
	                  		
	                  	<a href="<c:url value="/view/${article.id}"/>"><p>- ${article.title}</p></a>
	                  	
	                  	</c:forEach>
	                  </div>
	                 </div>
	              </div>
	            </div>
	
	            <!--list 3,4-->
	            <div style="height: 350px; border-bottom: 1px solid #d4cccc;">
	              <!--list 1-->
	              <div class="list1">
	                 
	                 <div class="listInner">
	                 
	                  <div class="categoryInner" >자유게시판</div>
	                  <div class="titleBox">
	                  	<c:forEach items="${articleList}" var="article">
	                  		
	                  	<a href="<c:url value="/view/${article.id}"/>"><p>- ${article.title}</p></a>
	                  	
	                  	</c:forEach>
	                  </div>
	                 </div>
	              </div><!--
	                list 2
	         --><div class="list1">
	                 
	                 <div class="listInner">
	                 
	                  <div class="categoryInner" >자유게시판</div>
	                  <div class="titleBox">
	                  	<c:forEach items="${articleList}" var="article">
	                  		
	                  	<a href="<c:url value="/view/${article.id}"/>"><p>- ${article.title}</p></a>
	                  	
	                  	</c:forEach>
	                  </div>
	                 </div>
	              </div>
	            </div>
	
	          </div>
	
	
	
	
	      </div>
	
	
	
	
		 <div>
		 	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
		 </div>
	
	
	
	
	
	
	
	    </div>
	
	
	</body>
</html>