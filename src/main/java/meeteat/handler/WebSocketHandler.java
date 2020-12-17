package meeteat.handler;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
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
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("+ + + webSocekt 연결 종료 + + +");
		sessionList.remove(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("+ + + handleTextMessage 접속 + + +");
		logger.info("+ + + webSocekt 메세지 전달 + + +");
		
		//현재 웹소켓에 접속한 세션
		logger.info("접속중인 session : "+session);
		
		//전송된 메세지 조회
		TextMessage msg = new TextMessage(message.getPayload());
		logger.info("msg : "+msg);
		logger.info("msg : "+msg.getPayload());
		String msgWriter = message.getPayload();
		logger.info("msgWriter : "+msgWriter);
		
		
		//JSON형태로 전달되 메시지 변환
		ObjectMapper mapper = new ObjectMapper();
		ChatMessage chatMessage = mapper.readValue(msgWriter, ChatMessage.class);
		logger.info("msg type : "+chatMessage.getType());
		logger.info("msg roomno : "+chatMessage.getChatRoomNo());
		logger.info("msg msg : "+chatMessage.getMsg());
		
		JSONObject json = new JSONObject();
		//웹소켓 Uri와 내가 접속한 Uri가 같을때 msg를 뿌려준다.
		for(WebSocketSession sess : sessionList) {
			if(session.getUri().toString().equals(sess.getUri().toString())) {
				//메시지 타입(chat, enter, leave)보고 메시지 연산
				//enter일경우 채팅방에 처음 접근이면 채팅방에 인원 추가 연산 및 참여 알림 전달
				//leave일경우 채팅방에서 인원 가감 연산 및 나가기 알림 전달
				//chat일경우 메시지 db에 저장 및 전달 연산
				
				logger.info("접속중인 websocket의 uri가 같습니다");
				logger.info("sess    : "+sess.getUri());
				logger.info("session : "+session.getUri());
				
				if(chatMessage.getType().equals("ENTER")) {
					logger.info(""+chatMessage.getWriter()+"님이 채팅에 참가.");
					String jsonStr = mapper.writeValueAsString(msgWriter);
					logger.info("msg : "+msg);
					sess.sendMessage(msg);
					
				} else if (chatMessage.getType().equals("CHAT")){
					logger.info(""+chatMessage.getWriter()+"님이 메시지 전달.");
					chatService.saveMsg(chatMessage.getChatRoomNo(), chatMessage.getWriter(), chatMessage.getMsg());
					logger.info("msg : "+msg);
					sess.sendMessage(msg);
					
				} else {
					logger.info(""+chatMessage.getWriter()+"님이 채팅에서 나감.");
					
					logger.info("msg : "+msg);
					sess.sendMessage(msg);
					
				}
				logger.info("--------------------------------");
				continue;
			} else {
				logger.info("접속중인 websocket의 uri가 다릅니다");
				logger.info("sess    : "+sess.getUri());
				logger.info("session : "+session.getUri());
				logger.info("--------------------------------");
				continue;
			}
		}
	}
	
	
	
}
