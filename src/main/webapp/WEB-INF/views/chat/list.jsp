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
	width : auto;
	border : black;
	border-style : solid;
	border-top-width : 0; 
	border-bottom-width : 1px;
	border-left-width : 0;
	border-right-width : 0;
}

.innerContentArea{
	text-align : right;
}
</style>
</head>
<body>
<h1>채팅목록</h1>
<hr>


<div id="chatList">
	<c:forEach items="${chatList }" var="list">
	<div class="innerList" onclick="location.href='/chat/room/${list.CHATTING_ID}'">
		<c:choose>
		<c:when test="${list.CHATTING_NAME eq null }">
			<c:forEach items="${roomUserInfo}" var="info">
				<c:if test="${info.CHATTING_NO eq list.CHATTING_NO }">
					${info.USER_NICK }님과의 대화
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
				<fmt:formatDate value="${list.MSG_DATE }" pattern="yy/MM/dd HH:mm"/>
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