<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/listPage.css"/>">

<script type="text/javascript">

	function page(idx){
		var pagenum = idx;
		location.href="/category1?pagenum="+ pagenum;
		
		
	}

</script>




	<div class="list">
		
		
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			
			<tbody>

				<c:forEach var="list" items="${articleList}">
					<tr>
						<td>${list.id}</td>
						<td>${list.title}</td>
						<td>${list.writeDate}</td>
					</tr>
				</c:forEach>
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
	</div>
