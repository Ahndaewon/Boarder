<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/listPage.css"/>">

<style>
table {
	border: 1px solid #444444;
	margin : 0px auto;
	vertical-align : middle;
	text-align : center;
}
tr, td, th{
	border: 1px solid #444444;
}
#titleTd {
	width: 180px;
	text-align: left;
	padding-left: 8px;

}
#writeBox {
	text-align: left;
	padding-left: 10px;
}

</style>

<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>">
</script>

<script type="text/javascript">

	$().ready(function(){
	
		
		
		
		
	});

</script>


	<div class="list">
		
		<p></p>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>	
			<c:forEach items="${articleList}" var="article">
			<tr style="border-style: double;">
				<td>${article.id}</td>
				<td id="titleTd"><a href="<c:url value="/view/${article.id}"/>">${article.title}</a></td>
				<td>${article.writeDate}</td>
				<td>${article.viewCount}</td>
			</tr>
			
			
			</c:forEach>
			<tr>
				<td id="writeBox" colspan="4"><a href="<c:url value="/write1"/>">글쓰기</a></td>
			</tr>
		</table>
		
			<div id="writeBox">
				
			</div>
		
		
	</div>
