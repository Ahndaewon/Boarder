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

#passInfo {
		font-size : 11pt;
		color : #FF9999;
	}
	
div.btnBox{
	width: 150px;
	padding : 10px 0px 10px 0px;
	background-color: #FFCAD5;
	display: inline-block;
	text-align: center;
	cursor: pointer;
}
.chnPassword, .valid, .invalid, .blank {
	width: 300px;
	height: 50px;
	
}

.valid {
		background-color: #99FF99;
	}

.invalid {
	background-color: #FF9999;
}
.blank {
	background-color: #FFF;
}


</style>
<script type="text/javascript">

function passCheck() {
	var passwordConfirm = $("#password-confirm").val();
	var password = $("#password").val();
	
	if ( passwordConfirm != "" ) {
		
		if ( passwordConfirm == password ) {
			$("#password-confirm").removeClass();
			$("#password-confirm").addClass("valid");
		}
		
		else {
			$("#password-confirm").removeClass();
			$("#password-confirm").addClass("invalid");
		}
	}
	
	else {
		$("#password-confirm").removeClass();
		$("#password-confirm").addClass("blank");
	}
	
}



	$().ready(function(){
		
		$("#password").keyup(function(){
			var value = $(this).val();
			var passwordConfirm = $("#password-confirm").val();
			var regPassword = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
			/* 영문, 숫자 혼합하여 6~20자리 이내 */
			if ( value != "" ) {
				
				if( regPassword.test(value) ) {
					$("#password").removeClass();
					$("#password").addClass("valid");
					$("#passInfo").hide();
				}
				else {
					$("#password").removeClass();
					$("#password").addClass("invalid");
					$("#passInfo").show();
				}
				
				if( passwordConfirm != "" ) {
					passCheck();
				}
			}
			
			else {
				$("#password").removeClass();
				$("#password").addClass("blank");
				$("#passInfo").show();
			}
		});
		
		
		$("#password-confirm").keyup(function(){
			passCheck();
		});
		
		
		
		$("#confirm").click(function(){
			
			if( $("#password").hasClass("invalid") || $("#password-confirm").hasClass("invalid") ) {
				alert("비밀번호를 확인하세요");
				return false;
			}
			
			$("#changePassForm").attr({
				"action" : "<c:url value="/changepw"/>",
				"method" : "post"
			}).submit();
		});
		
		
		$("#cancel").click(function(){
			location.href = "<c:url value="/"/>";
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
   --><div class="totalList">
      	<div class="innerBox">
      		<div style="margin-top: 150px;">
	      		<h3>비밀번호 변경</h3>
	      		
	      		<div id="inputBox">
	      		<form id="changePassForm">
	      			<div>
	      				<input type="password" id="password" name="password" class="chnPassword" placeholder="비밀번호 입력">
	      				<p id="passInfo">영문, 숫자 혼합하여 6~20자리 이내 </p>
	      			</div>
	      			<div>
	      				<input type="password" id="password-confirm" name="password-confirm" class="chnPassword" placeholder="비밀번호 확인">
	      			</div>
	      			
	      			<div id="confirm" class="btnBox">
	      				확인
	      			</div>
	      			<div id="cancel" class="btnBox" style="background-color: #aaaaaa;">
	      				취소
	      			</div>
	      		</form>
      		</div>
      		
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