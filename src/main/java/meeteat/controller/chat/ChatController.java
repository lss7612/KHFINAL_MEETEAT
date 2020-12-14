package meeteat.controller.chat;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import meeteat.dto.chat.Chatting;
import meeteat.service.chat.face.ChatService;

@Controller
@RequestMapping(value="/chat")
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	@Autowired ChatService chatService;
	
	@RequestMapping(value="/create")
	public String createChat(@RequestParam(value="user_no") int user1, HttpSession session, Model model) {
		session.getAttribute("user_no");
		int user0 = (int)session.getAttribute("user_no");
		user1 = 3;
		logger.info("접속 유저 번호 : "+user0);
		logger.info("상대 유저 번호 : "+user1);
		
		//1. 기존에 1대1 대화방이 있는지 검색 
		List<HashMap<String, Integer>> list = chatService.findChatRoom(user0, user1);
		logger.info("조회 목록 : "+list);
		//(방인원이 2명, 내 회원번호, 상대 회원번호가 모두 일치 확인)
		//1-1	있으면 기존의 방으로 연결, 기존 메시지 load
		//1-2	없으면 새로운 방 생성해서 연결
		int roomNum = 0;
		for(int i=0; i<list.size(); i++) {
			logger.info(i+"번째 : "+list.get(i));
			logger.info(i+"번째 cnt값: "+list.get(i).get("CNT"));
			if(Integer.parseInt(String.valueOf(list.get(i).get("CNT"))) == 2) {
				logger.info("CNT의 값이 2인 방의 번호 : "+list.get(i).get("CHATTING_NO"));
				roomNum = Integer.parseInt(""+list.get(i).get("CHATTING_NO"));
				logger.info(user0+"와 "+user1+"의 채팅방은 "+roomNum+"입니다.");
			}
		}
		if(roomNum != 0) {
			logger.info(user0+"와 "+user1+"의 채팅방은 "+roomNum+"입니다.");
			//방번호의 고유 id 가져와서 접속하기
		} else {
			logger.info(user0+"와 "+user1+"의 채팅방은 존재하지 않습니다.");
			//방을 생성해서 user0과 user1의 정보 입력하기
		}
		return "";
//		return "redirect:/chat/room";
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
