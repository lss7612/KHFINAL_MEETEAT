<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
//게시글 신고하기버튼 클릭시 동작할 함수
function reportPopup(){
	var frmPop = document.frmPopup;
	
	//팝업 
	window.open("http://localhost:8088/report/doReport","report"
			, "width=500px,height=425px")
	frmPop.action = "http://localhost:8088/report/doReport";
	frmPop.target = "report";
	//${user_no}에 작성자 번호에 맞는 변수명을 적어주시면 됩니당.
	frmPop.user_no.value = ${user_no};
	//현재글 URL정보 전달
	frmPop.url.value = window.location.href
}
// 신고하기 동작 함수 끝
</script>
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
<h2><a href="/recruitboard/list">게시판으로!</a></h2>
<h2><a href="/admin/report/list">신고목록으로!</a></h2>
<h2><a href="/admin/report/result/list">신고 처리 목록으로!</a></h2>

<!-- 게시글 신고 버튼 구역 -->
<form name="frmPopup" method="POST">
	<input type="hidden" name= "user_no">
	<input type="hidden" name= "url" />
<button onclick="reportPopup();" class="btn btn-danger" >신고</button>
</form>
<!-- 게시글 신고 버튼 구역  종료-->
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