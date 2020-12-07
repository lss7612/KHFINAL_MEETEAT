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

	public void write(RecruitBoard param);

	public List<HashMap<String,String>> list(Paging paging, SearchParam searchParam);

	public Paging getPaging(String curPage_str, SearchParam searchParam);

	public HashMap<String,Object> getBoardView(int board_no, int article_no, SearchParam searchParam);

	public Boolean isWriter(String user_nick, HttpSession session);

	public Map<String, Object> getModifyParam(int board_no,int article_no);

	public void modify(RecruitBoard param);

}
