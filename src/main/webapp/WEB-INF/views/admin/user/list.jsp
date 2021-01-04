<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
table {
	table-layout: fixed;
}

table, th, td {
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
function userGradeSet(){
	var state = confirm("유저 등급을 바꾸시겠습니까?")
	if (state){
		alert("처리가 완료되었습니다.")
		resultForm.submit();
	} else {
		return false;
	}
}
</script>

<div class="container" id="divpage">

<h1 class="pull-left">유저 관리</h1>
<div class="clearfix"></div>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%">유저번호</th>
		<th style="width: 15%">아이디</th>
		<th style="width: 15%">닉네임쓰</th>
		<th style="width: 15%">성별</th>
		<th style="width: 10%">나이</th>
		<th style="width: 10%">경고카운트</th>
		<th style="width: 15%">이메일</th>
		<th style="width: 10%">등급</th>
		<th style="width: 10%">게시글 관리</th>
		<th style="width: 10%">등급조정</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="list">
	<tr>
		<td>${list.USER_NO }</td>
		<td style="text-align: center;">${list.USER_ID }</td>
		<td>${list.USER_NICK }</td>
		<td>${list.USER_GENDER }</td>
		<td>${list.USER_AGE }</td>
		<td>${list.USER_BLOCKCNT }</td>
		<td>${list.USER_EMAIL }</td>
		<td>${list.USER_GRADE }</td>
<%-- 		<td><a href="http://localhost:8088/admin/board/list?manageCategory=&manageSearch=user_nick&manageKeyword=${list.USER_NICK }" /><button>이동</button></td> --%>
<%-- 		<td><a href="/admin/board/list?manageCategory=&manageKeyword=${list.USER_NICK }&manageSearch=user_nick&start_date=&end_date="><button>이동</button></a></td> --%>
		<td><a href="/admin/board/list?manageCategory=&manageSearch=user_nick&manageKeyword=${list.USER_NICK }"><button>이동</button></a></td>
		
	<form action="/admin/user/result" method="post" id="resultForm">
		<td>
			<select name="${list.USER_NO }">
				<option value="999">---</option>
				<option value="1">1:결제등급</option>
				<option value="2">2:일반등급</option>
				<option value="3">3:영구정지</option>
			</select>
		</td>
	</tr>
</c:forEach>
</tbody>
</table>
<button onclick="userGradeSet();">등급처리 </button>
</form>

<div class="clearfix"></div>

<form action="/admin/user/list" method="get" class="form-inline text-center">
	<div class="searchbox form-group form-group-sm ">
		<select class="search form-control" style="width: 100px;" name="user_search" id="user_search">
			<option value="user_id" <c:if test="${userSearch.user_search == 'user_id' }">selected</c:if>>아이디</option>		
			<option value="user_nick" <c:if test="${userSearch.user_search == 'user_nick' }">selected</c:if>>닉네임</option>		
			<option value="user_blockcnt" <c:if test="${userSearch.user_search == 'user_blockcnt' }">selected</c:if>>경고수</option>		
			<option value="user_grade" <c:if test="${userSearch.user_search == 'user_grade' }">selected</c:if>>등급</option>		
		</select>
	</div>
	
	<div class="form-group form-group-sm">
		<input type="text" class="form-control" name="user_keyword" id="user_keyword" value="${userSearch.user_keyword }" />
		<button type="submit" class="btn btn-sm" id="btnsearch" value="검색">검색</button>
	</div>
</form>

<jsp:include page="/WEB-INF/views/admin/user/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />