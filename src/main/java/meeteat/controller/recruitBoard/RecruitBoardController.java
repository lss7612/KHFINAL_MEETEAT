package meeteat.controller.recruitBoard;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import meeteat.dto.recruitBoard.RecruitBoard;

@Controller
public class RecruitBoardController {

	private static final Logger logger = LoggerFactory.getLogger(RecruitBoardController.class);
	
	@RequestMapping(value = "/recruitboard/write", method = RequestMethod.GET)
	public void recruitBoardWrite() {}

	@RequestMapping(value = "/recruitboard/write", method = RequestMethod.POST)
	public String recruitBoardWriteProc(RecruitBoard param) {
		
		logger.info(""+param);
		
		return "/forTest/makeSession";
	}
	
}
