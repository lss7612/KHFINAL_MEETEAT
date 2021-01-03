<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="/resources/css/mypage/mydelete.css">


<div id="divpage">
<div class="c_header">
	<h1>회원 탈퇴</h1>
	<p class="contxt">
	<Strong style="font-size: 25px; color: #F5DA81;"> ${u.USER_ID  }</Strong>
		님, 회원 탈퇴를 진행하면 결제정보 및 회원정보를 되돌릴 수 없습니다.
	</p>
	<p class="contxt" style="padding-left: 20px;">탈퇴를 위해 회원님의 비밀번호를 입력해주세요</p>
</div>

<div>
<form action="/mypage/mydelete" method="POST">
<input type="hidden" name="user_no" value="${u.USER_NO}">
<input type="hidden" name="user_id" id="user_id" value="${u.USER_ID }">

<div class="container">
	<div class="form-group">
		<label style="padding-right: 150px;">회원 아이디</label>
		<Strong style="font-size: 20px; color: #666;"> ${u.USER_ID  }</Strong>
	</div>
	<div class="form-group">
		<label style="padding-right: 60px;">회원 비밀번호</label>		
		<input type="password" name="user_pw" id="user_pw" placeholder="비밀번호를 입력해주세요">
	</div>
	<div id="submitResult" style="text-align: center;">　</div>

</div><br>
<div style="text-align: center;">
		<a href="/mypage/mypage" role="button" class="btn btn-primary btn-sm" id="back">돌아가기</a>
		<button id="submit" name="submit" class="btn btn-danger btn-sm" onclick="gradeChk();">탈퇴하기</button>
</div>
</form>
</div>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />