package meeteat.controller.chat;

import java.io.IOException;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		//구현 테스트를 위해 user1(대화 상대)번호를 임의로 고정
		//완료시 지우면 된다.
		//user1 = 12;
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
			model.addAttribute("chatting_id", chatting_id);
			
			//채팅아이디를 이용해 채팅방 접속
			return "/chat/tmp";
			
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
			
			model.addAttribute("chatting_id", chatting_id);
			//채팅아이디를 이용해 채팅방 접속
			return "/chat/tmp";
		}
	}
	
	@RequestMapping(value="/room", method = RequestMethod.POST)
	public String chatRoom(String chatting_id, HttpSession session, Model model) {
		//채팅목록에서 접속할때 또는 게시판에 접속할때 해당 방의 id를 전달값으로 받아온다.
		logger.info("> > > 채팅방에 접속 완료 < < < ");
		logger.info("> > > 접속한 채팅방의 id : "+chatting_id+" < < <");
		//세션에서 회원정보 갖고오기
		int user_no = Integer.parseInt(""+session.getAttribute("user_no"));
		
				
		//chatting_id로 채팅방 정보 가져오기
		HashMap<String, Object> roomInfo = chatService.getChatRoomInfoById(chatting_id);
		logger.info("> > >접속한 채팅방의 정보 : "+roomInfo+" < < <");
		
		//방에 참여하고 있는 회원들
		int chatting_no = Integer.parseInt(""+roomInfo.get("CHATTING_NO"));
		logger.info("> > >채팅방 번호 : "+chatting_no+" < < <");
		List<HashMap<String,Object>> chatUserList = chatService.getChattingUserList(chatting_no);
		
		logger.info("> > > 채팅 참여자 리스트 < < < ");
		logger.info(""+chatUserList);
		
		//방의 이전 메시지 로드
		//	1. 입장 시점 구하기
		HashMap enterMsg = chatService.getEnterMsgNo(user_no, chatting_no);
		HashMap leaveMsg = chatService.getLeaveMsgNo(user_no, chatting_no);
		if(enterMsg == null || 
				(leaveMsg != null && Integer.parseInt(""+enterMsg.get("MSG_NO"))<Integer.parseInt(""+leaveMsg.get("MSG_NO")))
				) {
			logger.info("> > > 방에 처음 들어왔습니다. < < <");
			logger.info("> > > eterMsdg : "+enterMsg+"<<<");
			logger.info("> > > eterMsdg : "+leaveMsg+"<<<");
			
			model.addAttribute("roomInfo", roomInfo);
			model.addAttribute("chatUserList", chatUserList);
			return "chat/room";
		} else {
			logger.info("> > >마지막 입장 메시지 번호 : "+enterMsg.get("MSG_NO")+"< < <");
			
			int enterMsgNum = Integer.parseInt(""+enterMsg.get("MSG_NO"));
			
			List<HashMap<String,Object>> oldChat;
			oldChat = chatService.getOldChatList(chatting_no, enterMsgNum);
			logger.info(" > > > 과거 메시지 < < <");
			logger.info(""+oldChat);
			
			if(oldChat.size() != 0) {
				logger.info("> > > 기존 대화가 존재합니다. < < <");
				//채팅방의 마지막 메시지 전달 날자 저장하기
				Date lastMsgDate = new Date();
				String lmd = null;
				lmd = getLastMsgDate(oldChat, lastMsgDate);
				
				System.out.println("마지막 메세지 전달 날자 : "+lmd);
				
				
				//전달시각 저장
				Date time = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("a hh:mm");
				List<String> trimOldChat = oldChatTrim(oldChat, user_no, sdf);
				
				//model 객체 등록
				model.addAttribute("roomInfo", roomInfo);
				model.addAttribute("chatUserList", chatUserList);
				model.addAttribute("lastMsgDate", lmd);
				model.addAttribute("oldChat", trimOldChat);
				
			} else {
				logger.info("> > > 이전 대화가 없습니다. < < <");
				model.addAttribute("roomInfo", roomInfo);
				model.addAttribute("chatUserList", chatUserList);
			}
			
			return "chat/room";
		}
		
	}
	

	@RequestMapping(value="/list")
	public String chatList(HttpSession session, Model model) {
		logger.info(" > > > chatting list 조회 < < <");
		int user_no = Integer.parseInt(""+session.getAttribute("user_no"));
		logger.info("> > > 현재 접속한 회원 정보 : "+user_no+" < < <");
		
		//회원 번호로 속해있는 채팅방 정보 갖고 오기.
		List<HashMap<String,Object>> roomNum = chatService.getJoinChatList(user_no);
		logger.info("> > > roomNum < < <");
		logger.info(""+roomNum);
	
		
		//접속한 회원이 속한 채팅방의 가장 최신 대화만 갖고오기.
		List<HashMap<String, Object>> chatList = new ArrayList<HashMap<String, Object>>();
		getChatNewest(user_no, roomNum, chatList);
		
		logger.info("> > > 참여 채팅방 최신 대화 목록 < < < ");
		logger.info(""+chatList);
		
		//메시지를 최신순으로 정렬하기
		logger.info("> > > 정렬 전 < < < ");
		for(int i=0; i<chatList.size();i++) {
			logger.info(chatList.get(i).get("CHATTING_NO")+"번방 "+chatList.get(i).get("MSG_DATE") );
			//String date = chatList.get(i);
		}
		
		logger.info("> > > 정렬 중 < < < ");
		DateSort(chatList);		
		
		logger.info("> > > 정렬 후 < < < ");
		for(int i=0; i<chatList.size();i++) {
			logger.info(chatList.get(i).get("CHATTING_NO")+"번방 "+chatList.get(i).get("MSG_DATE") );
		}
		
		//전달값 저장하기
		logger.info("> > > chatList < < <");
		logger.info(""+chatList);
		logger.info("> > > roomNum < < < ");
		logger.info(""+roomNum);
		model.addAttribute("chatList", chatList);
		model.addAttribute("roomUserInfo", roomNum);
		
		return "/chat/list";
	}
	
	@RequestMapping(value="/room/userlist")
	public String roomUserList(int user_no, int chatting_no, String msgType, Model model) {
		logger.info("> > > AJAX 요청 < < <");
		logger.info("> > > msgType : "+msgType+" < < <");
		
		List<HashMap<String, Object>> userList = chatService.getChattingUserList(chatting_no);
		model.addAttribute("chatUserList", userList);
		
		return "/chat/room_user_list";
	}
	
	@RequestMapping(value="/room/usercount")
	public void roomUserCount(int user_no, int chatting_no, Writer out) {
		logger.info("> > > AJAX 요청 < < <");
		List<HashMap<String, Object>> userList = chatService.getChattingUserList(chatting_no);
		
		int count = userList.size();
		logger.info("> > > 채팅방 참여 유저 수 : "+count+"< < <");
		
		try {
			out.write("{\"result\":"+count+"}");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void getChatNewest(int user_no, List<HashMap<String,Object>> roomNum, List<HashMap<String, Object>> chatList) {
		int chatting_no = 0;
		HashMap<String, Object> content = null;
		for(int i=0; i<roomNum.size(); i++) {
			if(chatting_no == Integer.parseInt(""+roomNum.get(i).get("CHATTING_NO")) ) {
				continue;
			} else {
				logger.info(""+roomNum.get(i));
				chatting_no = Integer.parseInt(""+(roomNum.get(i).get("CHATTING_NO")) );
				
				//입장메시지 번호 구하기
				HashMap enterMsg = chatService.getEnterMsgNo(user_no, chatting_no);
				int msg_no = Integer.parseInt(""+enterMsg.get("MSG_NO"));
				content = chatService.getChatContentNewestAtRoom(msg_no, chatting_no);
				logger.info("> > > content < < <");
				logger.info(""+content);
				if(content == null) {
					content = chatService.getChatContentNewestAtRoomAtNoMsg(msg_no, chatting_no);
				}
			}
			if(content != null ) {
				chatList.add(content);
			}
		}
		
	}

	public void DateSort(List<HashMap<String, Object>> chatList) {
		Collections.sort(chatList, new Comparator<HashMap<String,Object>>(){
			@Override
			public int compare(HashMap<String, Object> o1, HashMap<String, Object> o2) {
				return -1*String.valueOf(o1.get("MSG_DATE")).compareTo(String.valueOf(o2.get("MSG_DATE")));
			}
		});
	}
	
	private List<String> oldChatTrim(List<HashMap<String, Object>> oldChat, int user_no, SimpleDateFormat sdf) {
		if(oldChat == null) {
			return null;
		}
		
		List<String> trim = new ArrayList<>();
		String msgTime = null;
		Date time = null;
		
		//날짜 변경 안내를 위한 초기값 설정
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd");
		time =(Date)oldChat.get(0).get("MSG_DATE");
		String standard = sdf2.format(time);
		
		
		
		for(int i=0; i<oldChat.size();i++) {
			time = (Date)oldChat.get(i).get("MSG_DATE");
			//<, >을 html에서 표시할수 있도록 변경
			String control = ( (String)oldChat.get(i).get("MSG_CONTENT")).replaceAll("<", "&lt;");
			String control2 = control.replaceAll(">", "&gt;");
			oldChat.get(i).put("MSG_CONTENT", control2);
			
			//기준 날짜와 현재 반복의 날자가 같으면 날자 변경을 추가해준다.
			if( !standard.equals(sdf2.format(time)) || i == 0) {
				trim.add("<div class='noticeArea'><span>"+sdf2.format(time).substring(0,4)+"년 "+sdf2.format(time).substring(5,7)+"월 "+sdf2.format(time).substring(8,10)+"일 </span></div>");
				standard = sdf2.format(time);
			}
			
			msgTime = sdf.format(time);
			if(Integer.parseInt(""+oldChat.get(i).get("USER_NO")) == user_no) {
				//내가 보낸 메시지 처리
				if(oldChat.get(i).get("MSG_TYPE").equals("ENTER")) {
					trim.add("<div class='noticeArea'><span> 채팅방에 입장하셨습니다.</span></div>");
					
				} else if(oldChat.get(i).get("MSG_TYPE").equals("CHAT")){
					trim.add("<div class=\"toMsg\">"
							+ "<span class=\"toMsgTime\">"+msgTime+"</span>"
							+ "<div class=\"toChatContent toBallon\">"+oldChat.get(i).get("MSG_CONTENT")+"</div>"
							+ "</div>");
				} else {
					continue;
				}
			} else {
				//남이 보낸 메시지 처리
				if(oldChat.get(i).get("MSG_TYPE").equals("ENTER")) {
					trim.add("<div class='noticeArea'><span>"+oldChat.get(i).get("USER_NICK")+"님이 채팅방에 입장하셨습니다.</span></div>");
				} else if(oldChat.get(i).get("MSG_TYPE").equals("CHAT")){
					//프로필 사진이 없을 때
					if(oldChat.get(i).get("USER_PROFILEORIGIN") == null && oldChat.get(i).get("USER_PROFILESTORED") == null){
						trim.add("<div class=\"fromMsg\">"
								+ "<img class=\"profileImg\" src=\"/resources/img/기본이미지.jpg\">"
								+ "<div class=\"fromMsgInfo\">"
								+ "<strong><span>"+oldChat.get(i).get("USER_NICK")+"</span></strong>"
								+ "</div>"
								+ "<div class=\"fromChatContent fromBallon\">"+oldChat.get(i).get("MSG_CONTENT")+"</div>"
								+ "<span class=\"fromMsgTime\">"+msgTime+"</span>"
								+ "</div>");
						
					} else {
						//프로필 사진이 있을 때
						String fileName = ""+oldChat.get(i).get("USER_PROFILESTORED");
						trim.add("<div class=\"fromMsg\">"
								+ "<img class=\"profileImg\" src=\"/resources/upload/"+fileName+"\">"
								+ "<div class=\"fromMsgInfo\">"
								+ "<strong><span>"+oldChat.get(i).get("USER_NICK")+"</span></strong>"
								+ "</div>"
								+ "<div class=\"fromChatContent fromBallon\">"+oldChat.get(i).get("MSG_CONTENT")+"</div>"
								+ "<span class=\"fromMsgTime\">"+msgTime+"</span>"
								+ "</div>");
					}
				} else {
					trim.add("<div class='noticeArea'><span>"+oldChat.get(i).get("USER_NICK")+"님이 채팅방에서 퇴장하셨습니다.</span></div>");
				}
			}
		}
		return trim;
	}
	
	//채팅방의 마지막 메세지 날짜 갖고오기
	private String getLastMsgDate(List<HashMap<String, Object>> oldChat, Date lastMsgDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		for(int i=oldChat.size()-1; i < oldChat.size();i++ ) {
			lastMsgDate = (Date) oldChat.get(i).get("MSG_DATE");
			sdf.format(lastMsgDate);
		}
		return sdf.format(lastMsgDate);
	}
}
