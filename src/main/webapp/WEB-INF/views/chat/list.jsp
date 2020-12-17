<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅목록</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
#chatList{
	height : 500px;
	width : 600px;
	border : solid #b9d9e0;
}

.innerList{
	height : 50px;
	border : black;
	border-style : solid;
	border-top-width : 0; 
	border-bottom-width : 1px;
	border-left-width : 0;
	border-right-width : 0;
}

.innerContentArea{
	float : right;
}

.innerTime{
	font-size : small;
	margin-right : 10px;
}

.innerContent{
	display : inline-block;
	max-width : 200px;
	height : 20px;
	overflow : hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.innerList:hover{background:#ccc;}

</style>
</head>
<body>
<h1>채팅목록</h1>
<hr>
<c:set var="now" value="<%=new Date() %>"/>

<div id="chatList">
	<fmt:formatDate value="${now }" var="today" pattern="yyMMdd"/>
	<fmt:parseNumber value="${today }" integerOnly="true" var="isDate" />
	<c:forEach items="${chatList }" var="list">
	<div class="innerList" onclick="location.href='/chat/room/${list.CHATTING_ID}'">
		<c:choose>
		<c:when test="${list.CHATTING_NAME eq null }">
			<c:forEach items="${roomUserInfo}" var="info">
				<c:if test="${info.CHATTING_NO eq list.CHATTING_NO }">
					<strong>${info.USER_NICK }님과의 대화</strong>
				</c:if>
			</c:forEach>
		</c:when>
		<c:when test="${list.CHATTING_NAME ne null }">
			${list.CHATTING_NAME }
		</c:when>
		</c:choose>
		<br>
		<div class="innerContentArea">
			<span class="innerTime">
			<!-- 날자 비교해서 오늘 / 어제/ 기타로 출력 -->
			<fmt:formatDate value="${list.MSG_DATE }" var="msg_date" pattern="yyMMdd"/>
			<fmt:parseNumber value="${msg_date }" integerOnly="true" var="itDate" />
			<c:choose>
				<c:when test="${today eq msg_date }">
					오늘
					<fmt:formatDate value="${list.MSG_DATE }" type="both" pattern="a"/>
					<fmt:formatDate value="${list.MSG_DATE }" pattern="HH:mm"/>
				</c:when>
				<c:when test="${isDate - itDate eq 1}">
					어제
					<fmt:formatDate value="${list.MSG_DATE }" type="both" pattern="a"/>
					<fmt:formatDate value="${list.MSG_DATE }" pattern="HH:mm"/>
				</c:when>
				<c:otherwise>
					<fmt:formatDate value="${list.MSG_DATE }" pattern="yy/MM/dd HH:mm"/>
				</c:otherwise>
			</c:choose>
			</span>
			<span class="innerContent">
				${list.MSG_CONTENT }
			</span>
		</div>
	</div>
	</c:forEach>

</div>
</body>
</html>