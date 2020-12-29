package meeteat.controller.matefind;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import meeteat.service.login.face.LoginService;
import meeteat.service.matefind.face.MateFindService;

@Controller
@RequestMapping(value = "/matefind")
public class MateFindController {
	
	private static final Logger logger = LoggerFactory.getLogger(MateFindController.class);
	
	@Autowired MateFindService mateFindService;
	@Autowired LoginService loginService;

	
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
		
		
//		return "matefind/mateFindFilterList";
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
		
		model.addAttribute("view", viewBoard);
		
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
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String mateFindWriteProcess(MateFindBoard mateFindBoard, HttpSession session) {
		
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
		
		return "redirect:/matefind/list";
		
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
		
		//mate_list 의 크기와
		//Recommend count 숫자 비교하기
		//Recommend한 user_no 을 통해 정보 가져오기
		
//		return "redirect:/matefind/view?article_no=" + mateFindBoard.getArticle_no();
		
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
	
	
	@RequestMapping(value = "/sortajax")
	public String sortAjax(@RequestParam("party_location") String party_location
						, @RequestParam("meet_time") String meet_time
						, @RequestParam("category") String category
						, Paging curPage
						, Model model) {
		
		logger.info(party_location);
		logger.info(meet_time);
		logger.info(category);
		// if "" == isEmpty
		
		if("아침".equals(meet_time)) {
			// 6 ~ 12 BETWEEN 06:00 AND 12:00
			
		} else if("점심".equals(meet_time)) {
			// 12 ~ 18 BETWEEN 12:00 AND 18:00
			
		} else if("저녁".equals(meet_time)) {
			// 18 ~ 24 BETWEEN 18:00 AND 00:00
			
		} else if("새벽".equals(meet_time)) {
			// 24 ~ 6 BETWEEN 00:00 AND 06:00

		}
		
		
//Paging 위한
		Paging paging = mateFindService.getPaging(curPage);
		model.addAttribute("paging", paging);

		HashMap<String, Object> map = new HashMap<>();
		map.put("party_location", party_location);
		map.put("meet_time", meet_time);
		map.put("category", category);
		map.put("startNo", paging.getStartNo());
		map.put("endNo", paging.getEndNo());
		
//		List<MateFindBoard> filterList = mateFindService.filterListPaging(map);
		
		MateFindBoard mateFindBoard = new MateFindBoard();
		
		mateFindBoard.setParty_location(party_location);
		mateFindBoard.setCategory(category);
//meet_time 미설정으로 해놨음!!
		mateFindBoard.setMeet_time("");
		
		
		List<MateFindBoard> filterList = mateFindService.filterList(mateFindBoard);
		
		model.addAttribute("mateFindList", filterList);
		
		return "matefind/matefindList";
		
		
	}
	
	
	@RequestMapping(value = "test")
	public void justTest() {
		
	}
	

}
