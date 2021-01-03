package meeteat.controller.matefind;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
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
import org.springframework.web.bind.annotation.ResponseBody;

import meeteat.dto.mateFindBoard.MateFindBoard;
import meeteat.dto.mateFindBoard.Paging;
import meeteat.dto.mateFindBoard.Recommend;
import meeteat.dto.user.User;
import meeteat.service.chat.face.ChatService;
import meeteat.service.login.face.LoginService;
import meeteat.service.matefind.face.MateFindService;

@Controller
@RequestMapping(value = "/matefind")
public class MateFindController {
	
	private static final Logger logger = LoggerFactory.getLogger(MateFindController.class);
	
	@Autowired MateFindService mateFindService;
	@Autowired LoginService loginService;
	@Autowired ChatService chatService;
	
	@RequestMapping(value = "/list")
	public String mateFindList(@RequestParam(value = "party_location", required = false) String party_location
								, @RequestParam(value = "meet_time", required = false) String meet_time
								, @RequestParam(value = "category", required = false) String category
								, Paging curPage
								, Model model) {
		
		
		return "redirect:/matefind/filterlist?curPage=" + curPage.getCurPage() + "&party_location=&category=&meet_time=";
		
	}
	
	@RequestMapping(value = "/filterlist")
	public String filterList(@RequestParam(value = "party_location", required = false) String party_location
							, @RequestParam(value = "meet_time", required = false) String meet_time
							, @RequestParam(value = "category", required = false) String category
							, Paging curPage
							, Model model) {
		
		HashMap<String, Object> pagingMap = new HashMap<>();
		HashMap<String, Object> map = new HashMap<>();
		
		pagingMap.put("party_location", party_location);
		pagingMap.put("meet_time", meet_time);
		pagingMap.put("category", category);
		
		if("아침".equals(meet_time)) {
			// 6 ~ 12 BETWEEN 06:00 AND 12:00
			map.put("startTime", "0600");
			map.put("endTime", "1200");
			pagingMap.put("startTime", "0600");
			pagingMap.put("endTime", "1200");
			
		} else if("점심".equals(meet_time)) {
			// 12 ~ 18 BETWEEN 12:00 AND 18:00
			map.put("startTime", "1200");
			map.put("endTime", "1800");
			pagingMap.put("startTime", "1200");
			pagingMap.put("endTime", "1800");
			
		} else if("저녁".equals(meet_time)) {
			// 18 ~ 24 BETWEEN 18:00 AND 00:00
			map.put("startTime", "1800");
			map.put("endTime", "2359");
			pagingMap.put("startTime", "1800");
			pagingMap.put("endTime", "2359");
			
		} else if("새벽".equals(meet_time)) {
			// 24 ~ 6 BETWEEN 00:00 AND 06:00
			map.put("startTime", "0000");
			map.put("endTime", "0600");
			pagingMap.put("startTime", "0000");
			pagingMap.put("endTime", "0600");
			
		}
		
		Paging paging = mateFindService.getFilterPaging(curPage, pagingMap);
		model.addAttribute("paging", paging);
		
		map.put("party_location", party_location);
		map.put("meet_time", meet_time);
		map.put("category", category);
		map.put("startNo", paging.getStartNo());
		map.put("endNo", paging.getEndNo());
		
		
		List<MateFindBoard> list = mateFindService.filterPagingList(map);
		
		for(int i = 0; i < list.size(); i++) {
			logger.info("##얍## : " + list.get(i).toString());
		}
		
		model.addAttribute("mateFindFilterList", list);
		model.addAttribute("party_location", party_location);
		model.addAttribute("category", category);
		model.addAttribute("meet_time", meet_time);
		
		
		return "matefind/filterlistview";
		
	}
	
