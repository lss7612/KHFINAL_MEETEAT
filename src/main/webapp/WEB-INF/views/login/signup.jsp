<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEET & EAT</title>

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>




<style type="text/css">
@font-face {
    font-family: 'NEXON Lv2 Gothic';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
	font-family: 'NEXON Lv2 Gothic';
}


html,body {
  height: 100%;
}

body {
  display: -ms-flexbox;
  display: flex;
  -ms-flex-align: center;
  align-items: center;
  padding: 30px 20px;
  background-color: #f5f5f5;
  
    background-image:  linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ),url("https://cdn.pixabay.com/photo/2017/05/18/06/29/cafe-2322672_960_720.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

.signUpForm {
	  width: 100%;
	  max-width: 500px;
	  padding: 15px;
	  margin: auto;
	  border: 1px solid #adb5bd;
	  border-radius: 5px;
	  background-color: #f5f5f5;
	  
}

#logo{
	text-align:center;
/* 	margin-top:-8px; */
	}
	
#logo img{
    width:150px;
    height:150px;
}

#logo > h3 {
	margin: 0px;
	color: #fff;
/* 	color: #adb5bd; */
}

#pwCheckResult {
	margin-bottom: 20px;
}


</style>

</head>
<body>


<div class="container" id="divpage">

<div id="logo">
	<a href="http://localhost:8088/"><img src="/resources/img/logo.png" alt="Logo"></a>
<!-- 	<h3>MEET EAT</h3> -->
	<h3 style="margin-bottom: 20px;">회원가입</h3>
</div>
	

<!-- <h1 style="text-align:center; margin-bottom: 30px; color: #adb5bd;">MEET EAT 회원가입</h1> -->

<!-- <hr style="margin: 50px; 0px;"> -->

<form class="signUpForm" id="signUpForm" action="/login/signup" method="post">

  <div class="form-group">
    <label for="user_id">아이디</label>
    <input type="text" class="form-control" id="user_id" name="user_id" maxlength="15">
    <p style="margin: 0;"> 영어소문자로 시작해야하며 영어소문자+숫자 4자이상 15자 이내 </p>
	  <div id="idCheckResult"></div>
  </div>
  
  
  <div class="form-group">
    <label for="user_pw">비밀번호</label>
    <input type="password" class="form-control" id="user_pw" name="user_pw">
  </div>
  
  <div class="form-group">
    <label for="passwordCheck">비밀번호확인</label>
    <input type="password" class="form-control" id="passwordCheck">
	  <div id="pwCheckResult"></div>
  </div>


  <div class="form-group">
    <label for="user_nick">닉네임</label>
    <input type="text" class="form-control" id="user_nick" name="user_nick"  onKeyUp="javascript:fnChkByte(this,'20')">
	<p style="margin: 0;"> 닉네임은 20Bytes를 초과할 수 없습니다. </p>
	  <div id="nickCheckResult"></div>
  </div>
	
	

  <div class="form-group">
    <label for="user_email">Email</label>
    <input type="email" class="form-control" id="user_email" name="user_email" aria-describedby="emailHelp">
<!--     <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  
<!--   <input type="hidden" name="user_profileorigin" value="https://i.pinimg.com/474x/34/c2/f9/34c2f984350ed23d1efa7094d7923c5a.jpg"> -->
<!--   <input type="hidden" name="user_profilestored" value="https://i.pinimg.com/474x/34/c2/f9/34c2f984350ed23d1efa7094d7923c5a.jpg"> -->

<!-- 2020 12 29 프로필 기본이미지로 수정 -->
<!--   <input type="hidden" name="user_profileorigin" value="기본이미지.jpg"> -->
<!--   <input type="hidden" name="user_profilestored" value="기본이미지.jpg22aa9420a19d"> -->

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

	<div id="submitResult" style="margin-bottom: 10px;">　</div>
	<div class="form-group" align="center">
	  <button id="signUpSubmit" class="btn btn-primary">가입하기</button>
	  <a href="#" onClick="history.go(-1)"><input type="button" class="btn btn-danger" value="뒤로가기"/></a>
	</div>
  
  
</form>


</div><!-- //container -->

<script type="text/javascript">

function checkEmail(str) {                                                 

     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

     if(!reg_email.test(str)) {   
          return false;       
     } else {               
          return true;         
     }                            

}


function fnChkByte(obj, maxByte) {
	
    var str = obj.value;
    var str_len = str.length;

    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";

    for(var i=0; i<str_len; i++) {
    	
        one_char = str.charAt(i);
        
        if(escape(one_char).length > 4) {
            rbyte += 3;                                         //한글 3Byte
        } else {
            rbyte++;                                            //영문 등 나머지 1Byte
        }

        if(rbyte <= maxByte) {
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }

     if(rbyte > maxByte) {
		  // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
// 		  alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")

		  str2 = str.substr(0,rlen);                                  //문자열 자르기
		  obj.value = str2;
		  fnChkByte(obj, maxByte);
     } else {
//         document.getElementById('byteInfo').innerText = rbyte;
     }
}

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
			if(checkEmail($('#user_email').val())) {
				$('#submitResult').text("");
				$('#signUpForm').submit();
			} else {
				$('#submitResult').text("이메일형식에 맞게 작성해주세요");
				$('#submitResult').css("color", "red");
				return false;
			}
		}
		
	});
	
	$('#user_id').blur(function() {
		
		var idReg = /^[a-z]+[a-z0-9]{4,14}$/g;
		
		if(!idReg.test($('#user_id').val())) {
			$('#idCheckResult').text("아이디 형식에 맞지 않습니다.");
			$('#idCheckResult').css("color", "red");
			$("#signUpSubmit").attr("disabled", true);
			
		} else {
			
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
			}) //ajax끝
			
		}

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