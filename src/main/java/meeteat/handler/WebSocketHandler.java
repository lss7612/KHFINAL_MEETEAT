package meeteat.handler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import meeteat.dto.chat.ChatMessage;
import meeteat.service.chat.face.ChatService;

public class WebSocketHandler extends TextWebSocketHandler{
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	//세션을 저장할 리스트 생성
	private List<WebSocketSession> sessionList = new ArrayList<>();
	
	@Autowired ChatService chatService;
	
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("+ + + webSocekt 연결 + + +");
		logger.info(""+session);
		sessionList.add(session);
		logger.info("+ + + sessionList 조회 + + +");
		logger.info(""+sessionList);
		int user_no = getSessionUserNo(session);
		logger.info("세션의 회원 번호 : "+user_no);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("+ + + webSocekt 연결 종료 + + +");
		int user_no = getSessionUserNo(session);
		logger.info("세션의 회원 번호 : "+user_no);
		sessionList.remove(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("+ + + handleTextMessage 접속 + + +");
		logger.info("+ + + webSocekt 메세지 전달 + + +");
		
		//현재 웹소켓에 접속한 세션
		logger.info("접속중인 session : "+session);
		
		//세션에서 유저정보 얻어오기
		int user_no = getSessionUserNo(session);
		logger.info("세션의 회원 번호 : "+user_no);
		
		boolean is_state = false;
		
		//전송된 메세지 조회
		logger.info("message : "+message);
		logger.info("message : "+message.getPayload());
		String msg = message.getPayload();
		logger.info("msg : "+msg);
		
		//전달시각 저장
		Date time = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("a hh:mm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd");
		
		String msgTime = sdf.format(time);
		String msgDate = sdf2.format(time);
		
		//JSON형태로 전달받은 메시지 변환
		ObjectMapper mapper = new ObjectMapper();
		ChatMessage chatMessage = mapper.readValue(message.getPayload(), ChatMessage.class);
		logger.info("msg roomno : "+chatMessage.getChatRoomNo());
		logger.info("msg type : "+chatMessage.getType());
		logger.info("msg type : "+chatMessage.getWriter());
		logger.info("msg msg : "+chatMessage.getMsg());
		String user_nick = chatService.getUserNick(chatMessage.getWriter());
		
		
		//MessageType으로 db값 설정
		is_state = chatDBset(chatMessage);
		
		//웹소켓 Uri와 내가 접속한 Uri가 같을때 msg를 뿌려준다.
		for(WebSocketSession sess : sessionList) {
			//세션에 전달해주기 위핸 객체
			ChatMessage cMsg = new ChatMessage();
			
			if(session.getUri().toString().equals(sess.getUri().toString())) {
				//메시지 타입(chat, enter, leave)보고 메시지 연산
				//enter일경우 채팅방에 처음 접근이면 채팅방에 인원 추가 연산 및 참여 알림 전달
				//leave일경우 채팅방에서 인원 가감 연산 및 나가기 알림 전달
				//chat일경우 메시지 db에 저장 및 전달 연산
				
				logger.info("접속중인 websocket의 uri가 같습니다");
				logger.info("sess    : "+sess.getUri());
				logger.info("session : "+session.getUri());
				
				//session의 id로 본인이 접속한 세션 or 상대방인지 구분한다.
				if(session.getId().equals(sess.getId())) {
					logger.info("> > > 내가 접속한 세션 < < <");
					logger.info("> > > sessionid : "+session.getId()+" < < <");
					
					if(chatMessage.getType().equals("CHAT")) {
						logger.info("> > > 내가 보낸 메시지 < < <");
						String chatMsg = myMsg(chatMessage, msgTime);
						cMsg.setMsg(chatMsg);
						cMsg.setMsgDate(msgDate);
						//TextMessage로 변환
						TextMessage tMsg = new TextMessage(mapper.writeValueAsString(cMsg));
						logger.info(" > > > tMsg : "+tMsg.getPayload());
						sess.sendMessage(tMsg);
						//*****메시지 세션에 뿌리는 방법 끝
						
					} else if(chatMessage.getType().equals("ENTER") && is_state == true) {
						logger.info("> > > 내가 보낸 메시지 < < <");
						logger.info("> > > 상태 : "+is_state+" < < <");
						String enterMsg = enterMsgToMe(user_nick);
						cMsg.setMsg(enterMsg);
						cMsg.setMsgDate(msgDate);
						TextMessage tMsg = new TextMessage(mapper.writeValueAsBytes(cMsg));
						sess.sendMessage(tMsg);
					}
					
				} else {
					logger.info("> > > 대화 상대방의 세션 < < <");
					logger.info("> > > sessionid : "+session.getId()+" < < <");
					
					if (chatMessage.getType().equals("ENTER") && is_state==true) {
						logger.info("> > > 상태 : "+is_state+" < < <");
						logger.info(""+chatMessage.getWriter()+"님이 메시지 전달.");
						logger.info("닉네임 : "+user_nick);
						
						//*****메시지 세션에 뿌리는 방법
						String enterMsg = enterMsgToRoom(user_nick);
						cMsg.setMsg(enterMsg);
						cMsg.setMsgDate(msgDate);
						logger.info(" > > > chatMessage : "+cMsg);
						//TextMessage로 변환
						TextMessage tMsg = new TextMessage(mapper.writeValueAsString(cMsg));
						logger.info(" > > > tMsg : "+tMsg.getPayload());
						sess.sendMessage(tMsg);
						//*****메시지 세션에 뿌리는 방법 끝
					} else if(chatMessage.getType().equals("LEAVE") && is_state==true) {
						logger.info("> > > 상태 : "+is_state+" < < <");
						//*****메시지 세션에 뿌리는 방법
						String leaveMsg = leaveMsgToRoom(user_nick);
						cMsg.setMsg(leaveMsg);
						cMsg.setMsgDate(msgDate);
						logger.info(" > > > chatMessage : "+cMsg);
						//TextMessage로 변환
						TextMessage tMsg = new TextMessage(mapper.writeValueAsString(cMsg));
						logger.info(" > > > tMsg : "+tMsg.getPayload());
						sess.sendMessage(tMsg);
						//*****메시지 세션에 뿌리는 방법 끝
					} else if(chatMessage.getType().equals("CHAT")) {
						//*****메시지 세션에 뿌리는 방법
						String chatMsg = otherMsg(chatMessage, user_nick, msgTime);
						cMsg.setMsg(chatMsg);
						cMsg.setMsgDate(msgDate);
						logger.info(" > > > chatMessage : "+cMsg);
						//TextMessage로 변환
						TextMessage tMsg = new TextMessage(mapper.writeValueAsString(cMsg));
						logger.info(" > > > tMsg : "+tMsg.getPayload());
						sess.sendMessage(tMsg);
						//*****메시지 세션에 뿌리는 방법 끝
					}
					
				}
			} else {
				logger.info("접속중인 websocket의 uri가 다릅니다");
				logger.info("sess    : "+sess.getUri());
				logger.info("session : "+session.getUri());
				logger.info("--------------------------------");
				continue;
			}
		}
	}
	
