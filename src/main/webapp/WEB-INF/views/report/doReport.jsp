<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 신고</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="/resources/js/report/doReport.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/report/doReport.css">

</head>
<body>
<div id="reportTitleArea">
<h1 id="reportTitle">🚨 회원 신고</h1>
</div>
<hr>
<div id="reportTargetView">
	<strong>대상</strong> : <span id="reportTargetId">${user.USER_NICK }(${user.USER_ID })</span><br>
	<strong>신고 글 </strong>: <span id="reportTargetUrl">${url }</span>
</div>
<form name="summit" action="/report/doReport/cmplt" method="post">
<div class="checkbox" id="formList">
<c:forEach items="${list }" var="hashmap">
<c:choose>
	<c:when test="${hashmap.REASON_NO eq 1 }">
		<label>
		<input type="radio" name="reason_no" value="${hashmap.REASON_NO }" checked = "checked"/> 
		${hashmap.REASON_NO }. ${hashmap.REASON_CONTENT }<br>
		</label>
	</c:when>
	<c:when test="${hashmap.REASON_NO eq 5 }">
		<label>
		<input type="radio" name="reason_no" value="${hashmap.REASON_NO }"/> 
		${hashmap.REASON_NO }. ${hashmap.REASON_CONTENT }<br>
		</label>
	</c:when>
	<c:otherwise>
		<label>
		<input type="radio" name="reason_no" value="${hashmap.REASON_NO }"/> 
		${hashmap.REASON_NO }. ${hashmap.REASON_CONTENT }<br>
		</label>
	</c:otherwise>
</c:choose>
</c:forEach>
	<input type="hidden" name= "user_no" value="${user.USER_NO }">
	<input type="hidden" name= "board_url" value="${url }"/>
</div>
<textarea id="report_content" name="report_content" class="form-control" ></textarea><br>
<div id="buttonDiv">
	<button id="reportDo" class="btn btn-primary" >신고</button>
	<input type="button" id="reportCancel"class="btn btn-danger" onclick="popupClose();" value="취소"/>
</div>
</form>
</body>
</html>