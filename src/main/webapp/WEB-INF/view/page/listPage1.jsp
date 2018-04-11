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


	function page(idx){
		var pagenum = idx;
		location.href="/category1?pagenum="+ pagenum;
	
	
}
</script>


	<div class="list" style="margin-top: 50px;">
		
		
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>	
			<tbody>
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
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
					
						<c:if test="${pager.prev}">
							<a style="text-decoration: none;" href="javascript:page(${pager.getStartPage()}-1)">이전</a>
						</c:if>
						
						<c:forEach begin="${pager.getStartPage()}" end="${pager.getEndPage()}" var="idx"> 
							<c:choose>
								<c:when test="${pager.pageNum eq idx}">
									<a style="text-decoration: none; font-weight: bold; color: #000;" href="javascript:page(${idx})">${idx}</a>
								</c:when>
								<c:otherwise>
									<a style="text-decoration: none;" href="javascript:page(${idx})">${idx}</a>
								</c:otherwise>
								
							</c:choose>
								
							
							
							
						
						</c:forEach>
						
						<c:if test="${pager.next}">
							<a style="text-decoration: none;" href="javascript:page(${pager.getEndPage()+1})">다음</a>
						</c:if>
					</td>
				</tr>
			</tfoot>	
		</table>
		
			<div id="writeBox">
				
			</div>
		
		
	</div>
