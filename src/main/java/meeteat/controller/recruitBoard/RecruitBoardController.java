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
import org.springframework.web.bind.annotation.ResponseBody;

import meeteat.dto.recruitBoard.RecruitBoard;
import meeteat.dto.recruitBoard.SearchParam;
import meeteat.service.recruitBoard.face.ImageService;
import meeteat.service.recruitBoard.face.RecruitBoardService;
import meeteat.util.Paging;

@Controller
public class RecruitBoardController {

	private static final Logger logger = LoggerFactory.getLogger(RecruitBoardController.class);
	@Autowired private RecruitBoardService recruitBoardService;
	@Autowired ImageService imageService;
	
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
			,HttpSession session
			,String ext01
			,String ext02
			,String ext03
			) {

		//전달받은 연월일 시간 하나의 스트링으로 바꿔주고 meet_time으로 넣기
		if(meet_time_area.equals("pm")) {
			int clock_no = Integer.parseInt(meet_time_clock);
			if(clock_no != 12)	clock_no += 12;
			meet_time_clock = "" + clock_no;
		} else if(meet_time_area.equals("am") && meet_time_clock.equals("12")) {
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
		
		recruitBoardService.write(param, session, ext01, ext02, ext03);
		
		return "redirect:/recruitboard/list";
		
	}
	
	@RequestMapping(value = "/recruitboard/list")
	public void recruitBoardList(
			Model model
			,String curPage
			,SearchParam searchParam
			) {
		
		//처음 게시판에 들어오게 되면 Location이 null인데 그때 null을 ""로 바까줌
		//안바꾸면 서비스에서 오류
		if(searchParam.getSearchLocation() == null)
			searchParam.setSearchLocation("");
		
		logger.info(""+ searchParam);
		
		Paging paging = recruitBoardService.getPaging(curPage, searchParam);
		model.addAttribute("paging", paging);
		
		int board_no = 3;
		List<HashMap<String,String>> list = recruitBoardService.list(paging, searchParam, board_no);
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
			,String curPage
			) {
		
		Paging paging = recruitBoardService.getPaging(curPage, searchParam);
		model.addAttribute("paging", paging);
		
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
		
		if(board_no != 6) {//6번 게시판은 작성자가 아니더라도 관리자라면 수정이 가능하다.
			Boolean isWriter = recruitBoardService.isWriter(user_nick, session);
			if(!isWriter) {
				model.addAttribute("errorMsg", "잘못된 접근입니다. 작성자만 수정이 가능합니다");
				return "/common/errorpage";
			}
		}
		
		logger.info("의쌰의쌰 board_no : " + board_no + ", article_no : " + article_no);
		Map<String,Object> result= recruitBoardService.getModifyParam(board_no,article_no,session);
		result.put("ARTICLE_NO", article_no);
		
		model.addAttribute("result", result);
		
		if(board_no == 3) return "/recruitboard/modify";
		if(board_no == 6) return "/eventboard/modify";
		
		return "/";
	}
	
	@RequestMapping(value = "/recruitboard/modify", method = RequestMethod.POST)
	public String recruitBoardModify(
			RecruitBoard param
			,String meet_time_date
			,String meet_time_clock
			,String meet_time_min
			,String meet_time_area
			,HttpSession session
			,String ext01
			,String ext02
			,String ext03
			) {
		
		//전달받은 연월일 시간 하나의 스트링으로 바꿔주고 meet_time으로 넣기
		if(meet_time_area.equals("pm")) {
			int clock_no = Integer.parseInt(meet_time_clock);
			if(clock_no != 12)	clock_no += 12;
			meet_time_clock = "" + clock_no;
		} else if(meet_time_area.equals("am") && meet_time_clock.equals("12")) {
			meet_time_clock = "00"; 
		}
		param.setMeet_time(meet_time_date+meet_time_clock+meet_time_min);
		
		recruitBoardService.modify(param);
		
		
		String board_no = "3";
		String article_no =""+param.getArticle_no();
		
		if(ext01!="" || ext02!="" || ext03!="") {
			imageService.deleteFile(board_no, article_no);
			imageService.saveFile(session, ext01, ext02, ext03, board_no, article_no);
		}
		return "redirect:/recruitboard/view?board_no="+board_no+"&article_no="+article_no;
	}
	
	@RequestMapping(value = "/recruitboard/delete")
	public String recruitBoardDelete(
			int article_no
			, int board_no
			, String user_nick
			, HttpSession session
			, Model model) {
		
		
		if(board_no!=6) { //6번 게시판은 같은 작성자가 아니더라도 관리자라면 수정이 가능하다.
			Boolean isWriter = recruitBoardService.isWriter(user_nick, session);
			if(!isWriter) {
				model.addAttribute("errorMsg", "잘못된 접근입니다. 작성자만 수정이 가능합니다");
				return "/common/errorpage";
			}
		}
		
		recruitBoardService.delete(article_no, board_no);
		
		if(board_no == 3)
			return "redirect:/recruitboard/list";
		if(board_no == 6)
			return "redirect:/eventboard/holding";
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/recruitboard/recommend")
	public @ResponseBody HashMap<String, Object> recommend(
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

		HashMap<String, Object> result = recruitBoardService.recommend(param);
		model.addAttribute("result", result);
		
		logger.info("영차"+result);
		
		
		return result;
		
	}
	
	@RequestMapping(value = "/recruitboard/list_ajax")
	public String recruitBoardVieAjax(
			int board_no
			,int article_no
			,String curPage
			,SearchParam searchParam
			,Model model
			) {
		
		Paging paging = recruitBoardService.getPaging(curPage, searchParam);
		model.addAttribute("paging", paging);
		
		List<HashMap<String,String>> list = recruitBoardService.list(paging, searchParam, board_no);
		model.addAttribute("list",list);
		model.addAttribute("article_no",article_no);
		model.addAttribute("searchParam",searchParam);
		
		
		return "/recruitboard/list_ajax";
	}
	
	
}
