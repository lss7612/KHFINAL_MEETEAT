package meeteat.dao.inquiryBoard.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import meeteat.dto.inquiryBoard.InquiryBoard;
import meeteat.util.Paging;

public interface InquiryBoardDao {

	public int selectCntAll();

	public List<HashMap<String, String>> selectIquiryList(HashMap<String, Object> map);

	public int getNextVal();

	public void inquiryWrite(InquiryBoard inquiryBoard);

	public HashMap<String, Object> getInquiryView(Map<String, Object> map);

	public void upDateInquiryBoard(InquiryBoard map);

	public void deleteInquiry(Map<String, Object> map);

	public void upDateHit(Map<String, Object> map);

	public InquiryBoard articleno(int article_no);

	public void replyArticle(InquiryBoard inquiryBoard);

	public void replyByUpdate(InquiryBoard inquiryBoard);

	public InquiryBoard getPrevArticle(HashMap<String, String> map);

	public InquiryBoard getNextArticle(HashMap<String, String> map);

}
