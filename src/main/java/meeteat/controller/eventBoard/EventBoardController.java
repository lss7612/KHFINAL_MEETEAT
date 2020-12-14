package meeteat.controller.eventBoard;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import meeteat.dto.commentForSSLEE.Comment;
import meeteat.dto.eventBoard.EventBoard;
import meeteat.dto.recruitBoard.SearchParam;
import meeteat.service.commentForSSLEE.face.CommentService;
import meeteat.service.eventBoard.face.EventBoardService;
import meeteat.service.recruitBoard.face.ImageService;
import meeteat.service.recruitBoard.face.RecruitBoardService;
import meeteat.util.Paging;

@Controller
public class EventBoardController {

	private static final Logger logger = LoggerFactory.getLogger(EventBoardController.class);
	@Autowired private EventBoardService eventBoardService;
	@Autowired private RecruitBoardService recruitBoardService;
	@Autowired private CommentService commentService;
	@Autowired private ImageService imageService;
	
	@RequestMapping(value = "/eventboard/manage/write", method = RequestMethod.GET)
	public void eventBoardWrite(

			){
		
	}
	
	@RequestMapping(value = "/eventboard/manage/write", method = RequestMethod.POST)
	public String eventBoardWriteProc(
			EventBoard param
			,HttpSession session
			,String ext01
			,String ext02
			,String ext03
			){
		logger.info("POST");
		logger.info(""+param);
		eventBoardService.write(param, session, ext01, ext02, ext03);
		
		return "redirect:/eventboard/holding";
	}
	
	@RequestMapping(value = "/eventboard/holding")
	public void eventHoldingList(
			Model model
			,String curPage
			,SearchParam searchParam
			) {
		
		Paging paging = eventBoardService.getHoldingPaging(curPage, searchParam);
		model.addAttribute("paging",paging);
		int board_no = 6;
		List<HashMap<String,Object>> list = eventBoardService.getHoldingEventList(paging,board_no, searchParam);
		model.addAttribute("list",list);
		
	}
	
	@RequestMapping(value = "/eventboard/terminated")
	public void eventTerminatedList(
			Model model
			,String curPage
			,SearchParam searchParam
			) {
		
		Paging paging = eventBoardService.getTerminatedPaging(curPage, searchParam);
		model.addAttribute("paging",paging);
		int board_no = 6;
		List<HashMap<String,Object>> list = eventBoardService.getTerminatedEventList(paging,board_no, searchParam);
		model.addAttribute("list",list);
		
	}
	
	@RequestMapping(value = "/eventboard/view")
	public String eventView(
			Model model
			,int board_no
			,int article_no
			,HttpSession session
			,SearchParam searchParam
			,String curPage
			) {
		
		HashMap<String,Object> result = recruitBoardService.getBoardView(board_no, article_no, searchParam, session);
		model.addAttribute("result", result);
		model.addAttribute("searchParam",searchParam);
		
		
		String terminateDate_str = "" + result.get("TERMINATE_DATE");
		String[] terminateDateArray = terminateDate_str.split("-");
		terminateDate_str = terminateDateArray[0]+terminateDateArray[1]+terminateDateArray[2];
		int terminateDate = Integer.parseInt(terminateDate_str);
		
		logger.info("terminateDate : " + terminateDate);
		
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String today_str = sdf.format(now);
		int today = Integer.parseInt(today_str);
		logger.info("today"+ today);
		
		
		Boolean isHolding = terminateDate > today;
		logger.info("Is it holding now? " + isHolding);
		
		if(isHolding) return "/eventboard/holdingview";
		
		return "/eventboard/terminatedview";
		
		
	}
	
	@RequestMapping(value = "/eventboard/comment/write")
	public String EventCommentWrite(Comment comment) {
		
		commentService.write(comment);
		
		String returnURI = "redirect:/eventboard/view?board_no="+comment.getBoard_no()+"&article_no="+comment.getArticle_no();

		return returnURI;
		
	}
	
	@RequestMapping (value = "/eventboard/manage/modify")
	public String EventBoardModify(
			EventBoard param
			,HttpSession session
			,String ext01
			,String ext02
			,String ext03
			) {
		
		String board_no = "" + param.getBoard_no();
		String article_no = "" + param.getArticle_no();
		
		eventBoardService.modify(param);
		
		if(ext01!="") {
			imageService.deleteFile(board_no, article_no);
			imageService.saveFile(session, ext01, ext02, ext03, board_no, article_no);
		}
		return "redirect:/eventboard/view?board_no="+board_no+"&article_no="+article_no;
	}
	
	@RequestMapping(value = "/eventboard/manage/popup")
	public String EventPopupManage() {
		
		
		return null;
	}




}
