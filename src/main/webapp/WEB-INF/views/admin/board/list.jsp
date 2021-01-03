<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<link rel="stylesheet" href="/resources/css/boardAdmin/list.css">

<script type="text/javascript" src="/resources/js/boardAdmin/list.js"></script>

<br>

<div class="container">
	<h2 class="pull-left">게시판 관리자 페이지</h2>
	<div class="clearfix"></div>
	<br>
	
<!-- 게시판 검색 -->
	<form action="/admin/board/list" method="get">
		<div class="row">
			<div class="col-sm-3 col-md-2 form-group form-group-sm text-center">
				<h5><strong>게시판별 검색</strong></h5>
			</div>
			<div class="col-md-3">
				<select class="form-control input-sm" name="manageCategory" id="manageCategory">
					<option value="">게시판 선택</option>
					
					<!-- 공지사항 게시판 -->
					<option value="1" 
						<c:if test="${boardAdminParam.manageCategory == '1' }">selected</c:if>>공지사항 게시판</option> 
					
					<!-- 메이트찾기 게시판 -->
					<option value="2" 
						<c:if test="${boardAdminParam.manageCategory == '2' }">selected</c:if>>메이트 찾기 게시판</option> 
	
					<!-- 파티모집 -->
					<option value="3"
						<c:if test="${boardAdminParam.manageCategory == '3' }">selected</c:if>>파티모집 게시판</option>
					
					<!-- 후기게시판 -->
					<option value="4"
						<c:if test="${boardAdminParam.manageCategory == '4' }">selected</c:if>>후기 게시판</option>
		
					<!-- 문의게시판 -->
					<option value="5"
						<c:if test="${boardAdminParam.manageCategory == '5' }">selected</c:if>>문의사항 게시판</option>
		
					<!-- 이벤트 등록 게시판 -->
	<!-- 				<option value="6" -->
	<%-- 					<c:if test="${boardAdminParam.manageCategory == '6' }">selected</c:if>>이벤트 게시판</option> --%>
				</select>
			</div>
		</div>
		
<!-- 날짜별 검색 -->
		<div class="row">
			<div class="col-sm-3 col-md-2 form-group form-group-sm text-center">
				<h5><strong>날짜별 검색</strong></h5>
			</div>
			<div class="col-md-3">
			    <div id="reportrange" class="pull-left form-group form-group-sm" style="background: #fff; cursor: pointer; padding: 4px 43px; border: 1px solid #ccc;">
			        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>  
			        <span></span>
			        <b class="caret"></b>
			    </div>
			 </div>
		</div>
		 	
<!-- 키워드 검색 -->		 	
		<div class="row">
			<div class="col-sm-3 col-md-2 form-group form-group-sm text-center">
				<h5><strong>키워드별 검색</strong></h5>
			</div>
			<div class="col-md-3 form-group form-group-sm">
				<select class="form-control input-sm form-group-sm" name="manageSearch" id="manageSearch">
					<option value="totalList"
					<c:if test="${boardAdminParam.manageSearch == 'totalList' || empty boardAdminParam.manageCategory}">selected</c:if>>전체</option>
					
					<option value="article_title" 
					<c:if test="${boardAdminParam.manageSearch == 'article_title' }">selected</c:if>>제목</option>
					
					<option value="article_content" 
					<c:if test="${boardAdminParam.manageSearch == 'article_content' }">selected</c:if>>내용</option>
					
					<option value="user_nick"
					<c:if test="${boardAdminParam.manageSearch == 'user_nink' }">selected</c:if>>작성자</option>
				</select>
			</div>
			
			<div class="col-md-4">
				<input type="text" class="form-control input-sm form-group-sm" name="manageKeyword" id="manageKeyword" placeholder="검색" value="${boardAdiminParam.manageKeyword }"/>
			</div>
			
			<!-- 검색 버튼 -->
			<div class="col-md-3">
 				<input type="button" class="btn btn-sm col-md-5" style="margin-left: 10px; text-align: center;" id="SearchDate" name="SearchDate" value="검색" onclick="dateSearch();"/>
			</div>
			
		</div>
		
	</form>
	
	<br>
	
