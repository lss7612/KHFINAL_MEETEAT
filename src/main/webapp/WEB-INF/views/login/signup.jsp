<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

</head>
<body>

<div class="container">

<h1 style="text-align:center; margin-top: 100px;">회원가입</h1>

<hr style="margin: 50px; 0px;">

<form id="signUpForm" action="/login/signup" method="post">

  <div class="form-group">
    <label for="user_id">아이디</label>
    <input type="text" class="form-control" id="user_id" name="user_id">
  </div>
  
  <div id="idCheckResult"></div>
  
  <div class="form-group">
    <label for="user_pw">비밀번호</label>
    <input type="password" class="form-control" id="user_pw" name="user_pw">
  </div>
  
  <div class="form-group">
    <label for="passwordCheck">비밀번호확인</label>
    <input type="password" class="form-control" id="passwordCheck">
  </div>

  <div id="pwCheckResult"></div>

  <div class="form-group">
    <label for="user_nick">닉네임</label>
    <input type="text" class="form-control" id="user_nick" name="user_nick">
  </div>

  <div id="nickCheckResult"></div>

  <div class="form-group">
    <label for="user_email">Email</label>
    <input type="email" class="form-control" id="user_email" name="user_email" aria-describedby="emailHelp">
<!--     <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  
  <input type="hidden" name="user_profileorigin" value="https://i.pinimg.com/474x/34/c2/f9/34c2f984350ed23d1efa7094d7923c5a.jpg">
  <input type="hidden" name="user_profilestored" value="https://i.pinimg.com/474x/34/c2/f9/34c2f984350ed23d1efa7094d7923c5a.jpg">

  <div class="form-group">
    <label for="user_age">나이대</label>
    <select class="form-control" id="user_age" name="user_age">
      <option value="10-19">10대</option>
      <option value="20-29">20대</option>
      <option value="30-39">30대</option>
      <option value="40-49">40대</option>
      <option value="50-59">50대</option>
    </select>
  </div>
  
  
    <label for="hidden">성별</label>
	<div class="form-check form-check-inline">
	  <input class="form-check-input" type="radio" name="user_gender" id="user_genderM" value="M" checked="checked">
	  <label class="form-check-label" for="user_genderM">남</label>
	</div>
	<div class="form-check form-check-inline">
	  <input class="form-check-input" type="radio" name="user_gender" id="user_genderF" value="F">
	  <label class="form-check-label" for="user_genderF">여</label>
	</div>

	<div id="submitResult" style="margin-top: 50px; margin-bottom: 10px;"></div>
	<div class="form-group">
	  <button id="signUpSubmit" class="btn btn-primary" style="margin-bottom: 100px;">가입하기</button>
	</div>
  
  
</form>


</div><!-- //container -->

<script type="text/javascript">
$(document).ready(function() {
	
	var idx = true;
	
	$('#signUpSubmit').click(function(){
		
		if($.trim($('#user_id').val()) == ''){
			$('#submitResult').text("아이디를 입력해주세요");
			$('#submitResult').css("color", "red");
			$('#user_id').focus();
			return false;
			
		} else if($.trim($('#user_pw').val()) == ''){
			$('#submitResult').text("비밀번호를 입력해주세요");
			$('#submitResult').css("color", "red");
			$('#user_pw').focus();
			return false;
			
		} else if($.trim($('#passwordCheck').val()) == ''){
			$('#submitResult').text("비밀번호를 확인해주세요");
			$('#submitResult').css("color", "red");
			$('#passwordCheck').focus();
			return false;
			
		} else if($.trim($('#user_nick').val()) == '') {
			$('#submitResult').text("닉네임을 입력해주세요");
			$('#submitResult').css("color", "red");
			$('#user_nick').focus;
			return false;
			
		} else if($.trim($('#user_email').val()) == '') {
			$('#submitResult').text("이메일을 입력해주세요");
			$('#submitResult').css("color", "red");
			$('#user_email').focus;
			return false;
		}
		
		else {
			$('#signUpForm').submit();
		}
		
	});
	
	$('#user_id').blur(function() {

		var user_id = $('#user_id').val();
		
		$.ajax({
			url: '/login/idcheck?user_id='+ user_id,
			type: "get",
			success: function(checkResult) {
				if(checkResult) {
					$('#idCheckResult').text("사용중인 아이디입니다");
					$('#idCheckResult').css("color", "red");
					$("#signUpSubmit").attr("disabled", true);
				} else {
					$('#idCheckResult').text("");					
					$("#signUpSubmit").attr("disabled", false);
				}
			},
			error: function() {
				console.log("[ajax] /login/idcheck 전송실패")
				
			}
		})
	});
	
	$('#user_nick').blur(function() {

		var user_nick = $('#user_nick').val();
		
		$.ajax({
			url: '/login/nickcheck?user_nick='+ user_nick,
			type: "get",
			success: function(checkResult) {
				if(checkResult) {
					$('#nickCheckResult').text("사용중인 닉네임입니다");
					$('#nickCheckResult').css("color", "red");
					$("#signUpSubmit").attr("disabled", true);
				} else {
					$('#nickCheckResult').text("");					
					$("#signUpSubmit").attr("disabled", false);
				}
			},
			error: function() {
				console.log("[ajax] /login/nickcheck 전송실패")
				
			}
		})
	});
	
	
	$('#user_pw').blur(function() {
		if($('#user_pw').val() != $('#passwordCheck').val()) {
			$('#pwCheckResult').text("비밀번호가 다릅니다");
			$('#pwCheckResult').css("color", "red");
			$("#signUpSubmit").attr("disabled", true);
		} else {
			if(!$.trim($('#user_pw').val()) == '') {
				$('#pwCheckResult').text("비밀번호가 일치합니다");
				$('#pwCheckResult').css("color", "green");
				$("#signUpSubmit").attr("disabled", false);
			}
		}
	})
	
	$('#passwordCheck').blur(function() {
		if($('#user_pw').val() != $('#passwordCheck').val()) {
			$('#pwCheckResult').text("비밀번호가 다릅니다");
			$('#pwCheckResult').css("color", "red");
			$("#signUpSubmit").attr("disabled", true);
		} else {
			if(!$.trim($('#passwordCheck').val()) == '') {
				$('#pwCheckResult').text("비밀번호가 일치합니다");
				$('#pwCheckResult').css("color", "green");
				$("#signUpSubmit").attr("disabled", false);
			}
		}
	})
	

		
	
})
</script>

</body>
</html>