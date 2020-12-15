package meeteat.controller.chat;

import java.util.HashMap;
import java.util.List;
import java.util.UUID;

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
	
	//value를 /create/indvd로 수정하여 개인 채팅구현
	//또는 필수값이 아니라는 의미로 사용해서 그룹방에서도 생성하도록 사용
	@RequestMapping(value="/create")
	public String createChat(@RequestParam(value="user_no") int user1, HttpSession session, Model model) {
		logger.info(" > > > 채팅방 개설 < < < ");
		session.getAttribute("user_no");
		int user0 = (int)session.getAttribute("user_no");
		
		//***************************
		//구현 테스트를 위해 user1번호를 임의로 고정
		//완료시 지우면 된다.
		user1 = 5;
		//***************************
		
		logger.info("> > > 접속 유저 번호 : "+user0+" < < <");
		logger.info("> > > 상대 유저 번호 : "+user1+" < < <");
		
		//1. 기존에 1대1 대화방이 있는지 검색 
		List<HashMap<String, Integer>> list = chatService.findChatRoom(user0, user1);
		logger.info("> > > 조회 목록  < < <");
		logger.info(""+list);
		//(방인원이 2명, 내 회원번호, 상대 회원번호가 모두 일치 확인)
		//1-1	있으면 기존의 방으로 연결, 기존 메시지 load
		//1-2	없으면 새로운 방 생성해서 연결
		
		
		int roomNum = 0;
		for(int i=0; i<list.size(); i++) {
			logger.info("> > > "+i+"번째 cnt값: "+list.get(i).get("CNT")+" < < <");
			
			//방 인원이 2명인 채팅방을 조회하고 각 회원번호가 있는 채팅방을 조회한다.
			//이때 방의 수를 카운트 해서 2개이면 해당 유저들이 포함된 1대1 채팅방이다.
			if(Integer.parseInt(String.valueOf(list.get(i).get("CNT"))) == 2) {
				logger.info("> > > CNT의 값이 2인 방의 번호 : "+list.get(i).get("CHATTING_NO")+" < < <");
				roomNum = Integer.parseInt(""+list.get(i).get("CHATTING_NO"));
				logger.info("> > > "+user0+"와 "+user1+"의 채팅방은 "+roomNum+"입니다 < < <");
			} 
		}
		
		if(roomNum != 0) {
			logger.info("> > > "+user0+"와 "+user1+"의 채팅방은 "+roomNum+"입니다. < < <");
			//방번호의 고유 id 가져와서 접속하기
			String chatting_id = chatService.getChatId(roomNum);
			logger.info("> > >chatting id : "+chatting_id+" < < <");
			
			//채팅아이디를 이용해 채팅방 접속
			return "redirect:/chat/room/"+chatting_id;
			
		} else {
			logger.info(user0+"와 "+user1+"의 채팅방은 존재하지 않습니다. < < <");
			//방을 생성해서 user0과 user1의 정보 입력하기
			//난수를 활용한 채팅방 생성
			String chatting_id = UUID.randomUUID().toString().replace("-", "");
			chatService.createChatById(chatting_id);
			int chatting_no = chatService.getChatNumById(chatting_id);
			logger.info(" > > > 생성된 채팅방 번호 : "+chatting_no+" < < <");
			logger.info(" > > > 생성된 채팅방 ID : "+chatting_id+" < < <");
			
			//생성된 채팅방에 유저 삽입하기.
			chatService.insertUserToChatNum(chatting_no, user0);
			chatService.insertUserToChatNum(chatting_no, user1);
			
			//채팅아이디를 이용해 채팅방 접속
			return "redirect:/chat/room/"+chatting_id;
		}
	}
	
	@RequestMapping(value="/room/{chatting_id}")
	public String chatRoom(@PathVariable String chatting_id, HttpSession session, Model model) {
		//채팅목록에서 접속할때 또는 게시판에 접속할때 해당 방의 id를 전달값으로 받아온다.
		logger.info("> > > 채팅방에 접속 완료 < < < ");
		logger.info("> > > 접속한 채팅방의 id : "+chatting_id+" < < <");
		//chatting_id로 채팅방 정보 가져오기
		HashMap<String, Object> roomInfo = chatService.getChatRoomInfoById(chatting_id);
		logger.info("접속한 채팅방의 정보 : "+roomInfo);
		
		//방에 참여하고 있는 회원들
		int chatting_no = Integer.parseInt(""+roomInfo.get("CHATTING_NO"));
		logger.info("채팅방 번호 : "+chatting_no);
		List<HashMap<String,Object>> chatUserList = chatService.getChattingUserList(chatting_no);
		
		logger.info("> > > 채팅 참여자 리스트 < < < ");
		logger.info(""+chatUserList);
		
		//방의 이전 메시지 로드(필요시 구현)
		
		
		//model 객체 등록
		model.addAttribute("roomInfo", roomInfo);
		model.addAttribute("chatUserList", chatUserList);
		return null;
	}
	
	@RequestMapping(value="/list")
	public String chatList(HttpSession session, Model model) {
		logger.info(" > > > chatting list 조회 < < <");
		int user_no = Integer.parseInt(""+session.getAttribute("user_no"));
		logger.info("> > > 현재 접속한 회원 정보 : "+user_no+" < < <");
		
		//회원 번호로 속해있는 채팅방 정보 갖고 오기.
		//List roomNum = chatService.getJoinChatList(user_no);
		
		return null;
	}
}
