<%@page import="meeteat.controller.login.NaverLoginController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 네이버 로그인 -->    
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!-- //네이버 로그인 -->
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="149157505636-uj4fla31cohbbmom9j868qjvnig7tmfi.apps.googleusercontent.com">

<title>Insert title here</title>

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script src="https://apis.google.com/js/platform.js" async defer></script>

<script type="text/javascript">
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  
// 	  $.ajax({
// 		 	url: "/login/google"
// 		 	, data: {"user_id":profile.getId(), "user_nick":profile.getName(), "user_profile":profile.getImageUrl(), "user_email":profile.getEmail()}
// 	  		, type: "POST"
// 	  		, success : function(data) {
// 	  			console.log("구글 로그인 성공")
	  			
// 	  		},
// 	  		error : function() {
// 	  			console.log("구글 로그인 실패")
// 	  		}
// 	  });
	  
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  
	  location.href="/login/google"
}
</script>

<style type="text/css">

html,body {
  height: 100%;
}

body {
  display: -ms-flexbox;
  display: flex;
  -ms-flex-align: center;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
/*   background-color: #f5f5f5; */
  background-color: #fff;
  
/*     background-image:  linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ),url("https://i1.daumcdn.net/cfile2/image/995EC2465DCCBFCE10AC8C"); */
/*     background-image:  linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ),url("https://lh3.googleusercontent.com/proxy/KeLe1qjOA_uziRTyN45ciRJgBqh8_MZaoD6r6FW5ODT_K_igcvUtT7Ktphlsmg511NLhiXq_rUFM-p6crbgTThs8n4BjScV9XsotXY00QrDi0gS5lLFLi6IQ"); */
    background-image:  linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ),url("https://img.insight.co.kr/static/2017/03/14/700/FVB3R1EI6E270F71EU10.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;

}
  
.form-horizontal {
	  width: 100%;
	  max-width: 330px;
	  padding: 15px;
	  margin: auto;
	  border: 1px solid #adb5bd;
	  border-radius: 5px;
	  background-color: #F5F5F5;
}

.form-group > .col {
	margin: 0px 20px;
	text-align: center;
	
}

#logo{
	text-align:center;
/* 	margin-top:-8px; */
	}
	
#logo img{
    width:150px;
    height:150px;
}

#logo > h5 {
	margin: 0px;
	color: #adb5bd;
}

.loginFooter  {
	
	text-align: center;
	margin-top: 7px;
	color: #adb5bd;
/* 	color: #868e96;  */	/* 좀더 진한 회색 */ 
}

.or > h5 {
	text-align: center;
	color: #adb5bd;
}

.signupLink {
	text-align: center;
}

</style>
</head>



<body>

<div class="container">

<form action="/login/login" method="post" class="form-horizontal" id="loginForm">

<div class="loginBox" id="loginBox">

	<div id="logo">
		<a href="http://localhost:8088/"><img src="/resources/img/logo.png" alt="Logo"></a>
		<h5>MEET EAT</h5>
		<h5 style="margin-bottom: 20px;">로그인</h5>
		
	</div>
	

	<div class="form-group">
<!-- 		<label class="col-xs-3 control-label" for="user_id">아이디 : </label> -->
		<div class="col">
			<input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디"/>
		</div>
	</div>

	<div class="form-group">
<!-- 		<label class="col-xs-3 control-label" for="user_pw">패스워드 : </label> -->
		<div class="col">
			<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="비밀번호"/>
		</div>
	</div>
		
	<div class="form-group">
		<div class="col">
			<button class="btn btn-primary" id="loginBtn" style="transform:scale(1.1);  ">로그인</button>
		</div>
	</div>
	
</div>

<div class="or">
	<h5>또는</h5>
</div>

<!-- sns 로그인 -->
<div class="snsLoginBox"> 

  <!-- 네이버 로그인 창으로 이동 -->
	<div id="naver_id_login" style="text-align:center">
		<a href="${naverUrl }">
			<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
		</a>
	</div>
	<br>


<!-- 구글로그인버튼 -->
<!-- 	<div class="g-signin2" data-onsuccess="onSignIn" style="width: 223px;"></div> -->

</div> <!-- //sns 로그인 -->

<div class="signupLink">
	<a href="/login/signup" class="btn">계정만들기</a>
</div>

</form>
<div class="loginFooter">
	© 2020 MEET&EAT All rights reserved.
</div>





 



</div><!-- .container -->

<%-- <c:import url="/WEB-INF/views/layout/footer.jsp" /> --%>

</body>

<style type="text/css">
.failAction {animation: motion 0.1s linear 0s 3 alternate; margin-top: 0;}
@keyframes motion {
	0% {transform: translate(10px,0px);}
	25% {transform: translate(0px,0px);}
	50% {transform: translate(-10px,0px);}
	100% {transform: translate(0px,0px);}
}  
</style>


<script type="text/javascript">
$(document).ready(function() {
	
	
	$('#loginBtn').click(function(e) {
	
		var user_id = $('#user_id').val();
		var user_pw = $('#user_pw').val();
		
		e.preventDefault();
		
		if($('#loginForm').hasClass('failAction')) {
			$('#loginForm').removeClass('failAction');
		}
		
		$.ajax({
			url: '/login/logincheck' ,
			data : {
				"user_id": user_id,
				"user_pw": user_pw
			},
			dataType : 'json',
			type: "get",
			success: function(checkResult) {
				if(checkResult) {
					$('#loginForm').submit();
				} else {
					$('#loginForm').addClass('failAction');	
				}
			},
			error: function() {
				console.log("[ajax] /login/logincheck 전송실패")
				
			}
		})
	})
	
})

</script>

</html>