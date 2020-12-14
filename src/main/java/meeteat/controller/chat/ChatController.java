package meeteat.controller.chat;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import meeteat.service.chat.face.ChatService;

@Controller
@RequestMapping(value="/chat")
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	@Autowired ChatService chatService;
	
	@RequestMapping(value="/create")
	public String createChat(@RequestParam(value="user_no") int user1, HttpSession session, Model model) {
		session.getAttribute("user_no");
		logger.info("대화 상대 : "+user1);
		logger.info("대화 상대 : "+session.getAttribute("user_no"));
		
		//1. 기존에 1대1 대화방이 있는지 검색 
		//(방인원이 2명, 내 회원번호, 상대 회원번호가 모두 일치 확인)
		//1-1	있으면 기존의 방으로 연결, 기존 메시지 load
		//1-2	없으면 새로운 방 생성해서 연결
		
		
		
		return "redirect:/chat/room";
	}
	
	@RequestMapping(value="/room/{roomId}")
	public String chatRoom(@PathVariable String roomId, HttpSession session, Model model) {
		//채팅목록에서 접속할때 또는 게시판에 접속할때 해당 방의 id를 전달값으로 받아온다.
		
		//방의 이전 메시지 로드
		
		//방의 접속된 회원들 로드
		
		//
		
		return null;
	}
	
}
