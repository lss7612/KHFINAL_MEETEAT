package meeteat.service.boardAdmin.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import meeteat.dto.boardAdmin.BoardAdmin;
import meeteat.dto.boardAdmin.BoardAdminParam;
import meeteat.util.Paging;

public interface BoardAdminService {

	/**
	 * 페이징 처리
	 * @param curPage
	 * @param boardAdminParam
	 * @return
	 */
	public Paging getBoardManagePaging(Paging curPage, BoardAdminParam boardAdminParam);

	/**
	 * 게시물 목록
	 * @param paging
	 * @param boardAdminParam 
	 * @param boardAdmin
	 * @return
	 */
	public List<HashMap<String, String>> BoardManageList(Paging paging, BoardAdminParam boardAdminParam, BoardAdmin boardAdmin);

	/**
	 * 게시물 삭제
	 * @param string
	 * @param boardAdmin 
	 */
	public void deleteBoard(List<String> articleNoList, List<String> boardNoList);



}
