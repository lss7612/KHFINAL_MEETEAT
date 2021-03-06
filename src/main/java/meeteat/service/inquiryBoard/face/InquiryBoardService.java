package meeteat.service.inquiryBoard.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import meeteat.dto.inquiryBoard.InquiryBoard;
import meeteat.dto.inquiryBoard.InquiryParam;
import meeteat.util.Paging;

public interface InquiryBoardService {

	public Paging getInquiryPaging(Paging curPage, InquiryParam inquiryParam);

	public List<HashMap<String, String>> InquiryList(Paging paging, int board_no, int article_secret, InquiryParam inquiryParam);

	public HashMap<String, Object> inquiryWrite(InquiryBoard inquiryBoard);

	public HashMap<String, Object> inquiryView(InquiryBoard inquiryBoard, int article_no);

	public Boolean isWriter(String user_nick, HttpSession session);

	public Map<String, Object> getInquiryModify(int board_no, int article_no, HttpSession session);

	public void inquiryModify(InquiryBoard inquiryBoard);

	public void inquiryDelete(InquiryBoard inquiryBoard);
	
	/**
	 * 답글
	 * @param inquiryBd
	 */
	public void reply(InquiryBoard inquiryBoard);
	
	/**
	 * view articleno
	 * @param article_no
	 * @return
	 */
	public InquiryBoard articleno(int article_no);

	/**
	 * 답글 정보
	 * @param board_no
	 * @param article_no
	 * @param session
	 * @param post_step 
	 * @param post_indent 
	 * @param post_group 
	 * @return
	 */
	public Map<String, Object> getInquiryParam(int board_no, int article_no, HttpSession session, String post_group, String post_indent, String post_step);

	/**
	 * 이전글 보기
	 * @param article_no
	 * @param board_no
	 * @return
	 */
	public InquiryBoard getPrevArticle(int article_no, int board_no);

	/**
	 * 다음글 보기
	 * @param article_no
	 * @param board_no
	 * @return
	 */
	public InquiryBoard getNextArticle(int article_no, int board_no);


}
