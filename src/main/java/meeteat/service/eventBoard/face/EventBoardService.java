package meeteat.service.eventBoard.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import meeteat.dto.eventBoard.EventBoard;
import meeteat.dto.recruitBoard.SearchParam;
import meeteat.util.Paging;

public interface EventBoardService {

	public Paging getHoldingPaging(String curPage, SearchParam searchParam);
	
	public List<HashMap<String, Object>> getHoldingEventList(Paging paging, int board_no, SearchParam searchParam);

	public void write(EventBoard param,HttpSession session, String ext01, String ext02, String ext03);

	public void modify(EventBoard param);

	public Paging getTerminatedPaging(String curPage, SearchParam searchParam);

	public List<HashMap<String, Object>> getTerminatedEventList(Paging paging, int board_no, SearchParam searchParam);

	public List<HashMap<String, Object>> getLists(int is_popup);

	public void update(int is_popup,List<String> list);

}
