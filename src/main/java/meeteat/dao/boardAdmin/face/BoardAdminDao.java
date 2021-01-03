package meeteat.dao.boardAdmin.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import meeteat.dto.boardAdmin.BoardAdminParam;

public interface BoardAdminDao {

	/**
	 * 게시판 전체 게시물 수
	 * @param boardAdminParam 
	 * @return
	 */
	public int selectBoardCntAll(BoardAdminParam boardAdminParam);

	/**
	 * 게시판 전체 게시물 리스트
	 * @param map
	 * @return
	 */
	public List<HashMap<String, String>> getBoardAllList(HashMap<String, Object> map);

	/**
	 * 게시물 삭제
	 * @param map
	 */
	public void deleteBoardManage(Map<String, Object> map);

}
