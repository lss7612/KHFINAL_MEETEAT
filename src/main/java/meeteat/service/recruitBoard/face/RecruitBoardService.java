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

	/**
	 * DTO를 이용해 게시글을 DB에 등록한다.
	 * 등록한 게시글의 게시판 번호와 게시글 번호를 반환한다.
	 * 
	 * @param param - 게시글 등록을 위한 DTO
	 * @param session - 글쓴이(user_no) 확인을 위해 필요
	 * @param ext01 - 첫번째 업로드파일의 확장자
	 * @param ext02 - 두번째 업로드 파일의 확장자
	 * @param ext03 - 세번째 업로드 파일의 확장자
	 * @return 게시글 번호와 게시판 분류번호 반환
	 */
	public HashMap<String, Object> write(RecruitBoard param, HttpSession session, String ext01, String ext02,String ext03);

	/**
	 * 현재페이지와 검색내용을 반영하여 paging 객체를 반환한다.
	 * 한 페이지 최대 게시글 수를 설정 가능하다.
	 * 
	 * @param curPage_str - 현재 페이지 정보
	 * @param searchParam - 검색 내용 정보
	 * @return paging객체 반환
	 */
	public Paging getPaging(String curPage_str, SearchParam searchParam);

	/**
	 * 페이징객체와 검색정보, 게시글 분류번호를 이용하여 게시글 목록을 반환한다.
	 * 
	 * @param paging - paging 객체
	 * @param searchParam - 검색 내용 정보
	 * @param board_no - 게시판 분류번호
	 * @return 게시글의 리스트를 반환한다.
	 */
	public List<HashMap<String, String>> list(Paging paging, SearchParam searchParam, int board_no);

	
	/**
	 * 게시판 번호와 게시글 번호를 이용하여 게시글을 볼때 필요한 정보들을 반환한다.
	 * 
	 * @param board_no - 게시판 분류번호
	 * @param article_no - 게시글 번호
	 * @param searchParam - 검색내용
	 * @param session - 세션의 유저 번호를 이용해 추천을 했는지 알기 위해 필요하다.
	 * @return 게시판을 볼떄 필요한 정보를 반환
	 */
	public HashMap<String, Object> getBoardView(int board_no, int article_no, SearchParam searchParam,
			HttpSession session);

	/**
	 * 작성자와 수정,삭제하고자하는 사람이 동일 회원인지 비교한다.
	 * 
	 * @param user_nick
	 * @param session
	 * @return 동일하면 ture 동일하지 않으면 false반환한다.
	 */
	public Boolean isWriter(String user_nick, HttpSession session);

	/**
	 * 수정할 때 해당 글의 원래 데이터들을 가지고온다
	 * 
	 * @param board_no - 게시판 분류번호
	 * @param article_no - 게시글 번호
	 * @param session
	 * @return 해당 글의 원래 데이터를 반환한다.
	 */
	public Map<String, Object> getModifyParam(int board_no, int article_no, HttpSession session);

	/**
	 * 글을 수정한다.
	 * 
	 * @param param - 글을 수정하기 위한 DTO
	 */
	public void modify(RecruitBoard param);

	/**
	 * 글을 삭제한다.
	 * 
	 * @param article_no - 게시글 번호
	 * @param board_no - 게시판 분류번호
	 */
	public void delete(int article_no, int board_no);

	public HashMap<String, Object> recommend(Map<String, Object> param);

}
