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

	/**
	 * 모집게시판의 글쓰기를 눌렀을 경우 글을 DB에 등록해주고 게시판 목록으로 Redirect해준다.
	 *	 
	 * @param param -- 모집 게시판에서 글을 쓸 때 각각의 form 데이터를 저장한 DTO이다.
	 * @param meet_time_date -- 모임날짜를 String타입으로 받는다
	 * @param meet_time_clock -- 모이는 시각을 String타입으로 받는다
	 * @param meet_time_min -- 보이는 분을 String타입으로 받는다
	 * @param meet_time_area  -- 오후인지 오전인지를 String타입으로 받는다.
	 * @param session -- 세션의 user_no를 받기 위해 사용한다.
	 * @param ext01 -- 저장한 첫번째 파일의 확장자를 받는다
	 * @param ext02 -- 저장한 두번째 파일의 확장자를 받는다.
	 * @param ext03 -- 저장한 세번째 파일의 확장자를 받는다.
	 * @return
	 */
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
	
	/**
	 * 모집게시판의 목록을 불러온다.
	 * 
	 * @param model
	 * @param curPage -- 쿼리스트링으로 전달받은 현재 페이지 값
	 * @param searchParam -- 쿼리스트링으로 전달받은 게시판 내 검색 관련 값 (지역, 검색 카테고리(제목,작성자,내용), 검색 키워드)의 DTO 
	 */
	@RequestMapping(value = "/recruitboard/list")
	public void recruitBoardList(
			Model model
			,String curPage
			,SearchParam searchParam 
			) {
		
		//현재 페이지 정보와 검색정보를 넘겨 페이징을 받아온다.
		Paging paging = recruitBoardService.getPaging(curPage, searchParam);
		model.addAttribute("paging", paging);
		
		//받아온페이징과, 게시판 분류번호, 검색내용을 이용해 게시판의 목록을 불러온다 
		int board_no = 3;
		List<HashMap<String,String>> list = recruitBoardService.list(paging, searchParam, board_no);
		
		//페이지에서 필요한 정보들을 저장하여 넘겨준다
		model.addAttribute("list",list);
		model.addAttribute("searchParam",searchParam);
		
	}
	
	/**
	 * 게시판 목록을 통해 접근이 가능하며, 게시글을 보여준다
	 * 
	 * @param model 
	 * @param board_no -- 게시글 분류번호
	 * @param article_no -- 게시글 번호
	 * @param session -- sesssion에 저장된 user_no 확인용 (내가 게시글을 추천했는지를 알기 위해 필요)
	 * @param searchParam -- 검색 정보들
	 * @param curPage -- 현제 페이지 (목록으로 돌아가기를 클릭 시 필요)
	 */
	@RequestMapping(value = "/recruitboard/view")
	public void recruitBoardView(
			Model model
			,int board_no
			,int article_no
			,HttpSession session
			,SearchParam searchParam
			,String curPage
			) {
		
		//목록으로 돌아가는 버튼을위해 paging을 받아온다.
		Paging paging = recruitBoardService.getPaging(curPage, searchParam);
		model.addAttribute("paging", paging);
		
		//게시글을 볼 때 필요한 정보들을 가져온다.
		HashMap<String,Object> result = recruitBoardService.getBoardView(board_no, article_no, searchParam, session);
		
		model.addAttribute("result", result);
		model.addAttribute("searchParam",searchParam);
		
	}
	
	
	/**
	 * 게시글을 수정하는 form을 띄운다.
	 * 
	 * @param board_no -- 게시판 분류번호
	 * @param article_no -- 게시글 번호
	 * @param user_nick -- 글쓴이의 닉네임
	 * @param session -- 글쓴이와 현재 접속자가 맞는지 서버단에서 한번 더 검증하기 위해 필요
	 * @param model
	 * @return
	 */
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
	
	
	/**
	 * 수정을 완료했을 경우 글을 DB에서 수정해준다..
	 *	 
	 * @param param -- 모집 게시판에서 글을 쓸 때 각각의 form 데이터를 저장한 DTO이다.
	 * @param meet_time_date -- 모임날짜를 String타입으로 받는다
	 * @param meet_time_clock -- 모이는 시각을 String타입으로 받는다
	 * @param meet_time_min -- 보이는 분을 String타입으로 받는다
	 * @param meet_time_area  -- 오후인지 오전인지를 String타입으로 받는다.
	 * @param session -- 세션의 user_no를 받기 위해 사용한다.
	 * @param ext01 -- 저장한 첫번째 파일의 확장자를 받는다
	 * @param ext02 -- 저장한 두번째 파일의 확장자를 받는다.
	 * @param ext03 -- 저장한 세번째 파일의 확장자를 받는다.
	 * @return
	 */
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
	
	
	/**
	 * 게시글을 삭제한다.
	 * 
	 * @param board_no -- 게시판 분류번호
	 * @param article_no -- 게시글 번호
	 * @param user_nick -- 글쓴이의 닉네임
	 * @param session -- 글쓴이와 현재 접속자가 맞는지 서버단에서 한번 더 검증하기 위해 필요
	 * @param model
	 * @return
	 */
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
	
	/**
	 * 게시글을 추천하거나, 추천을 취소한다.
	 * 
	 * @param session -- 세션의 user_no를 불러와 추천을 했는지 안했는지 검증하기 위해 필요
	 * @param article_no -- 게시글번호
	 * @param board_no -- 게시판 분류번호
	 * @param model
	 * @return
	 */
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

		//service에서 추천을 할지 취소를 할지 판단하고, 총 추천수를 반환한다.
		HashMap<String, Object> result = recruitBoardService.recommend(param);
		model.addAttribute("result", result);
	
		return result;
		
	}
	
	/**
	 * 
	 * 
	 * @param board_no
	 * @param article_no
	 * @param curPage
	 * @param searchParam
	 * @param model
	 * @return
	 */
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
