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
<link rel="stylesheet" type="text/css" href="/resources/css/chat/list.css" />
<script type="text/javascript">
function submitChatForm(e){
	console.log(e);
	console.log($(e).children('form'));
	$(e).children('form').submit();
}
</script>

</head>
<body>
<h1 id="chatListHead">채팅목록</h1>
<hr>

<div id="chatList">
	<c:choose>
		<c:when test="${roomUserInfo.size() eq 0 }">
			<div id="imgArea">
				<img id="noneListImg" src="/resources/img/no_chat_list_img.png">
			</div>
		</c:when>
		<c:otherwise>
			<c:import url="/WEB-INF/views/chat/list_chat_list.jsp"/>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>