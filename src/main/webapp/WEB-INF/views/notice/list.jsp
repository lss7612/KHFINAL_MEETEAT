<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<link rel="stylesheet" href="/resources/css/notice/list.css">

<script type="text/javascript">
$(document).ready(function() {
	$("#noticeWriteBtn").click(function(){
		location.href="/notice/write";
	})
	
})

</script>

<br>

<div class="container">
	<h2 class="pull-left">공지사항 게시판</h2>
	<div class="clearfix"></div>
	<br>

	<table class="table table-striped table-hover table-condensed">
		<thead>
			<tr>
				<th style="width: 10%">번호</th>
				<th style="width: 50%">제목</th>
				<th style="width: 15%">작성자</th>
				<th style="width: 15%">작성일</th>
				<th style="width: 10%">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="list">
				<tr>
					<td>${list.ARTICLE_NO }</td>
					<td><a href="/notice/view?board_no=${list.BOARD_NO }&article_no=${list.ARTICLE_NO }">${list.ARTICLE_TITLE }</a></td>
					<td>${list.USER_NICK }</td>
					<td>
						<fmt:formatDate value="${list.CREATE_DATE }" pattern="yy-MM-dd" />
					</td>
					<td>${list.ARTICLE_HIT }</td>
				</tr>
			</c:forEach> 
		</tbody>
	</table>
	
<!-- 관리자만 글 작성 버튼 보이기 -->
<c:if test="${user_grade eq 0 }">
	<button id="noticeWriteBtn" class="btn btn-primary pull-right btn-sm">글작성</button>
</c:if>

	<div class="form-inline" id="backhistory">
		<a href="javascript:history.back();" role="button" class="btn btn-primary btn-sm pull-left">돌아가기</a>
	</div>

<!-- 페이징 영역 -->
<div id="paging_area">
<jsp:include page="/WEB-INF/views/notice/noticePaging.jsp" />
</div>

<!-- 검색기능 -->
<form action="/notice/list" method="get" class="form-inline text-center">
	<div class="searchbox form-group form-group-sm">
		<select class="search form-control" style="width: 100px;" name="noticeSearch" id="noticeSearch">
			<option value="article_title" <c:if test="${noticeParam.noticeSearch == 'article_title' }">selected</c:if>>제목</option>		
			<option value="article_content" <c:if test="${noticeParam.noticeSearch == 'article_content' }">selected</c:if>>내용</option>		
		</select>
	</div>
	
	<div class="form-group form-group-sm">
		<input type="text" class="form-control" name="noticeKeyword" id="noticeKeyword" placeholder="검색" value="${noticeParam.noticeKeyword }" />
		<button type="submit" class="btn btn-sm" value="검색">검색</button>
	</div>
</form>

</div> <!-- container end  -->

<br><br><br>

<!-- footer 영역 -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>