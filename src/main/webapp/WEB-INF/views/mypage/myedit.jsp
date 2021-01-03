<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="/resources/css/mypage/myedit.css">

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>  

<script type="text/javascript">

function checkEmail(str) {                                                 
     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

     if(!reg_email.test(str)) {   
          return false;       
     } else {               
          return true;         
     }                            

}

$(document).ready(function() {
	

// 	$('#user_pw').val('${userinfo.user_pw}');
// 	$('#user_email').val('${userinfo.user_email}');
// 	$('#user_nick').val('${userinfo.user_nick}');
	
	if(${snsLogin}) {
		$('#user_pw').attr('readonly', 'readonly');
		$('#checkpw').attr('readonly', 'readonly');
		
		$('#user_pw').val('${userinfo.USER_PW}');
		$('#checkpw').val('${userinfo.USER_PW}');
	}

	$("input").keyup(function(){
	      var pw1 = $("#user_pw").val();
	      var pw2 = $("#checkpw").val();
	      var idx1 = true;
	      
	      if(pw1 != "" || pw2 != "") {
	          if(pw1 == pw2){ 
	             $('#alert-success').show();
	             $('#alert-fail').hide();       
	          } else{
	             $('#alert-success').hide();
	             $('#alert-fail').show();
	             return false;
	          }
	       }
	})

	$('#editBtn').click(function(){
		
		var idx = true;
		
		if($.trim($('#user_pw').val()) == ''){
			$('#submitResult').text("비밀번호를 입력해주세요");
			$('#submitResult').css("color", "red");
			$('#user_pw').focus();
			return false;
			
		} else if($.trim($('#checkpw').val()) == ''){
			$('#submitResult').text("비밀번호를 확인해주세요");
			$('#submitResult').css("color", "red");
			$('#checkpw').focus();
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
		}		else {
			if(checkEmail($('#user_email').val())) {
				$('#submitResult').text("");
				$('#editForm').submit();
			} else {
				$('#submitResult').text("이메일형식에 맞게 작성해주세요");
				$('#submitResult').css("color", "red");
				return false;
			}
		}
		
	});
	
	$('#user_pw').blur(function() {
		if($('#user_pw').val() != $('#checkpw').val()) {
			$('#pwCheckResult').text("비밀번호가 다릅니다");
			$('#pwCheckResult').css("color", "red");
			$("#editBtn").attr("disabled", true);
		} else {
			if(!$.trim($('#user_pw').val()) == '') {
				$('#pwCheckResult').text("비밀번호가 일치합니다");
				$('#pwCheckResult').css("color", "blue");
				$("#editBtn").attr("disabled", false);
			}
		}
	})
	
	$('#checkpw').blur(function() {
		if($('#user_pw').val() != $('#checkpw').val()) {
			$('#pwCheckResult').text("비밀번호가 다릅니다");
			$('#pwCheckResult').css("color", "red");
			$("#editBtn").attr("disabled", true);
		} else {
			if(!$.trim($('#checkpw').val()) == '') {
				$('#pwCheckResult').text("비밀번호가 일치합니다");
				$('#pwCheckResult').css("color", "blue");
				$("#editBtn").attr("disabled", false);
			}
		}
	})
	
})

</script>



<div id="divpage">
<div id="container">
	<div id="content">
		<div class="c_header">
			<h1>회원 정보 수정</h1>
			<p class="contxt">
				<Strong style="font-size: 25px; color: #F5DA81;"> ${userinfo.USER_ID  }</Strong>
				   님의 회원 상세정보 입니다.
			</p>
		</div>
		
		<form action="/mypage/myedit" method="POST" id="editForm" enctype="multipart/form-data" class="editForm">
			<input type="hidden" name="user_no" id="user_no" value="${user_no} ">
			<fieldset class="fs">
			<div class="border">
				
				<div class="box_set">
					<strong class="tit_set">프로필 사진</strong>
					<span class="txt_set">
						<input type="hidden" name="user_no" id="user_no" value="${userinfo.USER_NO} ">
						<label for="file" class="input-file-button"></label>
						<input type="file" name="file" id="file" required accept="image/*" />
					</span>
				</div>
				<div class="box_set">
					<strong class="tit_set">아이디</strong>
					<span class="txt_set">${userinfo.USER_ID }</span>
				</div>
				<div class="box_set">
					<strong class="tit_set">닉네임</strong>
					<span class="txt_set"><input type="text" name="user_nick" id="user_nick" value="${userinfo.USER_NICK }"/></span>
				</div>
				<div></div>
				<div class="box_set">
					<strong class="tit_set">유저 등급</strong>
					<span class="txt_set">${userinfo.GRADE_NAME }</span>
				</div>
				<div class="box_set">
					<strong class="tit_set">이메일</strong>
					<span class="txt_set"><input type="text" name="user_email" id="user_email" value="${userinfo.USER_EMAIL }"/></span>
				</div>
				<div class="box_set">
					<strong class="tit_set">비밀번호</strong>
					<span class="txt_set"><input type="password" name="user_pw" id = "user_pw" required/></span>
				</div>		
				<div class="box_set">
					<strong class="tit_set">비밀번호 확인</strong>
					<span class="txt_set"><input type="password" name="checkpw" id = "checkpw"/></span>
				</div>
				<div class="box_set">					
<!-- 					<div id = "alert-success"><p style = "color: blue; text-align: right;">비밀번호가 일치합니다.</p></div> -->
<!-- 					<div id = "alert-fail"><p style = "color: red; text-align: right;">비밀번호가 일치하지 않습니다.</p></div>	 -->
					<div id="pwCheckResult" style="text-align: right;"></div>
					<div id="submitResult" style="text-align: right;">　</div>
				</div>
				
			</div><br>
				<button id="editBtn" class="btn btn-success btn-sm pull-right">수정 완료</button>
				<a href="javascript:history.back();" role="button" class="btn btn-primary btn-sm pull-right" style="margin-right:20px;">돌아가기</a>
				<a href="/mypage/mydelete" role="button" class="btn btn-danger btn-sm pull-left" style="margin-right:20px;">회원 탈퇴</a>
				
			</fieldset>
		</form>		
	</div>
</div>




</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />