<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방 접속</title>
<style type="text/css">

#chattingContent{
	width : 100%;
	height : 810px;
}
#chatArea, #userListArea{
/* 	display : inline-block; */
}

#chatArea{
	float : left;
	height : 800px;
	width : 70%;
	border : solid 1px;
}

#userListArea{
	border : solid 1px;
	float : left;
	width : 25%;
	margin-left : 10px;
}

</style>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript"></script>


</head>
<body>
<c:if test="${chatUserList.size() eq 2 }">
	<c:forEach items="${chatUserList }" var="userList">
		<c:choose>
			<c:when test="${userList.USER_NO ne user_no}">
				${userList.USER_NICK }님과 대화
			</c:when>
		</c:choose>
	</c:forEach>
</c:if>

<hr>
<div id="chattingContent">
	<div id="chatArea">
		
	</div>
	<div id="userListArea">
	<table>
		<tr>
			<th>회원 목록</th>
		</tr>
		 <c:forEach items="${chatUserList }" var="user">
			<tr>
				<td>${user.USER_NICK }</td>
			</tr>
		 </c:forEach>
	</table>
	</div>
</div>
<input type="text" id="chatContent"/><button onclick="send();">전송</button>

<script type="text/javascript">
//웹소켓 객체 생성 코드
var webSocket;
console.log(webSocket)
if (webSocket !== undefined && webSocket.readyState != WebSocket.CLOSED){
	console.log("이미 만들어져있습니다.")
} else {
	console.log("새로운 websocket생성.")
	webSocket = new WebSocket("ws://localhost:8088/chatws/${roomInfo.CHATTING_ID}");
	console.log(webSocket);
	webSocket.onopen;
	//webSocket.onOpen();
	console.log(webSocket);
}
webSocket.onmessage = onMessage;

var user_no = "${user_no}";
var roomId = "${roomInfo.CHATTING_ID}";
var roomNo = "${roomInfo.CHATTING_NO}"
console.log("회원번호 : "+user_no);
console.log("roomId:"+roomId);
$(document).ready(function(){
    //webSocket.onclose = onClose;
})
function send(){
	var msg = document.getElementById("chatContent").value;
// 	var sendMsg = "{chatRoomId:${room.roomId}, type:CHAT, writer:${id}, message:"+msg+" }"
	var sendMsg = "{writer:${user_no}, message:"+msg+" }"
    console.log("msg : "+msg);
    console.log("msg : "+sendMsg);
    webSocket.send(JSON.stringify(sendMsg));
	msg ="";
	$("#chatContent").val();
}

function disconnect(){
// 	var sendMsg = "{chatRoomId:${room.roomId}, type=LEAVE, writer:${id}}"
	var sendMsg = "{writer:${user_no}}"
    webSocket.send(sendMsg);
    webSocket.close();
}

function onOpen(){
	var sendMsg = "{chatRoomNo:${roomInfo.CHATTING_NO}, type=ENTER, writer:${user_no}}"
// 	var sendMsg = "{writer:${id}}"
    webSocket.send(sendMsg);
}

function onMessage(e){
    data = e.data;
    console.log(e);
    console.log(data);
    console.log(data.message);
    console.log("웹소켓에서 전달해준 메세지 : "+data);
    
    chatroom = document.getElementById("chatArea");
    chatroom.innerHTML = chatroom.innerHTML + "<br>" + data;
}

function onClose(){
    disconnect();
}

</script>

</body>
</html>