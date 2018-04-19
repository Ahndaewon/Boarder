<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/main.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/category1.css"/>"> 
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>">
</script>
		<title>category1</title>
	</head>
<style>
.list1 {
	margin-top: 150px; 
	border: 3px solid #dcdcdc;
	border-radius: 15px;
}
.list1 div {
	width: 150px;
	background-color: #dcdcdc;
	padding-bottom: 20px;
	padding-top: 20px;
	cursor: pointer;
	display: inline-block;
	font-weight: bold;
	border: 2px solid #000;
}

</style>	
<script type="text/javascript">
	
	
	$().ready(function(){
		
		
		
		
		$(".list1").children().last().click(function(){
			location.href = "<c:url value="/"/>"
		});
		
	});
	
	
	
	
	
</script>	
<body>
	    <div id="wrapper">

       <!--main-->
     <div class="main">
         <a href="<c:url value="/"/>">main</a>
     </div>

     <!--total-->
     <div class="total">
       <!-- login,, category list-->
         <div class="login">
          <!--login-->
     <jsp:include page="/WEB-INF/view/login.jsp"></jsp:include>


         </div><!--

	
         total list
   --><div class="totalList1">
      	<div class="innerBox">
      		<div class="list1">
				<p>&nbsp</p>
				<p>&nbsp</p>
				<p>요청하신 아이디는</p>
				<p>${id} 입니다.</p>
			
				<div>메인으로</div>		
	
			</div>
      		
      	</div>
      </div>
      	




     </div>

	 <div>
	 	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
	 </div>
	

   </div>
	
</body>
</html>