<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
			<select name="report_result">
				<option value="-">선택암함</option>
				<option value="1">${resultReason.report_result_content }</option>
			</select>
		</td>
	</tr>
	</c:forEach>
</table>
</form>
<jsp:include page="/WEB-INF/views/report/paging.jsp"/>