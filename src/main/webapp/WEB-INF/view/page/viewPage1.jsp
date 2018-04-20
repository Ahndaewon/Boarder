<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/listPage.css"/>">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>">
</script>

<style>


.reply {
	text-align: left;
	border-collapse :collapse;
	border-top: 2px solid #c0c0c0;
	border-bottom: 2px solid #c0c0c0;
	/* border-left: 1px solid #c0c0c0;
	border-right: 1px solid #c0c0c0; */
	word-break: break-word;
	margin-top: 10px;
	
}
 
.reply:last-child {
	border-bottom : 1px solid #c0c0c0;
}
.body {
	border-top: 1px solid #c0c0c0;
	padding : 10px 10px;
	min-height : 50px;
	background-color: #FFF;
}
.replyInfo {
	width : 100%;
	background-color : #f5f5f5;
	overflow: auto;
	padding-top: 10px;
	padding-bottom: 10px;
}

#idSpan {
	float: left;
	font-size: 15px;
	color: #000;
	font-weight: bold;
	padding-left: 10px;
	
}
#dateSpan {
	float: right;
	font-size: 12px;
	color: #8e8e8e;
	padding-right: 10px;
}
#createReply {
	margin-top : 10px;
	text-align: right;
}
#writeReplyBtn {
	margin-right: 20px;
}
.reReply{
	margin: 10px;
	border: 3px solid #dcdcdc;
	width: 40px;
	text-align: center;
	cursor: pointer;
	border-style: outset;
}
</style>



<script type="text/javascript">
	$().ready(function(){
		
		<c:if test="${sessionScope.__REMOVE__ eq 'fail'}">
			alert("잘못된 경로로 접근하셨습니다.");
			<c:remove var="__REMOVE__" scope="session" />
			location.href = "<c:url value="/"/>";
		</c:if>
		
		
		
		
		
		var likeOff = "<img id='likeImg' style='width: 30px;' src='<c:url value='/static/img/like1.PNG'/>'>";
		var likeOn = "<img id='likeImg' style='width: 30px;' src='<c:url value='/static/img/like2.PNG'/>'>";
		var likeCount = "<span id='likeCount' style='font-weight : bold;'>&nbsp"+ ${count} +"</span>";
		
		var existsLike = "${exists}";
		
		if ( existsLike == "on" ) {
			$("#like").append(likeOn);
			$("#like").append(likeCount);
			
		}
		else {
			$("#like").append(likeOff);
			$("#like").append(likeCount);
		}
		
		loadReplies();
		
		function loadReplies(){
			
			$.get("<c:url value="/reply/${article.id}"/>",{},
					function(response){
						
						for( var i in response) {
							var replyDiv = $("<div class='reply'></div>");
							var replyInfo = $("<div class='replyInfo'><span id='idSpan'>" + response[i].memberId +"("+ response[i].memberVO.nickname+")</span></div>");
							var replyDate = $("<span id='dateSpan'>"+ response[i].registDate +"</span>");
							var body = $("<div class='body'>" + response[i].body  + "</div>");
							var reReply = $("<div class='reReply'>댓글</div>");
							replyDiv.append(replyInfo);
							replyInfo.append(replyDate);
							replyDiv.append(body);
							replyDiv.append(reReply);
							$("#replies").append(replyDiv);
						}
						changeHeight();
			});
			
		}
		
		function changeHeight(){
			var height = $(".innerBox").height();
			if ( height > 700 ) {
				$(".login").css("height", height);	
			}
			
		}
		
		
		$("#writeReplyBtn").click(function(){
			
			$.post("<c:url value="/reply/${article.id}"/>"
					, $("#writeReplyFrom").serialize(),
					function(response){
						
						if( response.isSuccess == "isSuccess" ){
							/* alert("댓글등록 성공"); */
						}
						else {
							alert("댓글등록 실패");
						}
						$("#replies").html("");
						loadReplies();
						$("#body").val("");
						
					});
		});
		
		$("#replies").on("click", ".reReply", function(){
			alert();
		});
		
		
		$("#like").on("click", "#likeImg" ,function(){
			$.get("<c:url value="/like/${article.id}"/>", {}, function(response){
				var count = response.count;
				var likeCount = "<span id='likeCount' style='font-weight : bold;'>&nbsp"+ count +"</span>";
				
				$("#likeImg").remove();
				$("#likeCount").remove();
				
				if ( response.isExists == "on" ) {
					$("#like").append(likeOn);
					$("#like").append(likeCount);
				}
				else {
					$("#like").append(likeOff);
					$("#like").append(likeCount);
				}
				
			}); 
		});
		
		
		
		$("#fileIcon").click(function(){
			
			$("#fileLink").toggle();
		});
		
		$("#listBtn1").click(function(){
			location.href="/category1?pagenum="+ ${pagenum};
		});
		$("#listBtn2").click(function(){
			location.href="/category1?pagenum="+ ${pagenum};
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
	<div class="list" style="margin-top: 50px;">
		
		<div id="articleTitle">
			<span>${article.title}
				<c:if test="${fn:contains(article.writeDate, 'h')}">
					<!--24시간 new-->
					<img style="width: 10px; height: 10px;" src="<c:url value="/static/img/iconew.gif"/>"/>
				</c:if>
			</span>   
			<span id="articleInfo">${article.memberVO.nickname}( ${article.memberId} )
			 | 조회수 : ${article.viewCount} |
			  <c:choose>
			<c:when test="${fn:contains(article.writeDate, 'h')}">
				${fn:replace(article.writeDate, "h", "")}
			</c:when>
			<c:otherwise>
				${article.writeDate}
			</c:otherwise>
		</c:choose>	
			</span>
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
			<div id="like" style="padding-bottom: 10px; padding-top: 10px;">
				
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
		
		
		
		
		<div id="createReply">
			
				<form id="writeReplyFrom">
					<input type="hidden" id="parentReplyId" name="parentReplyId" value="0"/>
					<div>
					<textarea id="body" name="body" style="width: 592px; height: 65px;"></textarea>
					</div> 
					
					<div>
						<input type="button" id="writeReplyBtn" value="등록"/>
					</div>
				</form>
			
		</div>
		<div id="replies"></div>
		<div id="createReplyDiv">
			<!-- 댓글 달기  -->
			
		</div>
		
	</div>
		
		
</body>