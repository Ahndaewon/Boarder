<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/listPage.css"/>">


<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>">
</script>

<script type="text/javascript">


	function page(idx){
		var pagenum = idx;
		location.href="/category1?pagenum="+ pagenum;
}
	
	$().ready(function(){
		
		
		$(".titleTd").mouseover(function(){
			
			$(this).css("font-weight", "bold");
			
		});
		$(".titleTd").mouseout(function(){
			
			$(this).css("font-weight", "normal");
			
		});
		
	});
	
	
</script>


	<div class="list" style="margin-top: 50px; min-height: 600px;">
		
		
		<table style="margin-top: 30px; ">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th style="width: 73px;">날짜</th>
					<th>조회수</th>
				</tr>
			</thead>	
			<tbody>
				<c:forEach items="${articleList}" var="article">
					
					
					<tr>
						<td id="idTd">${article.id}</td>
						<td id="titleTd" class="titleTd" style="box-sizing:border-box; border-bottom: 1px solid #d7e0ef;">
						
							<a href="<c:url value="/view/${article.id}?pagenum=${pagenum}"/>">
								<span>${article.title}</span>
								
								<!--댓글 개수 -->
								<c:forEach items="${replyCountList}" var="list">
									
									<c:if test="${list.get('ID') == article.id && list.get('COUNT') > 0 }">
									<span style="color: #e91b23; font-weight: bold;">[${list.get("COUNT")}]</span>
									</c:if>	
			
								</c:forEach>
								
								<c:if test="${fn:contains(article.writeDate,'h')}">
									<!--24시간 new-->
									<img style="width: 10px; height: 10px;" src="<c:url value="/static/img/iconew.gif"/>"/>
								</c:if>
								<c:if test="${not empty article.fileName}">
									<!-- 파일 존재 유무 -->
									<img src="<c:url value="/static/img/fileIcon.png"/>"/>
								</c:if>
								<c:if test="${article.recommendCount > 0 }">
									<!-- 좋아요가 있으면 -->
									<img src="<c:url value="/static/img/like2.PNG"/>"/>[${article.recommendCount}]
								</c:if>
							</a>
							
						</td>
						<td id="dateTd">
							<c:choose>
								<c:when test="${fn:contains(article.writeDate, 'h')}">
									${fn:replace(article.writeDate, "h", "")}
								</c:when>
								<c:otherwise>
									${article.writeDate}
								</c:otherwise>
							</c:choose>			
										
						</td>
						<td>${article.viewCount}</td>
					</tr>
					
				</c:forEach>
				<tr>
					<td id="writeBox" colspan="4"><a href="<c:url value="/write1"/>">글쓰기</a></td>
				</tr>
			</tbody>
			
		</table>
		
			<div id="pageBox">
				<c:if test="${pager.totalCount > 0 }">
					<c:if test="${pager.prev}">
							<a href="javascript:page(${pager.startPage}-1)">이전&nbsp</a>
					</c:if>
						
					<c:forEach begin="${pager.startPage}" end="${pager.endPage}" var="idx"> 
						<c:choose>
							<c:when test="${pager.pageNum eq idx}">
									<a style="font-weight: bold; color: #000;" href="javascript:page(${idx})">${idx}&nbsp</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:page(${idx})">${idx}&nbsp</a>
							</c:otherwise>
								
						</c:choose>
					
					</c:forEach>
						
					<c:if test="${pager.next}">
							<a href="javascript:page(${pager.getEndPage()+1})">다음</a>
					</c:if>
				</c:if>
			</div>
		
		
	</div>
