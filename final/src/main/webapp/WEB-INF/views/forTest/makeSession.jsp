<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>SessionFactory</h1>
<h3>로그인 구현 전 세션발급을 담당한다</h3>

<hr>

<ul>
<li><a href="/makesession/adminUser"><span>관리자유저세션받기</span></a><br></li>
<li><a href="/makesession/PaymentUser">결제유저세션받기</a><br></li>
<li><a href="/makesession/commonUser">일반유저세션받기</a><br></li>
<li><a href="/makesession/BannedUser">영정유저세션받기</a><br></li>
<li><a href="/makesession/guestUser">세션삭제(로그인안한유저)</a><br></li>
</ul>

<hr>

<c:if test="${isLogin }">
<div>
<h3 style="color:tomato;">세션이 발급됨!!</h3>

<div style="float:left; width:100px; margin:5px;">
<h4>Session Info</h4>
</div>
<div>
user_no: ${user_no }<br>
user_nick: ${user_nick }<br>
user_grade: ${user_grade }<br>
</div>
</div>
</c:if>
<c:if test="${isLogin eq null }">
<div>
<h3 style="color:tomato;">세션 발급 취소됨...</h3>
</div>
</c:if>




</body>
</html>