<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/main.css"/>">
		
		<title>Main</title>
	</head>
<script type="text/javascript">

	function startTime() {
	    var today = new Date();
	    var h = today.getHours();
	    var m = today.getMinutes();
	    var s = today.getSeconds();
	    m = checkTime(m);
	    s = checkTime(s);
	    document.getElementById('clock').innerHTML =
	    h + ":" + m + ":" + s;
	    var t = setTimeout(startTime, 500);
	}
	function checkTime(i) {
	    if (i < 10) {i = "0" + i}; // 숫자가 10보다 작을 경우 앞에 0을 붙여줌
	    return i;
	}



</script>
	
	
	
	<body onload="startTime()">
	
		<div id="clock"></div>
	
	
	
	
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
	                  	<p>
		                  	<a href="<c:url value="/view/${article.id}"/>">
			                  	
			                  		<span class="arrow">▶</span> 
			                  		${article.title}
			                  	
		                  	</a>
		                  	<c:if test="${fn:contains(article.writeDate,'h')}">
									<!--24시간 new-->
									<img style="width: 10px; height: 10px;" src="<c:url value="/static/img/iconew.gif"/>"/>
							</c:if>
			                  	
			                  	
	                  	</p>
	                  	<hr/>
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
			                  	<p>
				                  	<a href="<c:url value="/view/${article.id}"/>">
					                  	
					                  		<span class="arrow">▶</span> 
					                  		${article.title}
					                  	
				                  	</a>
				                  	<c:if test="${fn:contains(article.writeDate,'h')}">
											<!--24시간 new-->
											<img style="width: 10px; height: 10px;" src="<c:url value="/static/img/iconew.gif"/>"/>
									</c:if>
					                  	
					                  	
			                 	</p>
			                  	<hr/>
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
	                  		<p>
			                  	<a href="<c:url value="/view/${article.id}"/>">
				                  	
				                  		<span class="arrow">▶</span> 
				                  		${article.title}
				                  	
			                  	</a>
			                  	<c:if test="${fn:contains(article.writeDate,'h')}">
										<!--24시간 new-->
										<img style="width: 10px; height: 10px;" src="<c:url value="/static/img/iconew.gif"/>"/>
								</c:if>
				                  	
			                  	
	                  		</p>
	                  	<hr/>
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
		                  	<p>
			                  	<a href="<c:url value="/view/${article.id}"/>">
				                  	
				                  		<span class="arrow">▶</span> 
				                  		${article.title}
				                  	
			                  	</a>
			                  	<c:if test="${fn:contains(article.writeDate,'h')}">
										<!--24시간 new-->
										<img style="width: 10px; height: 10px;" src="<c:url value="/static/img/iconew.gif"/>"/>
								</c:if>
				                  	
				                  	
		                  	</p>
	                  		<hr/>
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