<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#searchBtn").click(function(){
		var search = $('#search').val();
		console.log(""+search);
		location.href="/admin/report/result/list?search="+search;
	})
})
</script>

<style type="text/css">
#search{
	display : inline;
	width : 150px;
}
</style>
</head>
<body>
<h1><a href="/admin/report/result/list">신고 결과 처리 목록</a></h1>
<hr>
<div>
<input type="text" id="search" class="form-control" /> 
<input type="button" id="searchBtn" value="아이디검색" class="btn btn-primary">
</div>
<br>
<table class="table table-bordered table-hover">
<tr>
	<th>번호</th>
	<th>회원 아이디</th>
	<th>회원 번호</th>
	<th>처리 일시 </th>
	<th>처리 사유 번호 </th>
	<th>처리 사유 내용</th>
</tr>
<c:forEach items="${list }" var="hashmap">
	<tr>
			<td>${hashmap.REPORT_RESULT_NO }</td>
			<td>${hashmap.USER_ID}</td>
			<td>${hashmap.USER_NO}</td>
			<td>
				<fmt:formatDate value="${hashmap.REPORT_RESULT_DATE}" pattern="yy/MM/dd HH:mm"/>
			</td>
			<td>${hashmap.REPORT_RESULT}</td>
			<td>${hashmap.REPORT_RESULT_CONTENT}</td>
	</tr>
</c:forEach>
</table>
<br><br>


<jsp:include page="/WEB-INF/views/report/result_list_paging.jsp"/>
</body>
</html>