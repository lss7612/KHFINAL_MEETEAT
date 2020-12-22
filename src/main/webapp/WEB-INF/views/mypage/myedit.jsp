<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<c:import url="/WEB-INF/views/layout/header.jsp" />

<form action="/mypage/myedit" method="POST" enctype="multipart/form-data" autocomplete="off">


<input type="hidden" name="user_no" value="${user_no} ">

<!-- 프로필 사진 변경부분 -->
<label for="file"></label><br><br><br>
	<input type="file" name="file" id="file" required accept="image/*"/><br><br><br>
		<label>유저 아이디</label><br><h3>${userinfo.USER_ID }</h3>
		<label >유저 등급</label><br><h3>${userinfo.GRADE_NAME }</h3>
        <label>유저 나이</label><br><h3>${userinfo.USER_AGE }</h3>
		
		
		
		<label style="color: #959595;">유저 닉네임</label>
		<input type="text" name="user_nick" value="${userinfo.USER_NICK }"/>님
		
		<div><label>유저 이메일</label><h4><input type="text" name="user_email" value="${userinfo.USER_EMAIL }"/></h4></div><br>
		<div>비밀번호 변경 : <input type="password" name="user_pw" value="hidden"></div><br><br><br>
<button >수정 완료</button>
</form>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
