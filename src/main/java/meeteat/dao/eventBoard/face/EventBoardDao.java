package meeteat.dao.eventBoard.face;

import java.util.HashMap;
import java.util.List;

import meeteat.dto.eventBoard.EventBoard;
import meeteat.dto.recruitBoard.SearchParam;

public interface EventBoardDao {

	public List<HashMap<String, Object>> getHoldingEventList(HashMap<String,Object> param);

	public int selectCntHoldingListAll(SearchParam searchParam);

	public void insertEventBoard(EventBoard param);

	public void updateEventBoard(EventBoard param);

	public int getNextVal();

	public int selectCntTerminatedListAll(SearchParam searchParam);

	public List<HashMap<String, Object>> getTerminatedEventList(HashMap<String, Object> param);

	public void insertPopup(EventBoard param);

	public List<HashMap<String, Object>> getPopupList(int is_popup);

	public void updatePopup(HashMap<String, Object> param);

	public int selectPopupListCnt();

}
