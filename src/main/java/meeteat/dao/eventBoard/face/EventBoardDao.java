package meeteat.dao.eventBoard.face;

import java.util.HashMap;
import java.util.List;

import meeteat.dto.eventBoard.EventBoard;
import meeteat.dto.recruitBoard.SearchParam;

public interface EventBoardDao {

	public List<HashMap<String, Object>> getHoldingEventList();

	public int selectCntHoldingListAll(SearchParam searchParam);

	public void insertEventBoard(EventBoard param);

	public void updateEventBoard(EventBoard param);

	public int getNextVal();

	public int selectCntTerminatedListAll(SearchParam searchParam);

	public List<HashMap<String, Object>> getTerminatedEventList();

}
