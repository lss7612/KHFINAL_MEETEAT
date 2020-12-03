package meeteat.dao.recruitBoard.face;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import meeteat.dto.recruitBoard.RecruitBoard;
import meeteat.dto.recruitBoard.SearchParam;

public interface RecruitBoardDao {

	public void insertRecruitBoard(RecruitBoard param);

	public List<LinkedHashMap<String,String>> getRecruitBoardList(HashMap<String, Object> param);

	public int selectCntListAll(SearchParam searchParam);

}
