<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/listPage.css"/>">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>">
</script>

<script type="text/javascript">
	$().ready(function(){
		
		
		
		<c:if test="${sessionScope.__REMOVE__ eq 'fail'}">
			alert("잘못된 경로로 접근하셨습니다.");
			<c:remove var="__REMOVE__" scope="session" />
			location.href = "<c:url value="/"/>";
		</c:if>
		
		$("#fileIcon").click(function(){
			
			$("#fileLink").toggle();
		});
		
		$("#listBtn1").click(function(){
			$(location).attr("href", "<c:url value="/category1"/>");
		});
		$("#listBtn2").click(function(){
			$(location).attr("href", "<c:url value="/category1"/>");
		});
		
		$("#removeBtn").click(function(){
			$(location).attr("href", "<c:url value="/remove/${article.id}"/>");
			
		});
		
		$("#modifyBtn").click(function(){
			$(location).attr("href", "<c:url value="/modify/${article.id}"/>");
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

.selectBtn {
	width: 150px;
	background-color: #c8c8ce;
	vertical-align : middle;
	display: inline-block;
	padding: 10px;
	cursor: pointer;
	
	
}

#listBtn1 {
	border-top-left-radius: 10px; 
	border-bottom-left-radius: 10px
}

#listBtn2 {
	border-radius: 10px;
}

#removeBtn {
	border-top-right-radius: 10px; 
	border-bottom-right-radius: 10px;
}
#modifyBtn {
	margin : 0px 5px 0px 5px;
}

</style>
	<div class="list" style="margin-top: 50px;">
		
		
		<div id="articleTitle">
			<span>${article.title}</span>   
			<span id="articleInfo">${article.memberVO.nickname}( ${article.memberId} )
			 | 조회수 : ${article.viewCount} | ${article.writeDate}</span>
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
		<c:if test="${ sessionScope.__USER__.id ne	article.memberId}">
			<div id="listBtn2" class="selectBtn">
			목록
			</div>	
		</c:if>
		
			
		
		<c:if test="${ sessionScope.__USER__.id eq	article.memberId}">
			<div id="listBtn1" class="selectBtn">
				목록
			</div>
			
			<div id="modifyBtn" class="selectBtn">
				수정
			</div>
			
			<div id="removeBtn" class="selectBtn">
				삭제
			</div>
		</c:if>
		
</body>