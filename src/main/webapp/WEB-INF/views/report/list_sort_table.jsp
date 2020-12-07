<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div>
 정렬기준 
<c:choose>
<c:when test="${sortPart eq 0 }">
<select id="sortPart" name ="part" onchange="selectValue(this.value)">
	<option value="0" selected>신고일시</option> 	
	<option value="1">회원번호 </option> 	
	<option value="2">신고사유</option> 	
</select>
</c:when>
<c:when test="${sortPart eq 1 }">
<select id="sortPart" name ="part" onchange="selectValue(this.value)">
	<option value="0">신고일시</option> 	
	<option value="1" selected>회원번호 </option> 	
	<option value="2">신고사유</option> 	
</select>
</c:when>
<c:when test="${sortPart eq 2 }">
<select id="sortPart" name ="part" onchange="selectValue(this.value)">
	<option value="0">신고일시</option> 	
	<option value="1">회원번호 </option> 	
	<option value="2" selected>신고사유</option> 	
</select>
</c:when>
</c:choose>
방향
<c:choose>
<c:when test="${sortType eq 0 }">
<select id="sortType" name="sort" onchange="selectValue(this.value)">
	<option value="0" selected>오름차순</option>
	<option value="1">내림차순</option>
</select> 
</c:when>
<c:when test="${sortType eq 1 }">
<select id="sortType" name="sort" onchange="selectValue(this.value)">
	<option value="0">오름차순</option>
	<option value="1" selected>내림차순</option>
</select> 
</c:when>

</c:choose>
</div>

<form action="/report/result" method="post">
<button>유저 처리</button>
<table border="1">
	<tr>
		<th></th>
		<th>회원번호</th>
		<th>신고 일시</th>
		<th>신고 사유</th>
		<th>신고 내용</th>
		<th>신고 글 보기</th>
		<th>신고 처리</th>
	</tr>
	<c:forEach items="${list }" var="list">
	<tr>
		<td><input type="checkbox" name="user_no" value="${list.user_no }"/></td>
		<td>${list.user_no }</td>
		<td>
			<fmt:formatDate value="${list.report_time }" pattern="yy/MM/dd HH:mm:ss"/>
		</td>
		<td>${list.reason_no }</td>
		<td>
			<c:if test="${list.report_content eq null }">
				-
			</c:if>
			<c:if test="${list.report_content ne null }">
				${list.report_content }
			</c:if>
		</td>
		<td>
			<c:if test="${list.board_url eq null }">
				-
			</c:if>
			<c:if test="${list.board_url ne null }">
				<a href="${list.board_url }" >${list.board_url }</a>
			</c:if>
		</td>
		<td>
			<select name="${list.user_no }">
				<option value="0">선택암함</option>
				<option value="1">${resultReason.report_result_content }</option>
			</select>
		</td>
	</tr>
	</c:forEach>
</table>
</form>
<jsp:include page="/WEB-INF/views/report/paging_sort.jsp"/>