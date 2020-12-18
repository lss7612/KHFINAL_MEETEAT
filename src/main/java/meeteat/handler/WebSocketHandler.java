package meeteat.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
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
		
		//전송된 메세지 조회
		logger.info("message : "+message);
		logger.info("message : "+message.getPayload());
		String msg = message.getPayload();
		logger.info("msg : "+msg);
		
		
		//JSON형태로 전달받은 메시지 변환
		ObjectMapper mapper = new ObjectMapper();
		ChatMessage chatMessage = mapper.readValue(message.getPayload(), ChatMessage.class);
		logger.info("msg roomno : "+chatMessage.getChatRoomNo());
		logger.info("msg type : "+chatMessage.getType());
		logger.info("msg type : "+chatMessage.getWriter());
		logger.info("msg msg : "+chatMessage.getMsg());
		String user_nick = chatService.getUserNick(chatMessage.getWriter());
		
		if(chatMessage.getType().equals("CHAT")) {
			//chatService.saveMsg(chatMessage.getChatRoomNo(), chatMessage.getWriter(), chatMessage.getMsg());
			
		}
		
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
						String chatMsg = user_nick+" : "+chatMessage.getMsg()+"<br>";
						cMsg.setMsg(chatMsg);
						//TextMessage로 변환
						TextMessage tMsg = new TextMessage(mapper.writeValueAsString(cMsg));
						logger.info(" > > > tMsg : "+tMsg.getPayload());
						sess.sendMessage(tMsg);
						//*****메시지 세션에 뿌리는 방법 끝
						
					} else if(chatMessage.getType().equals("ENTER")) {
						logger.info("> > > 내가 보낸 메시지 < < <");
						String enterMsg = enterMsg(user_nick);
						cMsg.setMsg(enterMsg);
						TextMessage tMsg = new TextMessage(mapper.writeValueAsBytes(cMsg));
						sess.sendMessage(tMsg);
					}
					
				} else {
					logger.info("> > > 대화 상대방의 세션 < < <");
					logger.info("> > > sessionid : "+session.getId()+" < < <");
					
					if (chatMessage.getType().equals("ENTER")) {
						logger.info(""+chatMessage.getWriter()+"님이 메시지 전달.");
						logger.info("닉네임 : "+user_nick);
						
						//*****메시지 세션에 뿌리는 방법
						String enterMsg = enterMsg(user_nick);
						cMsg.setMsg(enterMsg);
						logger.info(" > > > chatMessage : "+cMsg);
						//TextMessage로 변환
						TextMessage tMsg = new TextMessage(mapper.writeValueAsString(cMsg));
						logger.info(" > > > tMsg : "+tMsg.getPayload());
						sess.sendMessage(tMsg);
						//*****메시지 세션에 뿌리는 방법 끝
					} else if(chatMessage.getType().equals("LEAVE")) {
						//*****메시지 세션에 뿌리는 방법
						String leaveMsg = leaveMsg(user_nick);
						cMsg.setMsg(leaveMsg);
						logger.info(" > > > chatMessage : "+cMsg);
						//TextMessage로 변환
						TextMessage tMsg = new TextMessage(mapper.writeValueAsString(cMsg));
						logger.info(" > > > tMsg : "+tMsg.getPayload());
						sess.sendMessage(tMsg);
						//*****메시지 세션에 뿌리는 방법 끝
						
					} else {
						logger.info("> > > 상대방이 보낸 메시지 < < <");
						String chatMsg = user_nick+" : "+chatMessage.getMsg()+"<br>";
						cMsg.setMsg(chatMsg);
						//TextMessage로 변환
						TextMessage tMsg = new TextMessage(mapper.writeValueAsString(cMsg));
						logger.info(" > > > tMsg : "+tMsg.getPayload());
						sess.sendMessage(tMsg);
						//*****메시지 세션에 뿌리는 방법 끝
						
					}
					
				}
				
				
				
				
				
//				if(user_no == chatMessage.getWriter()) {
//					logger.info("> > > 내가 보낸 메세지 < < <");
//					//내가 보낸 메세지 처리
//					//	입장과 퇴장은 처리할 필요 없이 보낸 메세지만 처리하면된다.
//					if (chatMessage.getType().equals("CHAT")) {
//						logger.info(""+chatMessage.getWriter()+"님이 메시지 전달.");
//						//chatService.saveMsg(chatMessage.getChatRoomNo(), chatMessage.getWriter(), chatMessage.getMsg());
//						logger.info("message : "+message);
//						
//						logger.info("message : "+message);
//						sess.sendMessage(message);
//					}
//					String user_nick = chatService.getUserNick(chatMessage.getWriter());
//					logger.info("닉네임 : "+user_nick);
//					chatMessage.setMsg(user_nick+"님이 채팅에 참가하였습니다.");
//					String jsonStr1 = mapper.writeValueAsString(msg);
//					String jsonStr2 = mapper.writeValueAsString(chatMessage);
//					logger.info(" > > > Str1 : "+jsonStr1+" < < <");
//					logger.info(" > > > Str2 : "+jsonStr2+" < < <");
//					
//					//*****메시지 세션에 뿌리는 방법
//					String enterMsg = enterMsg(user_nick);
//					chatMessage.setMsg(enterMsg);
//					logger.info(" > > > chatMessage : "+chatMessage);
//					//TextMessage로 변환
//					TextMessage tMsg = new TextMessage(mapper.writeValueAsString(chatMessage));
//					logger.info(" > > > tMsg : "+tMsg);
//					sess.sendMessage(tMsg);
//					//*****메시지 세션에 뿌리는 방법 끝
//					
//				} else {
//					logger.info("> > > 상대방이 보낸 메세지 < < <");
//					//상대가 보낸 메세지 처리
//					if(chatMessage.getType().equals("ENTER")) {
//						logger.info(""+chatMessage.getWriter()+"님이 채팅에 참가.");
//						String user_nick = chatService.getUserNick(chatMessage.getWriter());
//						logger.info("닉네임 : "+user_nick);
//						chatMessage.setMsg(user_nick+"님이 채팅에 참가하였습니다.");
//						String jsonStr1 = mapper.writeValueAsString(msg);
//						String jsonStr2 = mapper.writeValueAsString(chatMessage);
//						
//						//TextMessage로 변환
//						TextMessage tMsg = new TextMessage(mapper.writeValueAsString(chatMessage.getMsg()));
//						
//						logger.info("message : "+message);
////						sess.sendMessage(message);
//						sess.sendMessage(tMsg);
//						
//					} else if (chatMessage.getType().equals("CHAT")){
//						logger.info(""+chatMessage.getWriter()+"님이 메시지 전달.");
//						logger.info("message : "+message);
//						sess.sendMessage(message);
//						
//					} else {
//						logger.info(""+chatMessage.getWriter()+"님이 채팅에서 나감.");
//						
//						logger.info("message : "+message);
//						sess.sendMessage(message);
//						
//					}
//				}
//				
//				//전달 메시지 타입으로 구분
//				logger.info("--------------------------------");
//				continue;
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
	
	public String enterMsg(String user_nick) {
		return "<div class='noticeArea'><span>"+user_nick+"님이 채팅방에 입장하셨습니다.</span></div>";
	}
	
	public String leaveMsg(String user_nick) {
		return "<div class='noticeArea'><span>"+user_nick+"님이 채팅방에서 퇴장하셨습니다.</span></div>";
	}
	
}
