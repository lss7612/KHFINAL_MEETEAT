<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방 대기중</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#chattingForm").submit();
})

</script>
</head>
<body>
<h1>채팅방 입장 대기중...</h1>
<form id="chattingForm" action = "/chat/room" method="post">
	<input type="hidden" name="chatting_id" value="${chatting_id }">
</form>
</body>
</html>