	public int getSessionUserNo(WebSocketSession session) {
		//세션에서 유저정보 얻어오기
		Map map = session.getAttributes();
		System.out.println(map);
		HttpSession userSession = (HttpSession)map.get("httpSession");
		return Integer.parseInt(""+userSession.getAttribute("user_no"));
	}
	
	public String enterMsgToMe(String user_nick) {
		return "<div class='noticeArea'><span> 채팅방에 입장하셨습니다.</span></div>";
	}
	
	public String enterMsgToRoom(String user_nick) {
		return "<div class='noticeArea'><span>"+user_nick+"님이 채팅방에 입장하셨습니다.</span></div>";
	}
	
	public String leaveMsgToRoom(String user_nick) {
		return "<div class='noticeArea'><span>"+user_nick+"님이 채팅방에서 퇴장하셨습니다.</span></div>";
	}
	
	
	public boolean chatDBset(ChatMessage chatMessage) {
		if(chatMessage.getType().equals("CHAT")) {
			logger.info("message type : "+chatMessage.getType());
			//메시지 db에 저장
			chatService.saveMsg(chatMessage.getChatRoomNo(), chatMessage.getWriter(), chatMessage.getMsg());
			
			return false;
		} else if(chatMessage.getType().equals("ENTER")){
			//채팅방에 회원번호 없으면 db삽입. 
			logger.info("message type : "+chatMessage.getType());
			
			return chatService.findJoinUser(chatMessage.getWriter(), chatMessage.getChatRoomNo());
		} else {
			//leave메세지 도착시 tb_chattinguser2 에서 삭제
			logger.info("message type : "+chatMessage.getType());
			
			return chatService.exitChatRoom(chatMessage.getWriter(), chatMessage.getChatRoomNo());
		}
	}
	
	
	public String myMsg(ChatMessage chatMessage, String msgTime) {
		
		return "<div class=\"toMsg\">"
				+ "<span class=\"toMsgTime\">"+msgTime+"</span>"
				+ "<div class=\"toChatContent toBallon\">"+chatMessage.getMsg()+"</div>"
				+ "</div>";
	}
	
	public String otherMsg(ChatMessage chatMessage, String user_nick, String msgTime) {
		
		return "<div class=\"fromMsg\">"
				+ "<img class=\"profileImg\" src=\"/resources/img/default_profile_img.jpg\">"
				+ "<div class=\"fromMsgInfo\">"
					+ "<strong><span>"+user_nick+"</span></strong>"
				+ "</div>"
				+ "<div class=\"fromChatContent fromBallon\">"+chatMessage.getMsg()+"</div>"
				+ "<span class=\"fromMsgTime\">"+msgTime +"</span>"
				+ "</div>";
	}
}
