package meeteat.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketHandler extends TextWebSocketHandler{
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("+ + + webSocekt 연결 + + +");
		logger.info(""+session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("+ + + webSocekt 연결 종료 + + +");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	
		logger.info("+ + + webSocekt 메세지 전달 + + +");
		// TODO Auto-generated method stub
		
		//현재 웹소켓에 접속한 세션
		logger.info("접속중인 session : "+session);
		
		//전송된 메세지 조회
		TextMessage msg = new TextMessage(message.getPayload());
		logger.info("msg : "+msg);
		logger.info("msg : "+msg.getPayload());
		
//		//웹소켓 Uri와 내가 접속한 Uri가 같을때 msg를 뿌려준다.
//		for(WebSocketSession sess : sessionList) {
//			if(session.getUri().toString().equals(sess.getUri().toString())) {
//				logger.info("접속중인 websocket의 uri가 같습니다");
//				logger.info("sess    : "+sess.getUri());
//				logger.info("session : "+session.getUri());
//				sess.sendMessage(msg);
//				logger.info("--------------------------------");
//				continue;
//			} else {
//				logger.info("접속중인 websocket의 uri가 다릅니다");
//				logger.info("sess    : "+sess.getUri());
//				logger.info("session : "+session.getUri());
//				logger.info("--------------------------------");
//				continue;
//			}
//		}
	}
}