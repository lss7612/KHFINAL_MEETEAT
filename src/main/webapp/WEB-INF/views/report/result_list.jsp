<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/report/result_list.css">
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
$(document).ready(function(){
	$("#searchBtn").click(function(){
		var search = $('#search').val();
		console.log(""+search);
	})
})
 
function searchBtnclick(){
	console.log("아이디 검색 시작")
	var search = $('#search').val();
	console.log(""+search);
	location.href="/admin/report/result/list?search="+search;
}

function enterKey(){
	if(window.event.keyCode == 13){
		searchBtnclick();
	}
}
</script>

<div id="divpage">
<h1><a href="/admin/report/result/list">신고 결과 처리 목록</a></h1>
<hr>
<div id="searchArea">
	<c:choose>
		<c:when test="${search eq null }">
			<input type="text" id="search" class="form-control" placeholder="아이디를 입력하세요" onKeyDown="enterKey();"/> 
		</c:when>
		<c:when test="${search ne null }">
			<input type="text" id="search" class="form-control" placeholder="아이디를 입력하세요" value="${search }" onKeyDown="enterKey();"/> 
		</c:when>
	</c:choose>
	<input type="button" id="searchBtn" value="아이디검색" class="btn btn-primary" onclick="searchBtnclick();">
</div>
<br>
<table class="table table-bordered table-hover">
<tr>
	<th>번호</th>
	<th>회원 아이디</th>
	<th>회원 번호</th>
	<th>처리 일시 </th>
	<th>처리 종류 번호 </th>
	<th>처리 내용</th>
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
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>