	@RequestMapping(value = "/listFilter")
	public String MateFindListFilter(@RequestParam(value = "party_location", required = false) String party_location
								, @RequestParam(value = "meet_time", required = false) String meet_time
								, @RequestParam(value = "category", required = false) String category
								, Paging curPage
								, Model model) {
		
		HashMap<String, Object> pagingMap = new HashMap<>();
		HashMap<String, Object> map = new HashMap<>();
		
		pagingMap.put("party_location", party_location);
		pagingMap.put("meet_time", meet_time);
		pagingMap.put("category", category);
		
		if("아침".equals(meet_time)) {
			// 6 ~ 12 BETWEEN 06:00 AND 12:00
			map.put("startTime", "0600");
			map.put("endTime", "1200");
			pagingMap.put("startTime", "0600");
			pagingMap.put("endTime", "1200");
			
		} else if("점심".equals(meet_time)) {
			// 12 ~ 18 BETWEEN 12:00 AND 18:00
			map.put("startTime", "1200");
			map.put("endTime", "1800");
			pagingMap.put("startTime", "1200");
			pagingMap.put("endTime", "1800");
			
		} else if("저녁".equals(meet_time)) {
			// 18 ~ 24 BETWEEN 18:00 AND 00:00
			map.put("startTime", "1800");
			map.put("endTime", "2359");
			pagingMap.put("startTime", "1800");
			pagingMap.put("endTime", "2359");
			
		} else if("새벽".equals(meet_time)) {
			// 24 ~ 6 BETWEEN 00:00 AND 06:00
			map.put("startTime", "0000");
			map.put("endTime", "0600");
			pagingMap.put("startTime", "0000");
			pagingMap.put("endTime", "0600");
			
		}
		
		Paging paging = mateFindService.getFilterPaging(curPage, pagingMap);
		model.addAttribute("paging", paging);
		
		map.put("party_location", party_location);
		map.put("meet_time", meet_time);
		map.put("category", category);
		map.put("startNo", paging.getStartNo());
		map.put("endNo", paging.getEndNo());
		
		
		List<MateFindBoard> list = mateFindService.filterPagingList(map);
		
		for(int i = 0; i < list.size(); i++) {
			logger.info("##얍## : " + list.get(i).toString());
		}
		
		model.addAttribute("mateFindFilterList", list);
		model.addAttribute("party_location", party_location);
		model.addAttribute("category", category);
		model.addAttribute("meet_time", meet_time);
		
		
		return "matefind/mateFindFilterList";
		
	}
	
	
	@RequestMapping(value = "/view")
	public String mateFindView(MateFindBoard viewBoard, Model model) {
		
		if(viewBoard.getArticle_no() < 1) {
			return "redirect:/matefind/list";
		}
		
		viewBoard = mateFindService.mateFindView(viewBoard);
		viewBoard.setMeet_time(viewBoard.getMeet_time().replace(" ", "T"));
		
		//----------게시글 정보에서 채팅방 번호 구하기----------
		int chatting_no = viewBoard.getChatting_no();
		String chatting_id = chatService.getChatId(chatting_no);
		//--------------------------------------------
		
		model.addAttribute("view", viewBoard);
		model.addAttribute("chatting_id", chatting_id);
		
		String jstlMeetTime = viewBoard.getMeet_time();
		
		jstlMeetTime = jstlMeetTime.replaceAll(" ", "");
		jstlMeetTime = jstlMeetTime.replaceAll("-", "");
		jstlMeetTime = jstlMeetTime.replaceAll("T", "");
		jstlMeetTime = jstlMeetTime.replaceAll(":", "");
		
		logger.info(jstlMeetTime);
		
		model.addAttribute("jstlMeetTime", jstlMeetTime);
		
		viewBoard.setMate_list(viewBoard.getMate_list().replaceAll(" ", ""));
		

		// 글 작성자 정보
		User user = new User();
		user.setUser_no(viewBoard.getUser_no());

		model.addAttribute("hostInfo", loginService.selectUserByUserNo(user));
		
		// 참여자 정보 가져오는 Join 테이블
		List<MateFindBoard> attendUserList = mateFindService.attendUserInfo(viewBoard);
		model.addAttribute("attendUserList", attendUserList);
		
		// 참여자 수 가져오기
		
		int attendeeCount = mateFindService.attendeeCount(viewBoard);
		
		logger.info("참여자 수 : " + attendeeCount);
		
		int attendeeMax = Integer.valueOf(viewBoard.getMate_list());
		
		model.addAttribute("attendeeMax", attendeeMax);
		model.addAttribute("attendeeCount", attendeeCount);
		
		Recommend recommend = new Recommend();
		recommend.setArticle_no(viewBoard.getArticle_no());
		
		// 참여자 리스트 가져오기
		List<Recommend> attendeeList = mateFindService.attendeeList(recommend);
		
		model.addAttribute("attendeeList", attendeeList);
		
		return "matefind/view";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void mateFindUpdate(MateFindBoard mateFindBoard, Model model) {
		
		mateFindBoard = mateFindService.read(mateFindBoard);
		
		mateFindBoard.setMeet_time(mateFindBoard.getMeet_time().replace(" ", "T"));
		
		int attendeeCount = mateFindService.attendeeCount(mateFindBoard);
		
		model.addAttribute("view", mateFindBoard);
		model.addAttribute("attendeeCount", attendeeCount);
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String mateFindUpdateProcess(MateFindBoard mateFindBoard) {
		
		Date revision_date = new Date();
		
		mateFindBoard.setRevision_date(revision_date);
		
		String mateTimeStr = mateFindBoard.getMeet_time();
		mateTimeStr = mateTimeStr.replaceAll("-", "");
		mateTimeStr = mateTimeStr.replaceAll("T", " ");
		mateTimeStr = mateTimeStr.replaceAll(":", "");
		logger.info(mateTimeStr);
		
		mateFindBoard.setMeet_time(mateTimeStr);
		
		mateFindService.update(mateFindBoard);
		
		return "redirect:/matefind/view?article_no=" + mateFindBoard.getArticle_no();
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String mateFindDelete (@RequestParam("article_no") int article_no) {
		
		MateFindBoard mateFindBoard = new MateFindBoard();
		
		mateFindBoard.setArticle_no(article_no);
		
		int num = mateFindBoard.getArticle_no();
		
		logger.info("이거에요 : " + num);
		
		mateFindService.deleteMateFind(mateFindBoard);
		
		return "redirect:/matefind/list";
	}
	

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void mateFindWrite() {
		
	}

//	사진첨부시
/*
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String mateFindWriteProcess(MateFindBoard mateFindBoard
										, @RequestParam("file") MultipartFile fileupload
										, HttpSession session) {
		
		mateFindBoard.setUser_no((int)session.getAttribute("user_no"));
		
		logger.info(mateFindBoard.getCategory());
		logger.info(mateFindBoard.getParty_location());
		logger.info(mateFindBoard.getMeet_time());
		
		String mateTimeStr = mateFindBoard.getMeet_time();
		mateTimeStr = mateTimeStr.replaceAll("-", "");
		mateTimeStr = mateTimeStr.replaceAll("T", " ");
		mateTimeStr = mateTimeStr.replaceAll(":", "");
		logger.info(mateTimeStr);
		
		mateFindBoard.setMeet_time(mateTimeStr);
		
		mateFindService.write(mateFindBoard);
//		mateFindService.writeWithFile(mateFindBoard, fileupload);
		
		return "redirect:/matefind/list";
		
	}
*/
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String mateFindWriteProcess(MateFindBoard mateFindBoard, HttpSession session) {
		
		mateFindBoard.setUser_no((int)session.getAttribute("user_no"));

		logger.info(""+mateFindBoard);
		logger.info(""+mateFindBoard.getArticle_title());
		
		logger.info(mateFindBoard.getCategory());
		logger.info(mateFindBoard.getParty_location());
		logger.info(mateFindBoard.getMeet_time());
		
		
		String mateTimeStr = mateFindBoard.getMeet_time();
		mateTimeStr = mateTimeStr.replaceAll("-", "");
		mateTimeStr = mateTimeStr.replaceAll("T", " ");
		mateTimeStr = mateTimeStr.replaceAll(":", "");
		logger.info(mateTimeStr);
		
		mateFindBoard.setMeet_time(mateTimeStr);
		
		//------------메이트 찾기용 채팅방 개설----------
		//모임 채팅방을 개설하기 위해 필요한 정보
		String chatting_name = mateFindBoard.getArticle_title();
		String chatting_id = UUID.randomUUID().toString().replace("-", "");
		int user_no = mateFindBoard.getUser_no();
		
		chatService.createMateChatRoom(chatting_name, chatting_id);
		HashMap roomInfo = chatService.getChatRoomInfoById(chatting_id);
		int chatting_no = Integer.parseInt(""+roomInfo.get("CHATTING_NO"));
		chatService.insertUserToChatNum(chatting_no, user_no);
		
		
		//tb_board2에 채팅방 삽입
		mateFindBoard.setChatting_no(chatting_no);
		//------------메이트 찾기용 채팅방 개설 끝----------
		
		mateFindService.write(mateFindBoard);
		
		return "redirect:/matefind/list";
		
	}
	
	@RequestMapping(value = "/autowriteview", method = RequestMethod.GET)
	public void autoWriteView() {
		
	}
	
	@RequestMapping(value = "/autoWrite")
	public String autoWrite() {
		
		Random random = new Random();
		
		//17개
		String[] location = {"서울특별시", "부산광역시", "대구광역시", "인천광역시", "광주광역시", "대전광역시", "울산광역시", "세종특별자치시"
				, "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주특별자치도"};
		
		String[] category = {"식사", "술", "카페"};
		
		String[] mate_list = {"1","2","3","4","5","6","7"};
		
		//20개
		String[] title = {"재미나는 모임", "술마실분들 모집해요", "복날엔 역시 닭이지", "맛집 같이 가실분"
				, "둘이서 5인분 드실분", "제목짓기어렵다", "케익에 아아드실분", "곱창 완전 땡기자너", "날씨도 우중충한데 막걸리한잔"
				, "코로나 끝났으면 좋겠다", "커플세트 같이 드실분", "친목도모 하실분", "여기 3인분부터인데 같이가요", "혼자가기 싫어요"
				, "너만오면 고", "일단 클릭해보세요", "카페에서 수다떠실분", "여기 요즘 핫한 술집", "비도오고 그래서"
				, "간 안 보실분만"
		};
		
		int[] userList = {2,6,7,11,12,13,15,16,17,18,20,21,22,23,24,25,27,28,29,30,31,35,36,40,43,46,51,54,55,56,57,59,60,63,64,65
				,66,67,70,73,74,75,77,79,80,81,84,85,87,94,95,96,97,102,105,106,108,110,113,114,115,116,121,124,125,126,128,129,131,134
				,135,136,137,140,142,143,145,147,148,152,155,156,158,160,163,165,167,168,169,170,172,176,179,180,181,183,185,186,187,188
				,189,190,191,193,195,196,197,198,200,202,203,205,206,207,208,210,211,212,213,215,216,219,221,225,226,228,229,230,231,232,234
				,235,236,238,239,241,244,245,246,247,249,251,252,253,255,257,264,265,267,268,274,276,277,278,280,284,285,287,288,289,291,295
				,296,297,300,302,303,304,307,309,310,312,314,316,317};
		
		//새벽 아침 점심 저녁
		String[] meetTime = {"20210105 0240", "20210105 0930", "20210105 1350", "20210105 2020"};
		
		
		for(int i = 0; i < 20; i++) {
			
			MateFindBoard mateFindBoard = new MateFindBoard();
			
			String randomTitle = title[random.nextInt(20)];
			int randomUser = userList[random.nextInt(175)];
			
			mateFindBoard.setArticle_title(randomTitle);
			mateFindBoard.setArticle_content("이웃 말 않은 가을로 멀리 버리었습니다. 내일 마리아 지나가는 노새, 북간도에 옥 계십니다. 다 다하지 벌써 소학교 많은 멀리 덮어 있습니다."
					+ "청춘이 오면 속의 보고, 이름과, 멀리 헤일 까닭이요, 까닭입니다. 애기 아무 아침이 별빛이 벌써 위에도 때 거외다."
					+ "언덕 이 쉬이 밤이 했던 청춘이 봄이 계절이 계십니다. 다 아침이 파란 아직 추억과 릴케 있습니다.");
			mateFindBoard.setParty_location(location[random.nextInt(17)]);
			mateFindBoard.setCategory(category[random.nextInt(3)]);
			mateFindBoard.setMate_list(mate_list[random.nextInt(7)]);
			
			mateFindBoard.setUser_no(randomUser);
			mateFindBoard.setMeet_time(meetTime[random.nextInt(4)]);
			
			//------------메이트 찾기용 채팅방 개설----------
			//모임 채팅방을 개설하기 위해 필요한 정보
			String chatting_name = mateFindBoard.getArticle_title();
			String chatting_id = UUID.randomUUID().toString().replace("-", "");
			int user_no = mateFindBoard.getUser_no();
			
			chatService.createMateChatRoom(chatting_name, chatting_id);
			HashMap roomInfo = chatService.getChatRoomInfoById(chatting_id);
			int chatting_no = Integer.parseInt(""+roomInfo.get("CHATTING_NO"));
			chatService.insertUserToChatNum(chatting_no, user_no);
			
			
			//tb_board2에 채팅방 삽입
			mateFindBoard.setChatting_no(chatting_no);
			//------------메이트 찾기용 채팅방 개설 끝----------
			
			mateFindService.write(mateFindBoard);
			

		}
		
		
		return "redirect:/matefind/filterlist?curPage=0&party_location=&category=&meet_time=";
		
	}
	
	
	
	@RequestMapping(value = "/attend", method = RequestMethod.GET)
	@ResponseBody
	public boolean mateFindAttend(@RequestParam("article_no") int article_no, HttpSession session) {
		
		int guestUserNo = (int)session.getAttribute("user_no");
		
		Recommend recommend = new Recommend();
		
		recommend.setArticle_no(article_no);
		recommend.setBoard_no(2);
		recommend.setUser_no(guestUserNo);

		
		if(mateFindService.hasData(recommend)) {
			
			mateFindService.deleteAttend(recommend);
			return false;
			
		} else {
			
			mateFindService.insertAttend(recommend);
			return true;
			
		}
		
	}
	
	@RequestMapping(value = "/attendeeList")
	public String attendeeList(@RequestParam("article_no") int article_no
							, Model model) {
		
		logger.info("attendeeList 여기왔음");
		
		MateFindBoard viewBoard = new MateFindBoard();
		
		viewBoard.setArticle_no(article_no);
		
		// 참여자 정보 가져오는 Join 테이블
		List<MateFindBoard> attendUserList = mateFindService.attendUserInfo(viewBoard);
		model.addAttribute("attendUserList", attendUserList);
		
		
		// 참여자 수 가져오기
		int attendeeCount = mateFindService.attendeeCount(viewBoard);
		
		logger.info("참여자 수 : " + attendeeCount);
		
		viewBoard = mateFindService.boardSetByArticleNo(viewBoard);
		
		int attendeeMax = Integer.valueOf(viewBoard.getMate_list());
		
		model.addAttribute("attendeeMax", attendeeMax);
		model.addAttribute("attendeeCount", attendeeCount);
		
		return "matefind/attendeeList";
	}
	
	@RequestMapping(value = "test")
	public void justTest() {
		
	}
	

}
