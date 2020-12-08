package meeteat.service.recruitBoard.face;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import meeteat.dto.recruitBoard.RecruitBoard;
import meeteat.dto.recruitBoard.SearchParam;
import meeteat.util.Paging;

public interface RecruitBoardService {

	public HashMap<String,Object> write(RecruitBoard param);

	public List<HashMap<String,String>> list(Paging paging, SearchParam searchParam);

	public Paging getPaging(String curPage_str, SearchParam searchParam);

	public HashMap<String,Object> getBoardView(int board_no, int article_no, SearchParam searchParam, HttpSession session);

	public Boolean isWriter(String user_nick, HttpSession session);

	public Map<String, Object> getModifyParam(int board_no,int article_no);

	public void modify(RecruitBoard param);

	public void delete(int article_no, int board_no);

	public int recommend(Map<String, Object> param);

}
