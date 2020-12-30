package meeteat.dao.noticeBoard.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import meeteat.dto.noticeBoard.NoticeBoard;
import meeteat.util.Paging;

public interface NoticeBoardDao {

	/**
	 * 전체 게시글 수 조회
	 * @param curPage 현재 페이지 번호
	 * @return 조회된 게시물 수
	 */
	public int selectCntAll();

	/**
	 * 공지사항 리스트 조회
	 * @param map 목록 정보 map 형태
	 * @return 조회된 공지사항 리스트
	 */
	public List<HashMap<String, String>> selectList(HashMap<String, Object> map);

	/**
	 * 공지사항 글 작성
	 * @param noticeBoard
	 */
	public void noticeWrite(NoticeBoard noticeBoard);

	/**
	 * 조회수
	 * @param map DTO
	 */
	public void upDateHit(Map<String, Object> map);

	/**
	 * 공지사항 상세페이지
	 * @param map
	 * @return 클릭한 글 상세페이지
	 */
	public HashMap<String, Object> getNoticeView(Map<String, Object> map);

	/**
	 * 공지사항 수정
	 * @param noticeBoard DTO
	 */
	public void upDateNoticeBoard(NoticeBoard map);

	/**
	 * 공지사항 삭제
	 * @param map DTO
	 */
	public void deleteNotice(Map<String, Object> map);

	/**
	 * 공지사항 게시글 번호
	 * @return
	 */
	public int getNextVal();

	/**
	 * 이전글 보기
	 * @param map
	 * @return
	 */
	public NoticeBoard getPrevArticle(HashMap<String, String> map);

	/**
	 * 다음글 보기
	 * @param map
	 * @return
	 */
	public NoticeBoard getNextArticle(HashMap<String, String> map);



}
