<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<link rel="stylesheet" href="/resources/css/inquiry/view.css">

<script type="text/javascript">

//삭제하기
	$(document).ready(function(){
		$("#deleteBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.viewform.action = "/inquiry/delete?board_no=${result.BOARD_NO }&article_no=${result.ARTICLE_NO }"
				document.viewform.submit();
			}
		})
	})

</script>

<br>

<div class="container">
	<h2 class="pull-left">문의사항</h2>
	<div class="clearfix"></div>
	<br>
	
	<!-- 게시글 내용 영역 -->
	
		<div id="title">
			<h4 style="font-weight:bold;">${result.ARTICLE_TITLE }</h4>
		</div>
		
		<hr>
		
		<div id="userInfo" class="pull-right" style="text-align:right;">
			<span><i class="far fa-user-circle"></i>${result.USER_NICK }</span>
			<span><i class="far fa-clock"></i>
				<fmt:formatDate value="${result.CREATE_DATE }" pattern="yy/MM/dd hh:mm" /> </span>
			<span>조회수 : ${result.ARTICLE_HIT }</span>
		</div>
		
		<div id="content" class="light_margin bold_padding vertical_bold_margin" style="padding:5px; text-align:left; margin-top: 50px;">
			<span>${result.ARTICLE_CONTENT }</span>
		</div>
		
		<br><br>
		
	<!-- 버튼 영역 -->
<div class="text-center form-group form-group-sm">

		<a href="/inquiry/list"><button class="btn btn-primary btn-sm pull-left">목록</button></a>
		
		<!-- 본인과 관리자만 사용 가능 -->
		<c:if test="${result.USER_NICK eq sessionScope.user_nick || user_grade eq 0}">
			
			
			<form name="viewform" method="post">
				<input type="button" class="btn btn-danger btn-sm pull-right" id="deleteBtn" value="삭제" />
			</form>
			
			<a href="/inquiry/modify?board_no=${result.BOARD_NO }&article_no=${result.ARTICLE_NO }"><button id="modifybtn" class="btn btn-warning btn-sm pull-right">수정</button> </a>
			
			<a href="/inquiry/replyWrite?board_no=${result.BOARD_NO }&article_no=${result.ARTICLE_NO }&post_group=${result.POST_GROUP}&post_step=${result.POST_STEP}&post_indent=${result.POST_INDENT}">
			<button id="replybtn" class="btn btn-primary btn-sm pull-right">답글</button></a>
		</c:if>
		
</div>
	
</div>

<br><br>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>
