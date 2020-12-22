<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html style="background-color : #c3bdc5">
<head>
<meta charset="UTF-8">
<title>채팅방 접속</title>
<link rel="stylesheet" type="text/css" href="/resources/css/chat/room.css" />
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
    $('#chatting').scrollTop($('#chatting')[0].scrollHeight);
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
    
    if( msg == '' || msg == ' '){
    	$("#writeMsg").focus();
    	console.log("빈문자는 전달되지 않습니다.");
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
    $('#chatting').scrollTop($('#chatting')[0].scrollHeight);
}

//웹소켓 종료시 동작하는 함수
function onClose(){
    disconnect();
}

function exitRoom(){
	var res = confirm("채팅방을 정말 나가시겠습니까?");
	console.log(res);
	if( res ){
		disconnect();
		location.href="/chat/list"
	}
}

function goChatList(){
	location.href="/chat/list";
}
</script>


</head>
<body>
<div id="titleArea">
	<img id="goChatList" src="/resources/img/previous.png" style="width : 42px; height : 39px;"
		onclick="goChatList();">
	<div id="roomTitle">
		<c:choose>
		<c:when test="${chatUserList.size() eq 2 }">
			<c:forEach items="${chatUserList }" var="userList">
					<c:if test="${userList.USER_NO ne user_no}">
						<span id="roomTitleContent">${userList.USER_NICK }님과 대화</span>
					</c:if>
			</c:forEach>
		</c:when>
		<c:when test="${chatUserList.size() gt 2 }">
			<span id="roomTitleContent" >${roomInfo.CHATTING_NAME }</span>
		</c:when>
		</c:choose>
	</div>
</div>

<hr>
<div id="chattingContent">
	<div id="chatArea">
		<div id="chatting">
			<c:if test="${oldChat ne null }">
				<c:forEach items="${oldChat }" var="list">
					${list }
				</c:forEach>
			</c:if>
<!-- 			<div class="noticeArea"> -->
<!-- 			</div> -->
<!-- 			<div class="fromMsg"> -->
<!-- 				<div class="imgDiv"> -->
<!-- 					<img class="profileImg" src="/resources/img/default_profile_img.jpg"> -->
<!-- 				</div> -->
<!-- 				<div class="fromMsgInfo"> -->
<!-- 					<strong><span>아무개씨</span></strong>&nbsp; -->
<!-- 				</div> -->
<!-- 				<div class="fromChatContent fromBallon"> -->
<!-- 				</div> -->
<!-- 				<span class="fromMsgTime">시각</span> -->
<!-- 			</div> -->
<!-- 			<div class="toMsg"> -->
<!-- 				<span class="toMsgTime">시각</span> -->
<!-- 				<div class="toChatContent toBallon"> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
		<div id="usingArea">
			<input type="text" id="writeMsg" onKeyDown="enterKeyAtChat();" />
			<button id="sendBtn" onclick="send();">전송</button>
		</div>
	</div>
	<div id="etcArea">
		<button id="exitBtn" onclick="exitRoom()">채팅방 나가기</button>
		<div id="userListArea">
			<table>
				<tr>
					<th>회원 목록</th>
				</tr>
				 <c:forEach items="${chatUserList }" var="user">
				 <c:choose>
				 	<c:when test="${user_no eq user.USER_NO }">
						<tr>
							<td>${user.USER_NICK } <span id="checkme">&lt;나&gt;</span></td>
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
</div>

</body>
</html>