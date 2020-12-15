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
function goChatRoom(){
	var chatId = this.${list.CHATTING_ID}
	console.log("클릭됨");
	console.log(chatId);
}
</script>
</head>
<body>
<h1>채팅목록</h1>
<hr>


<div id="chatList">
	<c:forEach items="${chatList }" var="list">
	<div onclick="location.href='/chat/room/${list.CHATTING_ID}'">
		<c:choose>
		<c:when test="${list.CHATTING_NAME eq null }">
			개인 대화
		</c:when>
		<c:when test="${list.CHATTING_NAME ne null }">
			${list.CHATTING_NAME }
		</c:when>
		</c:choose>
		${list.USER_NICK }
		${list.MSG_CONTENT }
		<fmt:formatDate value="${list.MSG_DATE }" pattern="yy/MM/dd HH:mm"/>
	</div>
	</c:forEach>

</div>
</body>
</html>