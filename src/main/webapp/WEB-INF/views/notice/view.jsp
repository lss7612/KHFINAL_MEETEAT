<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/forTest/header.jsp"/>

<script type="text/javascript">



</script>

<div class="container">
	<h1 class="pull-left">공지사항</h1>
	<div class="clearfix"></div>
	<hr>
	
	<!-- 게시글 내용 영역 -->
	<table class="table table-bordered">
	
		<tr>
			<td class="info" style="width: 20%">제목</td><td>${result.ARTICLE_TITLE }</td>
		</tr>
		
		<tr>
			<td class="info">닉네임</td><td>${result.USER_NICK }</td>
		</tr>
		
		<tr>
			<td class="info">조회수</td><td>${result.ARTICLE_HIT }</td>
		</tr>
		
		<tr><td class="info" colspan="4">본문</td></tr>
		<tr><td colspan="4">${result.ARTICLE_CONTENT }</td></tr>
	</table>
	
	<!-- 버튼 영역 -->
<div class="text-center">
	<a href="/notice/list"><button class="btn btn-primary">목록</button></a>
	
	<!-- 본인과 관리자만 사용 가능 -->
	<c:if test="${result.USER_NICK eq sessionScope.user_nick || user_grade eq 0 }">
		<a href="/notice/modify?board_no=${result.BOARD_NO }&article_no=${result.ARTICLE_NO }"><button class="btn btn-warning">수정</button> </a>
		<a href="/notice/delete?board_no=${result.BOARD_NO }&article_no=${result.ARTICLE_NO }"><button class="btn btn-danger">삭제</button> </a>
	</c:if>
</div>
	
</div>













