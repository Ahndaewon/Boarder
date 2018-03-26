<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/joinPage.css"/>">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>">
</script>
<style>
	.valid {
		background-color: #99FF99;
	}

	.invalid {
		background-color: #FF9999;
	}

	.blank {
		background-color: #FFF;
	}
	#passInfo, #idInfo, #emailInfo {
		font-size : 9pt;
		color : #FF9999;
	}
	#emailInfo {
		display : none;
	}


</style>
<script type="text/javascript">

	function inputCheck (){
		
		
		
		
		if ( $("#id").hasClass("valid") && $("#password").hasClass("valid") && 
				$("#passwordConfirm").hasClass("valid") && $("#name").hasClass("valid") &&
				 $("#nickname").hasClass("valid") && $("#email").hasClass("valid") ) {
			alert("");
			
		}
		
		else {
		}
		
	}


	function passCheck() {
		var passwordConfirm = $("#passwordConfirm").val();
		var password = $("#password").val();
		
		if ( passwordConfirm != "" ) {
			
			if ( passwordConfirm == password ) {
				$("#passwordConfirm").removeClass();
				$("#passwordConfirm").addClass("valid");
			}
			
			else {
				$("#passwordConfirm").removeClass();
				$("#passwordConfirm").addClass("invalid");
			}
		}
		
		else {
			$("#passwordConfirm").removeClass();
			$("#passwordConfirm").addClass("blank");
		}
		
	}
	
	

	
	$().ready(function(){
		
		$("#id").keyup(function(){
			var value = $(this).val();
			var regId = /^[A-Za-z0-9]{4,12}$/;
			/* 4 ~ 12 자리 영(대,소), 숫자 만 입력 받기 */
			
			
			if( value != "" ) {
				
				if( !regId.test(value) ) {
					$("#id").removeClass();
					$("#id").addClass("blank");
					$("#idInfo").show();
					
				}	
				
				else {
					$("#idInfo").hide();
					$.post("<c:url value="/api/exists/id"/>",
							{ id : value },
							function(response){
								
								if ( response.response ) {
									$("#id").removeClass();
									$("#id").addClass("invalid");
								}
								
								else {
									$("#id").removeClass();
									$("#id").addClass("valid");
								}
					});
					
						
				}
				
			}
			else {
				$("#id").removeClass();
				$("#id").addClass("blank");
				$("#idInfo").show();
			}
			
			inputCheck ();
			
		});
		
		$("#password").keyup(function(){
			var value = $(this).val();
			var passwordConfirm = $("#passwordConfirm").val();
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
		
		
		$("#passwordConfirm").keyup(function(){
			passCheck();
		});
		
		$("#name").keyup(function(){
			var name = $("#name").val();
			var confirm = /^[가-힣]{2,4}$/;
			/* 한글 이름 2~4자 이내 */
			if( name != "" ){
				
				if ( confirm.test(name) ) {
					$("#name").removeClass();
					$("#name").addClass("valid");
				}
				else {
					$("#name").removeClass();
					$("#name").addClass("invalid");
				}
			}
			else {
				$("#name").removeClass();
				$("#name").addClass("blank");
			}
			
		});
		
		$("#nickname").keyup(function(){
			var value = $(this).val();
			/* var regNickname = /^[A-Za-z][A-Za-z0-9]{2,13}$/;  */
			/* 영(대,소)로 시작하고 영(대,소)나 숫자로 끝나는 3글자에서 14글자 */
			if( value != "" ) {
					
				$.post("<c:url value="/api/exists/nickname"/>",
						{ nickname : value },
						function(response){
							
							if ( response.response ) {
								$("#nickname").removeClass();
								$("#nickname").addClass("invalid");
							}
							
							else {
								$("#nickname").removeClass();
								$("#nickname").addClass("valid");
							}
				});
				
			}
			else {
				$("#nickname").removeClass();
				$("#nickname").addClass("blank");
			}
		});
		
		
				$("#email").keyup(function(){
					var value = $(this).val();
					var regEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/; 
					/* 이메일 유효성 체크 */
					
					
					if( value != "" ) {
						
						if ( !regEmail.test(value) ) {
							$("#emailInfo").show();
							$("#email").removeClass();
							$("#email").addClass("blank");
						}
						
						else {
							$("#emailInfo").hide();
							$.post("<c:url value="/api/exists/email"/>",
									{ email : value },
									function(response){
										
										if ( response.response ) {
											$("#email").removeClass();
											$("#email").addClass("invalid");
										}
										
										else {
											$("#email").removeClass();
											$("#email").addClass("valid");
										}
							});
							
						}
					}
					else {
						$("#email").removeClass();
						$("#email").addClass("blank");
					}
				});
		
		
		
		
		
		
		
		
		$("#submitBtn").click(function(){
											
			$("#joinform").attr({
				"action" : "<c:url value="/join"/>",
				"method" : "post"
			}).submit(); 
			
		});
		
	});
	
</script>


	<div class="list">
		 <h3>회원가입</h3>
		 <hr/>
		 
		 <div style="display: inline-block; width:300px; text-align: right;">
		 	 <form:form modelAttribute="joinform">
			 
			 	<div id="idBox">
			 		<p> *  아이디 : <input type="text" id="id" name="id" placeholder="아이디" value="${joinform.id}" ></p>
			 		<p id="idInfo">4 ~ 12 자리 영(대,소), 숫자 만 입력<p>
					<form:errors path="id"/>
				</div>
			 	
			 	<div id="passBox">
				 	<p> * 비밀번호: <input type="password" id="password" name="password" placeholder="비밀번호" value="${joinform.password}"></p>
				 	<p id="passInfo">영문, 숫자 혼합하여 6~20자리 이내 </p>
			 	<!--비밀번호 체크필요  -->
					<form:errors path="password"/>
				</div>
			 	
			 	<div id="passConfrimBox">
				 	<p> * 비밀번호: <input type="password" id="passwordConfirm" placeholder="비밀번호확인" value="${joinform.password}"></p>
					<form:errors path="password"/>
				</div>
			 	
			 	<div id="nameBox">
				 	<p> *  이  름 : <input type="text" id="name" name="name" placeholder="이 름" value="${joinform.name}"></p>
					<form:errors path="name"/>
				</div>
				
			 	<div id="nicknameBox">
				 	<p>*nickname : <input type="text" id="nickname" name="nickname" placeholder="닉네임" value="${joinform.nickname}"></p>
					<form:errors path="nickname"/>
				</div>
				
			 	<div id="emailBox">
				 	<p>*  e-mail : <input type="text" id="email" name="email" placeholder="email" value="${joinform.email}"></p>
				 	<p id="emailInfo" >잘못된형식의 email입니다.</p>
					<form:errors path="email"/>
				</div>
								
			 	<p>
			 		<button type="submit" id="submitBtn"  >Sign Up</button>
			 		&nbsp;&nbsp;&nbsp;
			 		<a href="<c:url value="/"/>"><button type="button" id="cancelBtn" disabled="disabled">Cancel</button></a>
			 	</p>
			 	
			 </form:form>
		 </div>
		 
	</div>

