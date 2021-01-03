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

    $(function(){
		$("#writeMsg").on('input', function(){
			if($("#writeMsg").val()==''){
				$("#sendBtn").attr("disabled", true);
			} else {
				$("#sendBtn").attr("disabled", false);
			}
		})
	})
    
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
    
    webSocket.send(JSON.stringify(sendMsg));
	msg ="";
	$("#writeMsg").val('');
	$("#writeMsg").focus();
}

//연결 종료시 동작하는 함수
function disconnect(){
	var sendMsg = {chatRoomNo:${roomInfo.CHATTING_NO}, type:'LEAVE', writer:${user_no} }
    webSocket.send(JSON.stringify(sendMsg));
//     webSocket.close();
//     location.href="/chat/list"
}

//소켓 연결시 동작하는 함수
function onOpen(){
	var sendMsg = {chatRoomNo:${roomInfo.CHATTING_NO}, type:'ENTER', writer:${user_no}}
    webSocket.send(JSON.stringify( sendMsg ));
}

//메시지 도착시 동작하는 함수
var lmd = "${lastMsgDate}";
function onMessage(e){
    data = e.data;
    console.log("e : "+e);
    console.log("data : "+data);
    
    var jsonStr = JSON.parse(data);
    var chatting_no = jsonStr.chatRoomNo;
    var msgDate = jsonStr.msgDate;
    var msgType = jsonStr.type;
    var writer_no = jsonStr.writer;
    
    console.log("chatting_no : "+chatting_no);
    console.log("msgDate : "+msgDate);
    console.log("msgType : "+msgType);
    console.log("writer_no : "+writer_no);
    
    msgTypeAjax(msgType, writer_no, chatting_no);
   	lmd = dateSet(lmd, msgDate)

   	//전달된 메시지가 내가 나가는 경우 목록으로 이동
    if(msgType == 'LEAVE' && writer_no == ${user_no}){
    	console.log("채팅방을 나갑니다.")
   	    webSocket.close();
    	location.href="/chat/list";
    }
   	
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
// 	    location.href="/chat/list"
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

function msgTypeAjax(msgType, writer_no, chatting_no){
	//회원목록 AJAX
	$.ajax({
		type : "get"
		, url : "/chat/room/userlist"
		, async : false
		, data : {
			chatting_no : chatting_no
			, user_no : writer_no
			, msgType : msgType
		}
		, dataType : "html"
		, success : function(res){
			console.log("ajax성공")
			$("#userListArea").empty();
			$("#userListArea").append(res);
			//$("#roomTitleContent").empty();
			$("#roomTitleContent").children().empty();
			$("#roomTitleContent").children().html("(${chatUserList.size()})");
			
			//$("#roomTitleContent")
			
		}
		, error : function(){
			console.log("실패")
		}
	})
	
	$.ajax({
		type : "get"
		, url : "/chat/room/usercount"
		, async : false
		, data : {
			chatting_no : chatting_no
			, user_no : writer_no
			, msgType : msgType
		}
		, dataType : "json"
		, success : function(res){
			var count = res.result;
			console.log("ajax성공")
			console.log(res);
			//$("#roomTitleContent").empty();
			$("#roomTitleContent").children().empty();
			$("#roomTitleContent").children().html("("+count+")");
		}
		, error : function(){
			console.log("실패")
		}
	})
	
	
	
}
</script>

</head>
<body>
<div id="titleArea">
	<img id="goChatList" src="/resources/img/previous.png" style="width : 42px; height : 39px;"
		onclick="goChatList();">
	<div id="roomTitle">
		<c:choose>
			<c:when test="${roomInfo.CHATTING_NAME eq null }">
				<c:choose>
					<c:when test="${chatUserList.size() eq 2 }">
						<c:forEach items="${chatUserList }" var="list">
							<c:if test="${list.USER_NO ne user_no}">
								<span id="roomTitleContent">${list.USER_NICK }님과 대화</span>
							</c:if>
						</c:forEach>
					</c:when>
					<c:when test="${chatUserList.size() gt 2 }">
						<span id="roomTitleContent" >이름없는 대화방
							<span id="userCount">(${chatUserList.size() })</span>
						</span> 
					</c:when>
				</c:choose>
			</c:when>
			<c:otherwise>
					<span id="roomTitleContent" >${roomInfo.CHATTING_NAME }
						<span id="userCount">(${chatUserList.size() })</span>
					</span> 
			</c:otherwise>
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
			<button disabled = "true" type="button" id="sendBtn" onclick="send();">전송</button>
		</div>
	</div>
	<div id="etcArea">
		<div id="chatUserListHeadArea">
			<span id="chatUserListHead">유저목록</span>
		</div>
		<div id="userListArea">
			<c:import url="/WEB-INF/views/chat/room_user_list.jsp"/>
		</div>
		<br>
		<button id="exitBtn" onclick="exitRoom()">나가기 </button>
	</div>
</div>

</body>
</html>