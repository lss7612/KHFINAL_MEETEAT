<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<link rel="stylesheet" href="/resources/css/notice/view.css">

<script type="text/javascript">
	function stepView(article_no) {
		var form = document.getElementById("viewForm");
		form.article_no.value = article_no;
		form.submit();
	}
</script>

<br>

<div class="container">
	<h2 class="pull-left">공지사항</h2>
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
				<fmt:formatDate value="${result.CREATE_DATE }" pattern="yy/MM/dd" /> </span>
			<span>조회수 : ${result.ARTICLE_HIT }</span>
		</div>
		
		<br>
		
		<div id="content" class="light_margin bold_padding vertical_bold_margin" style="padding:5px; text-align:left; margin-top: 50px;">
			<span>${result.ARTICLE_CONTENT }</span>
		</div>
		
		<br><br><br>
		
		<form action="/notice/view" id="viewForm" method="get">
		
		<div id="next-prev">
			<c:if test="${nextArticle != null }">
				<p>다음글 : <a href="javascript:stepView('${nextArticle.article_no }')">${nextArticle.article_title }</a></p>
			</c:if>
			
			<c:if test="${prevArticle != null }">
				<p>이전글 : <a href="javascript:stepView('${prevArticle.article_no }')">${prevArticle.article_title }</a></p>
			</c:if>
		</div>		
		
			<p>
				<input type="hidden" name="article_no" />
				<input type="hidden" name="board_no" value="${result.BOARD_NO }" />
			</p>
		</form>

	<br><br>
	
<!-- 버튼 영역 -->
<div class="text-center">

	
<!-- 본인과 관리자만 사용 가능 -->

	<a href="/notice/list"><button class="btn btn-primary btn-sm pull-left">목록</button></a>
	
	<c:if test="${result.USER_NICK eq sessionScope.user_nick || user_grade eq 0 }">
		<a href="/notice/delete?board_no=${result.BOARD_NO }&article_no=${result.ARTICLE_NO }"><button class="btn btn-danger btn-sm pull-right">삭제</button> </a>
		<a href="/notice/modify?board_no=${result.BOARD_NO }&article_no=${result.ARTICLE_NO }"><button class="btn btn-warning btn-sm pull-right" style="margin-right: 5px;">수정</button> </a>
		
		<a href="/admin/board/list"><button class="btn btn-success btn-sm pull-left" style="margin-left: 5px;">관리자페이지로</button> </a>
		
	</c:if>
	
</div>
	
</div>

<br><br>

<!-- footer 영역 -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
