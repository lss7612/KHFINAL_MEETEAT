<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- FontAwsome -->
<script src="https://kit.fontawesome.com/2dc2c9d106.js" crossorigin="anonymous"></script>


<script type="text/javascript">
//작성자 정보 누르면 채팅메뉴 나타나게 동작하는 스크립트
$(document).ready(function(){
	$("#userMenu>span").click(function(){
		
		//2. 슬라이드 형식으로 나타나기
		var submenu = $(this).next("ul");
		if(submenu.is(":visible")){
			submenu.slideUp();
		} else{
			submenu.slideDown();
		}
	})
})
//작성자 정보 누르면 채팅메뉴 나타나게 동작하는 스크립트 끝

//채팅목록 팝업으로 띄워주는 함수
function chatListPopup(){
	var frmPop = document.frmPopup;
	window.open("http://localhost:8088/chat/list", "chatList"
			, "width = 710px, height = 681px");
}
//채팅목록 팝업 종료

//채팅하기 클릭시 동작하는 스크립트
function createChat(){
	window.open("http://localhost:8088/chat/create?user_no=${user_no}", "chatCreate"
			, "width = 710px, height = 665px");
	//location.href="/chat/create?user_no=${user_no}"
}
//채팅하기 클릭시 동작하는 스크립트 끝
</script>

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


<style type="text/css">
/* 회원 아이디 클릭시 나타나는 목록 CSS */
#userMenuList{
   list-style:none;
   padding : 0 0 0 0;
}

#userHiddenMenu{ 
	list-style:none;
   	display:none;
	padding : 0 0 0 40px; 
	position : absolute; 
} 

#userHiddenMenu > li{
	background-color : #ff8f11;
	position : relative;
	cursor : pointer;
	border : solid #e46508 1px;
	padding : 3px 3px 3px 3px;
}
/* 회원 아이디 클릭시 나타나는 목록 CSS 끝*/

</style>
<%-- 모달(팝업) 모듈 import --%>
<c:if test="${empty cookie.popup }">
<c:import url="eventPopupModule.jsp"></c:import>
</c:if>

<div id="divpage">
<h1>SessionFactory</h1>
<h3>로그인 구현 전 세션발급을 담당한다</h3>

<hr>

<div id="sliderbox">
	<ul id="slider">
		<li><img src="https://i.imgur.com/fDHtQ8N.jpg" /></li>
		<li><img src="https://i.imgur.com/CGR48hH.jpg" /></li>
		<li><img src="https://i.imgur.com/kK8Jrh6.jpg" /></li>
		<li><img src="https://i.imgur.com/4kKOYtZ.jpg" /></li>
		<li><img src="https://i.imgur.com/WjCxgv7.jpg" /></li>
	</ul>
</div>


<ul>
<li><a href="/makesession/adminUser"><span>관리자유저세션받기</span></a><br></li>
<li><a href="/makesession/PaymentUser">결제유저세션받기</a><br></li>
<li><a href="/makesession/commonUser">일반유저세션받기</a><br></li>
<li><a href="/makesession/BannedUser">영정유저세션받기</a><br></li>
<li><a href="/makesession/guestUser">세션삭제(로그인안한유저)</a><br></li>
</ul>
<h2><a href="/recruitboard/list">파티모집게시판으로</a></h2>
<h2><a href="/admin/report/list">신고목록으로!</a></h2>
<h2><a href="/admin/report/result/list">신고 처리 목록으로!</a></h2>
<h2><a href="/eventboard/holding">이벤트게시판으로(관리자로접속하면 일반과 다름)</a></h2>
<h2><a href="/restorantfind/find">맛집찾기!</a></h2>
<h2><a href="#" onclick="chatListPopup();">채팅목록으로!</a></h2>


<!-- 게시글 신고 버튼 구역 -->
<form name="frmPopup" method="POST">
	<input type="hidden" name= "user_no">
	<input type="hidden" name= "url" />
<button onclick="reportPopup();" class="btn btn-danger" >신고</button>
</form>
<!-- 게시글 신고 버튼 구역  종료-->
<hr>

<!-- 작성글 내용 페이지에서 작성자 닉네임클릭했을 시 나타나는 메뉴 -->
<ul id="userMenuList">
	<li id="userMenu">
		<span>작성자닉네임</span>
		<ul id="userHiddenMenu" >
			<li onclick="createChat();" >채팅하기</li>
		</ul>
	</li>
	
</ul>
<!-- 작성글 내용 페이지에서 작성자 닉네임클릭했을 시 나타나는 메뉴 끝-->
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

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />