<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script type="text/javascript">

$(document).ready(function () {
	
	$(window).scroll(function() { 
		if ($(this).scrollTop() > 200) { 
			$('#topupBtn').fadeIn(); } 
		else { $('#topupBtn').fadeOut(); }
	}); 
$("#topupBtn").click(function() { 
   	$('html, body').animate({ scrollTop : 0  }, 300); 
    	return false; });
});

</script>


<!-- ------------------------------------------------------------------------ -->

<header>
	<img id="topupBtn" src="/resources/img/topicon.png" href="#">
	
	<div id="top_menu">
	<div class="top_menu_sub">
	<a href="/WEB-INF/views/layout/404error.jsp" style="font-size: 3px; color: #170B3B;">404</a>
	<a href="/layout/error500" style="font-size: 3px; color: #170B3B;">500</a>
		
		<c:choose>
		<c:when test="${empty isLogin }">
			<a href="/login/signup">회원가입</a>
			<a href="/login/login">로그인</a>
		</c:when>
		<c:otherwise>
	       		<a href="/mypage/mypage">마이페이지</a>
				<a href="/login/logout">로그아웃</a>
		</c:otherwise>
	</c:choose>


	</div>
	</div>
	
	<div id="logo">
		<a href="http://localhost:8088/"><img src="/resources/img/logo.png" alt="Logo"></a>
	</div>
	
	<div id="menuu">
		<ul class="navvvv">
			<li>
				<a href="#">공지사항</a>
				<ul class="subb">
					<li><a href="/notice/list">공지사항</a>
					<li><a href="/inquiry/list">1:1 문의</a>
					<li><a href="/eventboard/holding">이벤트</a>
				</ul>
			</li>
				
			<li>
				<a href="/matefind/list">메이트찾기</a>
			</li>
				
			<li>
				<a href="#">커뮤니티</a>
				<ul class="subb">
					<li><a href="/restorantfind/find">맛집 찾기</a>
					<li><a href="/recruitboard/list">파티 모집</a>
					<li><a href="/review/list">파티 후기</a>
				</ul>
			</li>
			
			<li style="cursor : pointer;" onclick="chatListPopup();">채팅하기</a>
			
			<c:if test="${user_grade eq 0 }">
			<li>
				<a href="#">관리자페이지</a>
				<ul class="subb">
					<li><a href="/admin/user/list">유저 관리</a>
					<li><a href="/admin/board/list">게시글 관리</a>
					<li><a href="/admin/report/list">신고 목록</a>
					<li><a href="/admin/report/result/list">신고 처리</a>
				</ul>
			</li>
			</c:if>
		</ul>
	</div>
</header>








