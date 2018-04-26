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
#createReply, #createReReply {
	margin-top : 10px;
	text-align: right;
}
#writeReplyBtn, #writeReReplyBtn {
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

	function page(idx){
		var replyPagenum = idx;
		location.href="/view/"+ ${article.id} +"?replyPagenum=" + replyPagenum;
		
	}



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
			
			$.get("<c:url value="/reply/${article.id}"/>",{  },
					function(response){
				
						
						
						for( var i in response) {
							var padding = 0;
							var loginId = "${sessionScope.__USER__.id}"
							if ( response[i].level == 2 ) {
								padding = 30;
							}
							else if ( response[i].level >= 3 ) {
								padding = 50;
							}
							else {
								padding = 0;
							}
							var replyDiv = $("<div style='padding-left:" + padding + "px;' class='reply' data-memberId="+ response[i].memberId +
											" data-id=" + response[i].id + "></div>");
							
							var replyInfo = $("<div class='replyInfo' data-memberid=" + response[i].memberId + 
											" data-level="+ response[i].level +"><span id='idSpan'>" + response[i].memberId + 
											"("+ response[i].memberVO.nickname+")</span></div>");
							
							var replyDate = $("<span id='dateSpan'>"+ response[i].registDate +"</span>");
							var body = $("<div class='body'>" + response[i].body  + "</div>");
							
							
							/* var memberId = $(".replyInfo[ data-level='"+ (response[i].level-1) + "']").data("memberid");
							
							if ( response[i].level >= 3) {

								console.log( memberId );
								body = $("<div class='body'><span style='font-weight : bold'>@" + memberId + "</span> "+ response[i].body  + "</div>"); 

							} */
							 
							replyDiv.append(replyInfo);
							replyInfo.append(replyDate);
							replyDiv.append(body);
							
							if ( loginId != response[i].memberId ) { 
								var reReply = $("<div class='reReply'>댓글</div>");
								replyDiv.append(reReply);
							}
							
							$("#replies").append(replyDiv);
						}
						changeHeight();
						
			});
			
		}
		
		$("#body").click(function(){
			$("#createReReply").css("display", "none");
		});
		
		function changeHeight(){
			var height = $(".innerBox").height();
			if ( height > 700 ) {
				$(".login").css("height", height);	
			}
		}
		
		
		
		/* 			  대댓글			 */
		$("#writeReReplyBtn").click(function(){
			
			var length = $("textarea.body").val().length;
			
			if ( length == 0 ) {
				alert("내용을 입력하세요");
				$("textarea.body").focus();
				return false;
			}
			
			var level = $(this).closest(".reply").children(".replyInfo").data("level");
			
			if ( level >= 2 ) {
				var memberId = $(this).closest(".reply").data("memberid");
				var textarea = "<span style='font-weight : bold'>┗  @" + memberId + "&nbsp&nbsp&nbsp</span>";
				textarea += $("textarea.body").val();
				$("textarea.body").val(textarea);
			} 
			
			
			$.post("<c:url value="/reply/${article.id}"/>"
					, $("#writeReReplyFrom").serialize(),
					function(response){
						
						if( response.isSuccess == "isSuccess" ){
							/* alert("댓글등록 성공"); */
						}
						else {
							alert("댓글등록 실패");
						}
						$("#replies").html("");
						loadReplies();
						$(".body").val("");
						
					});
						var idx = "${replyPager.pageNum}";
						page(idx);
		});
		
		
		
		/*        댓글       */
		$("#writeReplyBtn").click(function(){
			
			
			var length = $("textarea#body").val().length;
			
			if ( length == 0 ) {
				alert("내용을 입력하세요");
				$("textarea#body").focus();
				return false;
			}
			
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
						var idx = "${replyPager.pageNum}";
						page(idx);
		});
		
		$("#replies").on("click", ".reReply", function(){
			var parentReplyId = $(this).closest(".reply").data("id");
			$("textarea.body").val("");
			/* ToDO - 대댓글 나갈때 확인버튼 */
			$(".parentReplyId").val(parentReplyId);
			$("#createReReply").css("display", "block");
			$("#createReReply").appendTo($(this).closest(".reply"));
			changeHeight();
			
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
					<textarea id="body" name="body" style="width: 99%; height: 65px;"></textarea>
					</div> 
					<div>
						<input type="button" id="writeReplyBtn" value="등록"/>
					</div>
				</form>
		</div>
		
		<div id="createReReply" style="display: none">
			
				<form id="writeReReplyFrom" >
					<input type="hidden" class="parentReplyId" name="parentReplyId" value="0"/>
					<div>
					<textarea class="body" name="Body" style="width: 96%; height: 65px;"></textarea>
					</div> 
					<div>
						<input type="button" id="writeReReplyBtn" value="등록"/>
					</div>
				</form>
		</div>
		
		
	
		
		
		
		<div id="replies"></div>
		<div id="createReplyDiv">
			<!-- 댓글 달기  -->
			
		</div>
		<div id="pageBox">
			<c:if test="${replyPager.totalCount > 0 }">
				<c:if test="${replyPager.prev}">
							<a href="javascript:page(${replyPager.startPage}-1)">이전&nbsp</a>
						</c:if>
						
						<c:forEach begin="${replyPager.startPage}" end="${replyPager.endPage}" var="idx"> 
							<c:choose>
								<c:when test="${replyPager.pageNum eq idx}">
									<a style="font-weight: bold; color: #000;" href="javascript:page(${idx})">${idx}&nbsp</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:page(${idx})">${idx}&nbsp</a>
								</c:otherwise>
								
							</c:choose>
					
						</c:forEach>
						
						<c:if test="${replyPager.next}">
							<a href="javascript:page(${replyPager.getEndPage()+1})">다음</a>
						</c:if>
				</c:if>			
		</div>
	</div>
		
		
</body>