<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>  

<script type="text/javascript">

$(document).ready(function() {
	 $("input").keyup(function(){
	      var pw1 = $("#userpw").val();
	      var pw2 = $("#checkpw").val();
	   
	      if(pw1 != "" || pw2 != "") {
	          if(pw1 == pw2){ 
	             $('#alert-success').show();
	             $('#alert-fail').hide();       
	          } else{
	             $('#alert-success').hide();
	             $('#alert-fail').show();
	          }
	       }
	})
})

</script>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="/resources/css/mypage/myedit.css">

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
		
		<form action="/mypage/myedit" method="POST" enctype="multipart/form-data" autocomplete="off">
			<input type="hidden" name="user_no" value="${user_no} ">
			<fieldset class="fs">
			<div class="border">
				<div class="box_set">
					<strong class="tit_set">프로필 사진</strong>
					<span class="txt_set">
						<label for="file"></label>
						<input type="file" name="file" id="file" required accept="image/*"/>
					</span>
				</div>
				<div class="box_set">
					<strong class="tit_set">아이디</strong>
					<span class="txt_set">${userinfo.USER_ID }</span>
				</div>
				<div class="box_set">
					<strong class="tit_set">닉네임</strong>
					<span class="txt_set"><input type="text" name="user_nick" value="${userinfo.USER_NICK }"/></span>
				</div>
				<div></div>
				<div class="box_set">
					<strong class="tit_set">유저 등급</strong>
					<span class="txt_set">${userinfo.GRADE_NAME }</span>
				</div>
				<div class="box_set">
					<strong class="tit_set">이메일</strong>
					<span class="txt_set"><input type="text" name="user_email" value="${userinfo.USER_EMAIL }"/></span>
				</div>
				<div class="box_set">
					<strong class="tit_set">비밀번호</strong>
					<span class="txt_set"><input type="password" name="user_pw" id = "userpw" value=${userinfo.USER_PW }/></span>
				</div>
				
				<div id = "alert-success"><p style = "color: blue; text-align: right;">비밀번호가 일치합니다.</p></div>
				<div id = "alert-fail"><p style = "color: red; text-align: right;">비밀번호가 일치하지 않습니다.</p></div>
				
				<div class="box_set">
					<strong class="tit_set">비밀번호 확인</strong>
					<span class="txt_set"><input type="password" name="checkpw" id = "checkpw"/></span>
				</div><br>
			</div><br>

				
				<button class="btn btn-success btn-sm pull-right">수정 완료</button>
				<div><button class="btn btn-danger btn-sm pull-right" onclick="location.href='/mypage/mydelete'">회원 탈퇴</button></div>
				<div><button onclick="location.href='/mypage/mypage'" class="btn btn-warning btn-sm pull-left">돌아가기</button><br></div>
			</fieldset>
		</form>
		
	</div>
</div>




</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />