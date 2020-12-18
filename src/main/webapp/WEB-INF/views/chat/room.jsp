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

#chatting{
	height: 85%;
    background-color: #ececc2;
}

#usingArea{
	height : 15%;
	background-color : #ece2e2;
    border-top: solid 1px;
    border-bottom: solid 1px;
}

#writeMsg{
    height: 80%;
    width: 80%;
    margin-top : 1%;
    margin-left : 1%;
    vertical-align: middle;
}

#sendBtn{
    margin-top : 1%;
	width : 15%;
	height : 80%;
	background-color: skyblue;
	vertical-align: middle;
}

.noticeArea{
    height: 4%;
    width: auto;
    background-color: gainsboro;
    border-radius: 3px;
    text-align: center;
    margin-bottom: 1%;
}

</style>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
var webSocket;
$(document).ready(function(){
	//채팅입력창 포커스
    $("#writeMsg").focus();
    
  	//웹소켓 객체 생성 코드
    console.log(webSocket)
    if (webSocket !== undefined && webSocket.readyState != WebSocket.CLOSED){
    	console.log("이미 만들어져있습니다.")
    } else {
    	console.log("새로운 websocket생성.")
    	webSocket = new WebSocket("ws://localhost:8088/chatws/${roomInfo.CHATTING_ID}");
    	console.log(webSocket);
    	webSocket.onopen = onOpen;
    	webSocket.onclose = onClose;
	    webSocket.onmessage = onMessage;
    	console.log(webSocket);
    }
    
})


//input 박스에서 enter키 입력하면 동작하는 함수
function enterKeyAtChat(){
	if(window.event.keyCode == 13){
		send();
	}
}

//전송버튼 클릭시 동작하는 함수
function send(){
	var msg = document.getElementById("writeMsg").value;
	var sendMsg = {chatRoomNo:${roomInfo.CHATTING_NO}, type:'CHAT', writer:${user_no}, msg : msg }
    console.log("msg : "+msg);
    console.log("msg : "+sendMsg);
    
    if( msg == ''){
    	$("#writeMsg").focus();
    	return false;
    }
    //webSocket.send(sendMsg);
    webSocket.send(JSON.stringify(sendMsg));
	msg ="";
	$("#writeMsg").val('');
	$("#writeMsg").focus();
}

//연결 종료시 동작하는 함수
function disconnect(){
	var sendMsg = {chatRoomNo:${roomInfo.CHATTING_NO}, type:'LEAVE', writer:${user_no} }
// 	var sendMsg = "{writer:${user_no}}"
//     webSocket.send(sendMsg);
    webSocket.send(JSON.stringify(sendMsg));
    webSocket.close();
}

//소켓 연결시 동작하는 함수
function onOpen(){
	var sendMsg = {chatRoomNo:${roomInfo.CHATTING_NO}, type:'ENTER', writer:${user_no}}
// 	var sendMsg = "{writer:${id}}"
//	webSocket.send(sendMsg);
    webSocket.send(JSON.stringify( sendMsg ));
}

//메시지 도착시 동작하는 함수
function onMessage(e){
    data = e.data;
    console.log("e : "+e);
    console.log("data : "+data);
    console.log("웹소켓에서 전달해준 메세지 : "+data.msg);
    var jsonStr = JSON.parse(data)
    console.log("jsonStr : "+jsonStr);
    console.log("jsonStr.writer : "+jsonStr.writer);
    if(jsonStr.writer == ${user_no}){
    	console.log("내가 보낸메시지 : "+jsonStr.msg);
    } else {
    	console.log("다른 사람이 보낸 메시지")
    }
    
    chatroom = document.getElementById("chatting");
    chatroom.innerHTML = chatroom.innerHTML + jsonStr.msg;
}

//웹소켓 종료시 동작하는 함수
function onClose(){
    disconnect();
}

</script>


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
		<div id="chatting">
<!-- 			<div class="noticeArea"> -->
<!-- 				<span>ㅁㅁㅁ님이 채팅방에 입장하셨습니다.</span> -->
<!-- 			</div> -->
<!-- 			<div id="fromMsg"> -->
<!-- 				<div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div id="toMsg"> -->
<!-- 				<div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
		<div id="usingArea">
			<input type="text" id="writeMsg" onKeyDown="enterKeyAtChat();" />
			<button id="sendBtn" onclick="send();">전송</button>
		</div>
	</div>
	<div id="userListArea">
	<table>
		<tr>
			<th>회원 목록</th>
		</tr>
		 <c:forEach items="${chatUserList }" var="user">
		 <c:choose>
		 	<c:when test="${user_no eq user.USER_NO }">
				<tr>
					<td>${user.USER_NICK } &lt;나&gt;</td>
				</tr>
		 	</c:when>
		 	<c:when test="${user_no ne user.USER_NO }">
				<tr>
					<td>${user.USER_NICK } </td>
				</tr>
		 	
		 	</c:when>
		 </c:choose>
		 </c:forEach>
	</table>
	</div>
</div>

</body>
</html>