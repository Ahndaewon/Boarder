<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/listPage.css"/>">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>">
</script>

<script type="text/javascript">
	$().ready(function(){
		
		$("#fileIcon").click(function(){
			
			$("#fileLink").toggle();
		});
		
		
		
	});
	
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
	padding-left: 10px;
}
#articleInfo {
	font-size: 14px;
	font-weight: normal;
	position: absolute;
	right: 20px;
	top : 15px;
}


#fileIcon {
	width: 20px; 
	height: 20px;
}

#fileBox {
	position : relative;
	text-align: right;
	margin: 10px 10px 0px 0px;
	cursor: pointer;
}
#fileLink {
	
	
	width : 150px;
	background-color : #e4e2e6;
	text-overflow : ellipsis; 
	font-size: 12px;
	text-decoration: none;
	display: none;
	position: absolute;
	right : 0px;
	top:  20px;
	white-space : nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	text-align: center;
	
}

</style>
	<div class="list" style="margin-top: 50px;">
		
		
		<div id="articleTitle">
			<span>${article.title}</span>   
			<span id="articleInfo">${article.memberVO.nickname}( ${article.memberId} ) | ${article.writeDate}</span>
		</div>
		
		
		
		
		<div id="articleBody">
			<c:if test="${not empty article.fileName}">
				<div id="fileBox">
					<span>
						<img id="fileIcon" src="<c:url value="/static/img/fileIcon.png"/>">
						<div id="fileLink"><a style="text-decoration: none; color: #000;" 
						href="<c:url value="/download/${article.id}"/>">${article.fileName}</a></div>
						
					</span>
				</div>
			</c:if>				

			${article.body}
		</div>
		
		
		
	</div>
</body>