package meeteat.service.recruitBorad.face;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import meeteat.dto.recruitBoard.RecruitBoard;
import meeteat.dto.recruitBoard.SearchParam;
import meeteat.util.Paging;

public interface RecruitBoardService {

	public void write(RecruitBoard param);

	public List<LinkedHashMap<String,String>> list(Paging paging, SearchParam searchParam);

	public Paging getPaging(String curPage_str, SearchParam searchParam);

	public HashMap<String,Object> getBoardView(int board_no, int article_no);

}
