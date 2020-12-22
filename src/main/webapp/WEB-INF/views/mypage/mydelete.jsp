<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script>

document.getElementById('submit').onclick = function() {
    var ID = document.getElementById('user_id').value;
    var pass = document.getElementById('user_pw').value;
    if (ID === "${user_no}" && pass === "${user_pw}") {
        alert("로그인 성공!");
    }
    else {
        alert("로그인 실패!");
    }
}

</script>

<div id="divpage">
<h1>비밀 번호 확인</h1>

<h3>아이디와 비밀번호를 입력해주세요</h3>
<form action="/mypage/mydelete" method="POST">
<input type="hidden" name="user_no" value="${user_no }">

ID: <input type="text" name="user_id" id="user_id">
PW: <input type="password" name="user_pw" id="user_pw">

<button id="submit" name="submit">탈퇴하기</button>
</form>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />