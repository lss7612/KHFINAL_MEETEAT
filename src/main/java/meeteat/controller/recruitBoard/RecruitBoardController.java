package meeteat.controller.recruitBoard;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import meeteat.dto.recruitBoard.RecruitBoard;
import meeteat.dto.recruitBoard.SearchParam;
import meeteat.service.recruitBorad.face.RecruitBoardService;
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
		if(meet_time_area.equals("pm") && meet_time_clock.equals("12")) {
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
		
		Paging paging = recruitBoardService.getPaging(curPage, searchParam);
		model.addAttribute("paging", paging);
		
		List<LinkedHashMap<String,String>> list = recruitBoardService.list(paging, searchParam);
		model.addAttribute("list",list);
		
		model.addAttribute("searchParam",searchParam);
		
	}
	
	@RequestMapping(value = "/recruitboard/view")
	public void recruitBoardView(
			Model model
			,int board_no
			,int article_no) {
		
		HashMap<String,Object> result = recruitBoardService.getBoardView(board_no, article_no);
		
		model.addAttribute("result", result);
		
	}
	
	
}