<!-- 게시물 목록 -->
	<form action="/admin/board/list" method="post">
	<table class="table table-striped table-hover table-condensed">
		<thead>
			<tr>
				<th style="width: 5%"><input type="checkbox" id="allCheck" name="allCheck"></th>
				<th style="width: 5%">번호</th>
				<th style="width: 13%">게시판명</th>
				<th style="width: 40%">제목</th>
				<th style="width: 15%">작성자</th>
				<th style="width: 15%">작성일</th>
				<th style="width: 10%">조회수</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list }" var="list">
				<tr>
					<td><input type="checkbox" name="delmod" value="${list.ARTICLE_NO }" board_no="${list.BOARD_NO }" /></td>
					<td style="text-align: center;" >${list.ARTICLE_NO }</td>
					<td>${list.BOARD_NAME }</td>
					<td style="text-align: left;">
					
						<c:if test="${list.POST_STEP > 0 }">
							<c:forEach begin="1" end="${list.POST_STEP }" >
								&nbsp;&nbsp;
							</c:forEach>
							<i class="far fa-comment-dots"></i> [답변] : 
						</c:if>

						<c:choose>
							<c:when test="${list.BOARD_NO eq 1}">
								<a href="/notice/view?board_no=${list.BOARD_NO }&article_no=${list.ARTICLE_NO }">${list.ARTICLE_TITLE }</a>
							</c:when>
							
							<c:when test="${list.BOARD_NO eq 2}">
								<a href="/matefind/view?board_no=${list.BOARD_NO }&article_no=${list.ARTICLE_NO }">${list.ARTICLE_TITLE }</a>
							</c:when>
							
							<c:when test="${list.BOARD_NO eq 3}">
								<a href="/recruitboard/view?board_no=${list.BOARD_NO }&article_no=${list.ARTICLE_NO }">${list.ARTICLE_TITLE }</a>
							</c:when>
							
							<c:when test="${list.BOARD_NO eq 4 }">
								<a href="//view?board_no=${list.BOARD_NO }&article_no=${list.ARTICLE_NO }">${list.ARTICLE_TITLE }</a>
							</c:when>
							
							<c:when test="${list.BOARD_NO eq 5 }">
								<a href="/inquiry/view?board_no=${list.BOARD_NO }&article_no=${list.ARTICLE_NO }">${list.ARTICLE_TITLE }</a>
							</c:when>
							
							<c:otherwise>
								<a href="/admin/board/list">${list.ARTICLE_TITLE }</a>
							</c:otherwise>
						</c:choose>
					</td>
					<td>${list.USER_NICK }</td>
					<td>
						<fmt:formatDate value="${list.CREATE_DATE }" pattern="yy-MM-dd HH:mm" />
					</td>
					<td>${list.ARTICLE_HIT }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	
	</form>

<!-- 각 게시판 이동 select box -->	
	<form action="" name="move" method="post">
		<div>
			<select class="col-md-2 input-sm form-group-sm pull-left" name="boardMove" id="boardMove" onchange="window.location.href=this.value">
				<option value="" selected>이동할 게시판을 선택해주세요.</option>
				<option value="http://localhost:8088/notice/list">공지사항 게시판 </option>
				<option value="http://localhost:8088/matefind/list">메이트찾기 게시판</option>
				<option value="http://localhost:8088/recruitboard/list">모집 게시판</option>
				<option value="http://localhost:8088/notice/list">후기 게시판</option>
				<option value="http://localhost:8088/inquiry/list">문의 게시판</option>
				<option value="http://localhost:8088/eventboard/holding">이벤트등록 게시판</option>
			</select>
		</div>
		<div class="col-md-10">
			<input type="button" value="선택삭제" class="btn btn-danger btn-sm pull-right" onclick="isDelete()">
		</div>
	
	</form>
<br><br>

<jsp:include page="/WEB-INF/views/admin/boardManagePaging.jsp" />

</div> <!-- container end  -->

<br><br>

<!-- footer 영역 -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>