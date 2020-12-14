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

</head>
<body>

<div class="container">

<h1>로그인</h1>
<hr>
<div>
<form action="/login/login" method="post" class="form-horizontal">
	<div class="form-group">
		<label class="col-xs-3 control-label" for="id">아이디 : </label>
		<div class="col-xs-6">
			<input type="text" class="form-control" id="id" name="user_id" placeholder="Id"/>
		</div>
	</div>

	<div class="form-group">
		<label class="col-xs-3 control-label" for="pw">패스워드 : </label>
		<div class="col-xs-6">
			<input type="password" class="form-control" id="pw" name="user_pw" placeholder="Password"/>
		</div>
	</div>
		
	<div class="form-group">
		<div class="col-xs-offset-3 col-xs-10">
			<button class="btn btn-primary">로그인</button>
			<input type="reset" id="cancel" class="btn btn-danger" value="취소"/>
		</div>
	</div>
</form>
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

</div>
<!-- //sns 로그인 -->


</div><!-- .container -->

</body>
</html>