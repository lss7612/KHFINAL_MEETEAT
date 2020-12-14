<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div>
정렬기준 
<c:choose>
<c:when test="${sortPart eq 0 }">
<select id="sortPart" name ="part" onchange="selectValue(this.value)" class="form-control">
	<option value="0" selected>신고일시</option> 	
	<option value="1">회원번호 </option> 	
	<option value="2">신고사유</option> 	
</select>
</c:when>
<c:when test="${sortPart eq 1 }">
<select id="sortPart" name ="part" onchange="selectValue(this.value)" class="form-control">
	<option value="0">신고일시</option> 	
	<option value="1" selected>회원번호 </option> 	
	<option value="2">신고사유</option> 	
</select>
</c:when>
<c:when test="${sortPart eq 2 }">
<select id="sortPart" name ="part" onchange="selectValue(this.value)" class="form-control">
	<option value="0">신고일시</option> 	
	<option value="1">회원번호 </option> 	
	<option value="2" selected>신고사유</option> 	
</select>
</c:when>
</c:choose>
방향
<c:choose>
<c:when test="${sortType eq 0 }">
<select id="sortType" name="sort" onchange="selectValue(this.value)" class="form-control">
	<option value="0" selected>오름차순</option>
	<option value="1">내림차순</option>
</select> 
</c:when>
<c:when test="${sortType eq 1 }">
<select id="sortType" name="sort" onchange="selectValue(this.value)" class="form-control">
	<option value="0">오름차순</option>
	<option value="1" selected>내림차순</option>
</select> 
</c:when>

</c:choose>
검색
<c:choose>
	<c:when test="${search eq null }">
		<input type="text" id="search" class="form-control" 
			style="width : auto; dispaly : inline;" placeholder = "id 검색" onKeyDown="enterKey();">
	</c:when>
	<c:when test="${search ne null }">
		<input type="text" id="search" class="form-control" 
			style="width : auto; dispaly : inline;" placeholder = "id 검색" value="${search }" onKeyDown="enterKey();">
	</c:when>
</c:choose>
<button id="searchBtn" class="btn btn-primary" onclick="searchBtnclick();">아이디 검색</button>
</div>
<br>

<form action="/admin/report/result" method="post">

<table id="reportList" class="table table-bordered table-hover">
<tr>
	<th>순번</th>
	<th>회원번호</th>
	<th>회원 아이디 </th>
	<th>신고 일시</th>
	<th>신고 사유</th>
	<th>신고 항목</th>
	<th>신고 내용</th>
	<th>신고 글 보기</th>
	<th>신고 처리</th>
</tr>
<c:forEach items="${list }" var="hashmap">
	<tr>
		<td>${hashmap.RNUM }</td>
		<td>${hashmap.USER_NO }</td>
		<td>${hashmap.USER_ID}</td>
		<td>
			<fmt:formatDate value="${hashmap.REPORT_TIME }" pattern="yy/MM/dd HH:mm:ss"/>
		</td>
		<td>${hashmap.REASON_NO }</td>
		<td>${hashmap.REASON_CONTENT}</td>
		<td>
			<c:if test="${hashmap.REPORT_CONTENT eq null }">
				-
			</c:if>
			<c:if test="${hashmap.REPORT_CONTENT ne null }">
				${hashmap.REPORT_CONTENT }
			</c:if>
		</td>
		<td>
			<c:if test="${hashmap.BOARD_URL eq null }">
				-
			</c:if>
			<c:if test="${hashmap.BOARD_URL ne null }">
				<a href="${hashmap.BOARD_URL }" >${hashmap.BOARD_URL }</a>
			</c:if>
		</td>
		<td>
			<select name="${hashmap.USER_NO }">
				<option value="0">선택암함</option>
				<option value="1">${resultReason.report_result_content }</option>
			</select>
		</td>
	</tr>
</c:forEach>
</table>
<button id="doProcess" class="btn btn-danger" >유저 처리</button>
</form>
<br>
<jsp:include page="/WEB-INF/views/report/list_sort_paging.jsp"/>


