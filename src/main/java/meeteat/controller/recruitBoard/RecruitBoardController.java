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
		
		
		//전달받은 파라미터가 오전인지, 오후인지를 확인하여 시간을 24시간 기준으로 바꿔준다.
		if(meet_time_area.equals("pm")) {//오후일 때 
			int clock_no = Integer.parseInt(meet_time_clock);
			if(clock_no != 12)	clock_no += 12;
			meet_time_clock = "" + clock_no;
		} else if(meet_time_area.equals("am") && meet_time_clock.equals("12")) {//오전이고, 시각이 12시로 설정되어있을 때
			meet_time_clock = "00"; 
		}
		
		
		//여러개의 파라미터로 얻은 날짜 시간 분을 합쳐서 하나의 String으로 만든다.
		//하나의 String으로 만든 후 DTO인 param에 넣는다.
		//해당 String은 오라클 DB에서 to_date를 이용하여 DATE타입으로 저장된다.
		param.setMeet_time(meet_time_date+meet_time_clock+meet_time_min);
		
		
		//write메소드를 이용하여 글을 쓴다.
		recruitBoardService.write(param, session, ext01, ext02, ext03);
		
		
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
		
		
		// 세션의 유저와 글쓴이가 같은지 검증
		// board_no가 6일 경우에는 Event board의 요청이므로 해당 요청에서는 검증이 불필요하다
		// Event board는 글쓴이와 같지 않아도 관리자면 수정할 수 있기 때문이다.
		if(board_no != 6) {
			Boolean isWriter = recruitBoardService.isWriter(user_nick, session);
			if(!isWriter) {
				model.addAttribute("errorMsg", "잘못된 접근입니다. 작성자만 수정이 가능합니다");
				return "/common/errorpage";
			}
		}
		
		//수정폼에 원래의 값들을 넣어주기 위해 원래의 값들을 가져온다.
		Map<String,Object> result= recruitBoardService.getModifyParam(board_no,article_no,session);
		result.put("ARTICLE_NO", article_no);
		model.addAttribute("result", result);
		
		//모집 게시판의 요청일 경우
		if(board_no == 3) return "/recruitboard/modify";
		//이벤트 게시판의 요청일 경우
		if(board_no == 6) return "/eventboard/modify";
		
		// 두 게시판의 요청이 아닐 경우에는 이 메소드로 수정하지 않으므로 에러페이지로 넘겨준다.
		model.addAttribute("errorMsg", "잘못된 접근입니다.");
		return "/common/errorpage";
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
		
		
		//전달받은 파라미터가 오전인지, 오후인지를 확인하여 시간을 24시간 기준으로 바꿔준다.
		if(meet_time_area.equals("pm")) {
			int clock_no = Integer.parseInt(meet_time_clock);
			if(clock_no != 12)	clock_no += 12;
			meet_time_clock = "" + clock_no;
		} else if(meet_time_area.equals("am") && meet_time_clock.equals("12")) {
			meet_time_clock = "00"; 
		}
		
		//여러개의 파라미터로 얻은 날짜 시간 분을 합쳐서 하나의 String으로 만든다.
		//하나의 String으로 만든 후 DTO인 param에 넣는다.
		//해당 String은 오라클 DB에서 to_date를 이용하여 DATE타입으로 저장된다.
		param.setMeet_time(meet_time_date+meet_time_clock+meet_time_min);

		
		//글을 수정한다.
		recruitBoardService.modify(param);
		
		
		String board_no = "3";
		String article_no =""+param.getArticle_no();
		
		//수정한 이미지가 있을 경우 원래의 이미지를 지우고 새로운 이미지를 등록한다. 
		if(ext01!="" || ext02!="" || ext03!="") {
			imageService.deleteFile(board_no, article_no);
			imageService.saveFile(session, ext01, ext02, ext03, board_no, article_no);
		}
		
		return "redirect:/recruitboard/view?board_no="+board_no+"&article_no="+article_no;
	}
	
	
	@RequestMapping(value = "/recruitboard/delete")
	public String recruitBoardDelete(
			int board_no
			,int article_no
			, String user_nick
			, HttpSession session
			, Model model) {
		
		// 세션의 유저와 글쓴이가 같은지 검증
		// board_no가 6일 경우에는 Event board의 요청이므로 해당 요청에서는 검증이 불필요하다
		// Event board는 글쓴이와 같지 않아도 관리자면 수정할 수 있기 때문이다.
		if(board_no!=6) { 
			Boolean isWriter = recruitBoardService.isWriter(user_nick, session);
			if(!isWriter) {
				model.addAttribute("errorMsg", "잘못된 접근입니다. 작성자만 수정이 가능합니다");
				return "/common/errorpage";
			}
		}
		
		//게시글을 삭제한다
		recruitBoardService.delete(article_no, board_no);
		
		//모집게시판의 요청일 경우
		if(board_no == 3) return "redirect:/recruitboard/list";
		//이벤트게시판의 요청일 경우
		if(board_no == 6) return "redirect:/eventboard/holding";
		
		return "redirect:/";
	}

	@RequestMapping(value = "/recruitboard/recommend")
	public @ResponseBody HashMap<String, Object> recommend(
			HttpSession session
			,int article_no
			,int board_no
			,Model model
			) {
		

		//추천하기 위해 넘겨줄 parameter를 설정한다
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("article_no", article_no);
		param.put("board_no", board_no);
		param.put("user_no", session.getAttribute("user_no"));

		//service에서 추천을 할지 취소를 할지 판단해서 실행하고, 총 추천수를 반환한다.
		HashMap<String, Object> result = recruitBoardService.recommend(param);
		model.addAttribute("result", result);
	
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
