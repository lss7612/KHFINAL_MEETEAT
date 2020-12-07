package meeteat.controller.recruitBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import meeteat.dto.recruitBoard.RecruitBoard;
import meeteat.dto.recruitBoard.SearchParam;
import meeteat.service.recruitBoard.face.RecruitBoardService;
import meeteat.util.Paging;

@Controller
public class RecruitBoardController {

	private static final Logger logger = LoggerFactory.getLogger(RecruitBoardController.class);
	@Autowired private RecruitBoardService recruitBoardService;
	
	//글쓰기페이지
	@RequestMapping(value = "/recruitboard/write", method = RequestMethod.GET)
	public void recruitBoardWrite() {}

	@RequestMapping(value = "/recruitboard/write", method = RequestMethod.POST)
	public String recruitBoardWriteProc(
			RecruitBoard param
			,String meet_time_date
			,String meet_time_clock
			,String meet_time_min
			,String meet_time_area
			,Model model
			) {

		//전달받은 연월일 시간 하나의 스트링으로 바꿔주고 meet_time으로 넣기
		if(meet_time_area.equals("pm")) {
			logger.info("오후입니다");
			int clock_no = Integer.parseInt(meet_time_clock);
			if(clock_no != 12)	clock_no += 12;
			meet_time_clock = "" + clock_no;
		} else if(meet_time_area.equals("am") && meet_time_clock.equals("12")) {
			logger.info("오전12시 입니다");
			meet_time_clock = "00"; 
		}
		param.setMeet_time(meet_time_date+meet_time_clock+meet_time_min);
		
		logger.info("+ + + 전달 데이터확인 + + +");
		logger.info("연월일 : "+meet_time_date);
		logger.info("시간대 : "+meet_time_area);
		logger.info("시간 : "+meet_time_clock);
		logger.info("분 : "+meet_time_min);
		logger.info("dto : "+param);
		logger.info("meet_time : "+param.getMeet_time());
		logger.info("+ + + + + + + + + + + + + +");
		
		recruitBoardService.write(param);
		
		model.addAttribute("writeSuccess",true);
		
		return "redirect:/recruitboard/list";
		
	}
	
	@RequestMapping(value = "/recruitboard/list")
	public void recruitBoardList(
			Model model
			,String curPage
			,SearchParam searchParam
			) {
		
		//처음 게시판에 들어오게 되면 Location이 null인데 그때 null을 ""로 바까줌
		if(searchParam.getSearchLocation() == null)
			searchParam.setSearchLocation("");
		
		logger.info(""+ searchParam);
		
		Paging paging = recruitBoardService.getPaging(curPage, searchParam);
		model.addAttribute("paging", paging);
		
		List<HashMap<String,String>> list = recruitBoardService.list(paging, searchParam);
		model.addAttribute("list",list);
		
		model.addAttribute("searchParam",searchParam);
		
	}
	
	@RequestMapping(value = "/recruitboard/view")
	public void recruitBoardView(
			Model model
			,int board_no
			,int article_no
			,HttpSession session
			,SearchParam searchParam
			) {
		
		HashMap<String,Object> result = recruitBoardService.getBoardView(board_no, article_no, searchParam, session);
		
		model.addAttribute("result", result);
		model.addAttribute("searchParam",searchParam);
		
	}
	
	@RequestMapping(value = "/recruitboard/modify", method = RequestMethod.GET)
	public String recruitBoardModify(
			int board_no
			,int article_no
			,String user_nick
			,HttpSession session
			,Model model
			) {
		
		Boolean isWriter = recruitBoardService.isWriter(user_nick, session);
		if(!isWriter) {
			model.addAttribute("errorMsg", "잘못된 접근입니다. 작성자만 수정이 가능합니다");
			return "/common/errorpage";
		}
		
		logger.info("board_no : " + board_no + ", article_no : " + article_no);
		Map<String,Object> result= recruitBoardService.getModifyParam(board_no,article_no);
		result.put("ARTICLE_NO", article_no);
		
		model.addAttribute("result", result);
		
		return null;
		
	}
	
	@RequestMapping(value = "/recruitboard/modify", method = RequestMethod.POST)
	public String recruitBoardModify(
			RecruitBoard param
			,String meet_time_date
			,String meet_time_clock
			,String meet_time_min
			,String meet_time_area
			,HttpSession session
			,Model model
			) {
		
		//전달받은 연월일 시간 하나의 스트링으로 바꿔주고 meet_time으로 넣기
		if(meet_time_area.equals("pm")) {
			logger.info("오후입니다");
			int clock_no = Integer.parseInt(meet_time_clock);
			if(clock_no != 12)	clock_no += 12;
			meet_time_clock = "" + clock_no;
		} else if(meet_time_area.equals("am") && meet_time_clock.equals("12")) {
			logger.info("오전12시 입니다");
			meet_time_clock = "00"; 
		}
		param.setMeet_time(meet_time_date+meet_time_clock+meet_time_min);
		
		logger.info("+ + + 전달 데이터확인 + + +");
		logger.info("연월일 : "+meet_time_date);
		logger.info("시간대 : "+meet_time_area);
		logger.info("시간 : "+meet_time_clock);
		logger.info("분 : "+meet_time_min);
		logger.info("dto : "+param);
		logger.info("meet_time : "+param.getMeet_time());
		logger.info("article_no : "+param.getArticle_no());
		logger.info("+ + + + + + + + + + + + + +");
		
		recruitBoardService.modify(param);
		
		return "redirect:/recruitboard/view?board_no="+3+"&article_no="+param.getArticle_no();
	}
	
	@RequestMapping(value = "/recruitboard/delete")
	public String recruitBoardDelete(
			int article_no
			, int board_no
			, String user_nick
			, HttpSession session
			, Model model) {
		
		Boolean isWriter = recruitBoardService.isWriter(user_nick, session);
		if(!isWriter) {
			model.addAttribute("errorMsg", "잘못된 접근입니다. 작성자만 수정이 가능합니다");
			return "/common/errorpage";
		}
		
		recruitBoardService.delete(article_no, board_no);
		
		return "redirect:/recruitboard/list";
	}
	
	@RequestMapping(value = "/recruitboard/recommend")
	public String recommend(
			HttpSession session
			,int article_no
			,int board_no
			,Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		logger.info("영차"+article_no);
		logger.info("영차"+board_no);
		
		param.put("article_no", article_no);
		param.put("board_no", board_no);
		param.put("user_no", session.getAttribute("user_no"));

		int result = recruitBoardService.recommend(param);
		model.addAttribute("result", result);
		
		logger.info("영차"+result);
		
		
		return "/recruitboard/recommend_ajax";
		
	}
	
	
}
