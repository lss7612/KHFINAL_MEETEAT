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
<style>
div{
	displayy: block;
}

.c_header{
	padding-bottom: 0px;
	color: #666;
	padding-left: 30px;
}

.c_header .contxt{
	line-height: 19px;
	padding-top: 10px;
	letter-spacing: -1px;
}

.contxt{
	padding-left: 10px;
	
}

p{
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	margin: 0;
	padding: 0;
}

strong{
	font-weight: bold;
}

form{
	display: block;
}


input{
	font-size: 15px
}

.container{

	text-align: center;
	max-width: 500;
		
}

</style>
<div id="divpage">
<div class="c_header">
	<h1>비밀 번호 확인</h1>
	<p class="contxt">
	<Strong style="font-size: 25px; color: #F5DA81;"> ${u.USER_ID  }</Strong>
		님, 회원탈퇴를 진행하면 정보를 되돌릴 수 없습니다.
	</p>
</div>


<h4>아이디와 비밀번호를 입력해주세요</h4>
<form action="/mypage/mydelete" method="POST">
<input type="hidden" name="user_no" value="${u.USER_NO}">

<div class="container">
	<div class="submitForm">
		<input type="text" name="user_id" id="user_id" placeholder="아이디 입력">
		<input type="password" name="user_pw" id="user_pw" placeholder="비밀번호 입력">
	</div>
	
	<button id="submit" name="submit" class="btn btn-danger btn-sm pull-right">탈퇴하기</button>
	<a href="/mypage/mypage" role="button" class="btn btn-primary btn-sm pull-left">돌아가기</a>
</div>
</form>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />