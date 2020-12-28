<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
	
	white-space:nowrap;	
	text-overflow: ellipsis;
	overflow: hidden;
}
</style>


<script type="text/javascript">
$(document).ready(function() {
	$("#noticeWriteBtn").click(function(){
		location.href="/notice/write";
	})
	
})

</script>

<div class="container">
	<h1 class="pull-left">공지사항 게시판</h1>
	<div class="clearfix"></div>
	<hr>
	
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
					<td><a href="/notice/view?article_no=${list.ARTICLE_NO }">${list.ARTICLE_TITLE }</a></td>
					<td>${list.USER_NICK }</td>
					<td>
						<fmt:formatDate value="${list.CREATE_DATE }" pattern="yy-MM-dd" />
					</td>
					<td>${list.ARTICLE_HIT }</td>
				</tr>
			</c:forEach> 
		</tbody>
	</table>
	
<!-- 	<button id="noticeWriteBtn" class="btn btn-primary pull-right">글작성</button> -->
	
<!-- 관리자만 글 작성 버튼 보이기 -->
<c:if test="${user_grade eq 0 }">
	<button id="noticeWriteBtn" class="btn btn-primary pull-right">글작성</button>
</c:if>


<!-- 검색기능 -->

<form action="/notice/list" method="get" class="form-inline text-center">
	<div class="searchbox form-group">
		<select class="search form-control" style="width: 100px;" name="search" id="search">
			<option value="article_title" <c:if test="${search == 'article_title' }">selected</c:if>>제목</option>		
			<option value="article_content" <c:if test="${search == 'article_content' }">selected</c:if>>내용</option>		
		</select>
	</div>
	
	<div class="form-group">
		<input type="text" class="form-control" name="keyword" id="keyword" placeholder="검색어를 입력하세요." value="${keyword }" />
		<button type="submit" class="btn" value="검색">검색</button>
	</div>
</form>

<div id="paging_area">
<jsp:include page="/WEB-INF/views/notice/noticePaging.jsp" />
</div>

</div> <!-- container end  -->

<c:import url="/WEB-INF/views/layout/footer.jsp"/>