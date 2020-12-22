<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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

<style type="text/css">
/* 모든 페이지에 적용되는 스타일 CSS */

.wrap {
	margin: 0 auto;
	min-width: 1100px;
}

.header {
	text-align: center;
}

.footer {
	text-align: center;
}
#loginBox {
	position: absolute;
	right: 20px;
	top: 20px;
}

.userInfo {
	text-align: center;
}

</style>

</head>
<body>

<div class="container">

<h1>로그인성공한 메인페이지</h1>

<script src="https://apis.google.com/js/platform.js" async defer></script>

<script type="text/javascript">

function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
    auth2.disconnect();
}
	
$(document).ready(function() {
	
	
	$("#btnLogin").click(function() {
		$(location).attr("href", "/login/login");
	});

	$("#btnLogout").click(function() {

// 		signOut();
		
		
		$(location).attr("href", "/login/logout");
		
		
	});

	

})
</script>

</head>

<div class="wrap">

<div class="header">

	<c:if test='<%=!"user".equals(request.getRequestURI().split("/")[3]) %>'>
	<div id="loginBox">
	<c:choose>
		<c:when test="${empty isLogin }">
			<button id="btnLogin" class="btn">로그인</button>
		</c:when>
		<c:otherwise>
			<div class="pull-right">
				<c:out value="${user_nick }" />님 환영합니다
				<button id="btnLogout" class="btn btn-warning">로그아웃</button>
			</div>
		</c:otherwise>
	</c:choose>
	</div>
	</c:if>
</div>

</div>


<!-- 테이블 스타일 -->
<style type="text/css">

body {
	text-align: center;
}

th, td {
	border: 1px solid black;
	margin: 5px;
	text-align: center;
}

</style>

<h3>접속자 정보</h3>

<div class="userInfo">
	
	<table style="border: 1px solid black;">
		<thead>
			<th>유저번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>성별</th>
			<th>나이대</th>
			<th>이메일</th>
			<th>프로필사진</th>
		</thead>
		
		<tbody>
			<td>${user_no }</td>
			<td>${user_id }</td>
			<td>${user_name }</td>
			<td>${user_nick }</td>
			<td>${user_gender }</td>
			<td>${user_age }</td>
			<td>${user_email }</td>
			<td><img src="${user_image }" style="width: 100px; height: 100px;"/></td>
		</tbody>
		
	</table>
</div>

<div class="link">

	<a href="/matefind/list"><button class="btn btn-secondary">게시판 리스트</button></a>

</div>

</div>
</body>
</html>