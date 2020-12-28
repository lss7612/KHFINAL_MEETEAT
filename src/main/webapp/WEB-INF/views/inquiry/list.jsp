<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<link rel="stylesheet" href="/resources/css/inquiry/inquiryList.css">

<script type="text/javascript">
$(document).ready(function() {
	$("#inquiryWriteBtn").click(function(){
		location.href="/inquiry/write";
	})
	
})

</script>

<br>

<div class="container">
	<h2 class="pull-left">문의 게시판</h2>
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
					<td>
						<c:if test="${list.POST_STEP > 0 }">
							<c:forEach begin="1" end="${list.POST_STEP }" >
								&nbsp;&nbsp;
							</c:forEach>
							<i class="far fa-comment-dots"></i> [답변] : 
						</c:if>
<%-- 						<a href="/inquiry/view?board_no=${list.BOARD_NO }&article_no=${list.ARTICLE_NO }&article_secret=${list.ARTICLE_SECRET}">${list.ARTICLE_TITLE }</a> --%>


						<c:choose>
							<c:when test="${list.USER_NICK ne sessionScope.user_nick && list.ARTICLE_SECRET eq 1 }">
								<a href="/inquiry/view?board_no=${list.BOARD_NO }&article_no=${list.ARTICLE_NO }&article_secret=${list.ARTICLE_SECRET}">
								<i class="fas fa-lock"></i>&nbsp;&nbsp;비밀글입니다.</a>
							</c:when>
							<c:when test="${list.USER_NICK ne sessionScope.user_nick && list.ARTICLE_SECRET eq 0 }">
								<a href="/inquiry/view?board_no=${list.BOARD_NO }&article_no=${list.ARTICLE_NO }&article_secret=${list.ARTICLE_SECRET}">${list.ARTICLE_TITLE }</a>
							</c:when>
						</c:choose>

					</td>
<%-- 					<td><a href="/inquiry/view?article_no=${list.ARTICLE_NO }">${list.ARTICLE_TITLE }</a></td> --%>
					<td>${list.USER_NICK }</td>
					<td>
						<fmt:formatDate value="${list.CREATE_DATE }" pattern="yy-MM-dd HH:mm" />
					</td>
					<td>${list.ARTICLE_HIT }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<button id="inquiryWriteBtn" class="btn btn-primary btn-sm pull-right">글작성</button>
	
	<div class="form-inline" id="backhistory">
		<a href="javascript:history.back();" role="button" class="btn btn-primary btn-sm pull-left">돌아가기</a>
	</div>
	
<!-- 페이징 영역 -->
<jsp:include page="/WEB-INF/views/inquiry/inquiryPaging.jsp" />


<!-- 검색기능 -->

<form action="/inquiry/list" method="get" class="form-inline text-center">
	<div class="searchbox form-group form-group-sm ">
		<select class="search form-control" style="width: 100px;" name="search" id="search">
			<option value="article_title" <c:if test="${search == 'article_title' }">selected</c:if>>제목</option>		
			<option value="article_content" <c:if test="${search == 'article_content' }">selected</c:if>>내용</option>		
		</select>
	</div>
	
	<div class="form-group form-group-sm">
		<input type="text" class="form-control" name="keyword" id="keyword" placeholder="검색어를 입력하세요." value="${keyword }" />
		<button type="submit" class="btn btn-sm" id="btnsearch" value="검색">검색</button>
	</div>
</form>

</div> <!-- container end  -->

<br><br><br>


<!-- footer 영역 -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>