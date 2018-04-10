<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/listPage.css"/>">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>">
</script>

<script type="text/javascript">
</script>

<body>
<style>
#articleTitle {
	text-align:	justify;
	padding: 10px 0px 10px 20px;
	font-weight: bold;
	font-size: 20px;
	border-bottom: 1px solid #CCC;
	position: relative;
	
	
	
 }
#articleBody {
	text-align: left;
	padding-left: 20px;
}
#articleInfo {
	font-size: 14px;
	font-weight: normal;
	position: absolute;
	right: 20px;
}

</style>
	<div>&nbsp</div>
	<div>&nbsp</div>
	<div class="list">
		
		
		<div id="articleTitle">
			<span>${article.id} : ${article.title}</span>   
			<span id="articleInfo">${article.memberVO.nickname}( ${article.memberId} ) | ${article.writeDate}</span>
		</div>
		
		<div id="articleBody">
			<span><a href="<c:url value="/download/${article.id}"/>">
			 <img src="<c:url value="/static/img/fileIcon.jpg"/>">
			 ${article.fileName}</a></span>
			${article.body}
		</div>
		
		
		
	</div>
</body>