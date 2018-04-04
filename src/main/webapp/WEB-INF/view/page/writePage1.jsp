<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/listPage.css"/>">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>">
</script>
<style>
	#title {
		width: 300px;
	}
	
	#body {
		width: 300px;
		height: 300px;
	}
	#bodyBox {
		vertical-align: top;
	}

</style>
<script type="text/javascript">

	$().ready(function(){
		
		$("#writeBtn").click(function(){
			
			$("#articleForm").attr({
				"method" : "post",
				"action" : "<c:url value="/write1"/>"
				
			}).submit();
			
		});
		
		
		
		
	});

</script>

<body>

	<div class="list">
		
		
		
		
		<div>
			<form:form modelAttribute="articleForm">
				<p></p>
				<div>
					<input type="text" id="title" name="title" placeholder="제목을 입력하세요" >
				</div>
				
				<div id="bodyBox">
					<textarea id="body" name="body" placeholder="내용을 입력하세요"></textarea>
				</div>
				
				<div>
					<input type="button" id="writeBtn" value="글쓰기">
				</div>
				
			</form:form>
		
		
		</div>
		
		
		
	</div>
</body>