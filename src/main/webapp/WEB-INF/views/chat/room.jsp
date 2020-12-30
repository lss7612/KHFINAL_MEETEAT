<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
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
  	
  	//스크롤바 하단고정
    $('#chatting').scrollTop($('#chatting')[0].scrollHeight);

	//mouseleave
	$(".chatListUserMenu").mouseleave(function(){
		if($(".userHiddenMenu").is(":visible")){
			console.log("hidden menu close")
			$(".chatListUserMenu >td").css({"padding" : "3px 3px 3px 3px"});
			$(".userHiddenMenu").slideUp();
		}
	})
	
    //채팅목록에서 닉네임 클릭시 나타나는 유저메뉴
    $(".chatListUserMenu >td>span").click(function(){
    	console.log("---유저닉네임 클릭 감지---")
    	var submenu = $(this).next().next("ul");
    	var tbrow = $(this).parent();
    	
    	if(submenu.is(":visible")){
			submenu.slideUp();
			$(tbrow).css({"padding" : "3px 3px 3px 3px"});
		} else{
			//already open user hidden menu close
			$(".chatListUserMenu >td").css({"padding" : "3px 3px 3px 3px"});
			$(".chatListUserMenu >td>span").next().next("ul").slideUp();
			console.log("already open hidden menu closed")
			
			submenu.slideDown();
			$(submenu).css({"display" : "inline-block", "left" : "40px"});
			$(tbrow).css({"padding" : "5px 3px 5px 3px"});
			console.log("hidden menu open");
		}
    	
    })
    
})

//회원 목록에서 채팅하기 클릭시 동작할 함수
function createChat(e){
	var user_no = $(e).attr("user_no")
	var loginUserNo = $(e).attr("loginUserNo")
	if(loginUserNo == user_no){
		alert("자기 자신과는 대화할 수 없습니다!")
		return false;
	} else {
		window.open("http://localhost:8088/chat/create?user_no="+user_no, "chatCreate"
				, "width = 710px, height = 665px");
	}
}


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
    
    webSocket.send(JSON.stringify(sendMsg));
	msg ="";
	$("#writeMsg").val('');
	$("#writeMsg").focus();
}

//연결 종료시 동작하는 함수
function disconnect(){
	var sendMsg = {chatRoomNo:${roomInfo.CHATTING_NO}, type:'LEAVE', writer:${user_no} }
    webSocket.send(JSON.stringify(sendMsg));
    webSocket.close();
}

//소켓 연결시 동작하는 함수
function onOpen(){
	var sendMsg = {chatRoomNo:${roomInfo.CHATTING_NO}, type:'ENTER', writer:${user_no}}
    webSocket.send(JSON.stringify( sendMsg ));
}

//메시지 도착시 동작하는 함수
var lmd = "${lastMsgDate}";
function onMessage(e){
// 	console.log("lmd : "+lmd);
    data = e.data;
    console.log("e : "+e);
    console.log("data : "+data);
//     console.log("웹소켓에서 전달해준 메세지 : "+data.msg);
    
    var jsonStr = JSON.parse(data)
    
//     console.log("jsonStr : "+jsonStr);
//     console.log("jsonStr.writer : "+jsonStr.writer);
//     console.log("session user_no : "+${user_no});
//     console.log("메시지 전송 날자 : "+jsonStr.msgDate);
//     console.log("기존 기준 날자 : "+lmd);
    var msgDate = jsonStr.msgDate;
   	lmd = dateSet(lmd, msgDate)

    
//    	console.log("lmd : "+lmd);
    chatroom = document.getElementById("chatting");
    chatroom.innerHTML = chatroom.innerHTML + jsonStr.msg;
    $('#chatting').scrollTop($('#chatting')[0].scrollHeight);
    return lmd;
}

//Closure
var f = onMessage(e);

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

function dateSet(lmd, msgDate){
	if(lmd == msgDate){
		console.log("메시지 날자가 같습니다.");
		return lmd;
	} else {
		console.log("메시지 날자가 다릅니다.");
		console.log("lmd : "+lmd);
		lmd = msgDate
		$("#chatting").append("<div class='noticeArea'><span>"+msgDate+" </span></div>")
		return lmd;
	}
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
			<c:choose>
				<c:when test="${roomInfo.CHATTING_NAME eq null }">
					<span id="roomTitleContent" >이름없는 대화방 (${chatUserList.size() })</span>
				</c:when>
				<c:otherwise>
					<span id="roomTitleContent" >${roomInfo.CHATTING_NAME }</span>
				</c:otherwise>
			</c:choose>
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
<!-- 			<div class='noticeArea'><span> 채팅방에 입장하셨습니다.</span></div> -->
<!-- 			<div class='noticeArea'><span>"+user_nick+"님이 채팅방에 입장하셨습니다.</span></div> -->
<!-- 			<div class='noticeArea'><span>"+user_nick+"님이 채팅방에서 퇴장하셨습니다.</span></div> -->
<!-- 		<div class='noticeArea'><span> yyyy년 MM월 dd일 </span></div> -->
		</div>
		<div id="usingArea">
			<input type="text" id="writeMsg" onKeyDown="enterKeyAtChat();" />
			<button type="button" id="sendBtn" onclick="send();">전송</button>
		</div>
	</div>
	<div id="etcArea">
		<div id="chatUserListHeadArea">
			<span id="chatUserListHead">유저목록</span>
		</div>
		<div id="userListArea">
			<table id="chatUserList">
				 <c:forEach items="${chatUserList }" var="user">
				 <c:choose>
				 	<c:when test="${user_no eq user.USER_NO }">
				 		<c:choose>
				 			<c:when test="${user.USER_GENDER eq 'M' }">
				 				<tr>
									<td>🙍‍♂️ ${user.USER_NICK } <span id="checkme">&lt;나&gt;</span></td>
								</tr>
				 			</c:when>
				 			<c:otherwise>
								<tr>
									<td> 🙍‍♀️ ${user.USER_NICK } <span id="checkme">&lt;나&gt;</span></td>
								</tr>
				 			</c:otherwise>
				 		</c:choose>
				 	</c:when>
				 	<c:when test="${user_no ne user.USER_NO }">
				 		<c:choose>
				 			<c:when test="${user.USER_GENDER eq 'M' }">
								<tr class="chatListUserMenu">
									<td style="position : relative;">
										<span class="chatListUserNick">🙍‍♂️ ${user.USER_NICK }</span>
										<br>
										<ul class="userHiddenMenu">
											<li onclick="createChat(this);" loginUserNo="${user_no }"  user_no="${user.USER_NO }">채팅하기</li>
										</ul>
									</td>
								</tr>
				 			</c:when>
				 			<c:otherwise>
								<tr class="chatListUserMenu">
									<td style="position : relative;">
										<span class="chatListUserNick">🙍‍♀️ ${user.USER_NICK }</span>
										<br>
										<ul class="userHiddenMenu">
											<li onclick="createChat(this);" loginUserNo="${user_no }"  user_no="${user.USER_NO }">채팅하기</li>
										</ul>
									</td>
								</tr>
				 			
				 			</c:otherwise>
				 		</c:choose>
				 	</c:when>
				 </c:choose>
				 </c:forEach>
				 <!-- Hidden Menu용 여백셀 -->
				 <tr>
				 	<td>&nbsp;</td>
			 	</tr>
			</table>
		</div>
		<br>
		<button id="exitBtn" onclick="exitRoom()">나가기 </button>
	</div>
</div>

</body>
</html>