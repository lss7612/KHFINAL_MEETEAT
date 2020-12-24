package meeteat.service.noticeBoard.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import meeteat.dto.boardAdmin.BoardAdmin;
import meeteat.dto.boardAdmin.BoardAdminParam;
import meeteat.dto.noticeBoard.NoticeBoard;
import meeteat.util.Paging;

public interface NoticeBoardService {
	
	/**
	 * 페이징 처리
	 * @param curPage 현재 목록
	 * @return 페이징 처리된 목록
	 */
	public Paging getNoticePaging(Paging curPage);

	/**
	 * 공지사항 리스트
	 * @param paging 페이징 처리
	 * @param board_no 게시판 번호
	 * @param session 
	 * @return 조회된 공지사항 리스트
	 */
	public List<HashMap<String, String>> noticeList(Paging paging, int board_no);

	/**
	 * 공지사항 글 작성
	 * @param noticeBoard
	 */
	public HashMap<String, Object> noticeWrite(NoticeBoard noticeBoard);

	
	/**
	 * 공지사항 상세페이지
	 * @param noticeBoard 공지사항 DTO
	 * @param article_no 
	 * @return 조회된 공지사항 상세페이지
	 */
	public HashMap<String, Object> noticeView(NoticeBoard noticeBoard, int article_no);
	
	/**
	 * 공지사항 수정 원본 가져오기
	 * @param board_no 게시판 번호
	 * @param article_no 게시글 번호
	 * @param session 세션
	 * @return 공지사항 수정
	 */
	public Map<String, Object> getnoticeModify(int board_no, int article_no, HttpSession session);

	/**
	 * 공지사항 수정
	 * @param noticeBoard DTO
	 */
	public void noticeModify(NoticeBoard noticeBoard);

	/**
	 * 공지사항 삭제
	 * @param noticeBoard DTO
	 */
	public void noticeDelete(NoticeBoard noticeBoard);


	/**
	 * 에러페이지
	 * @param user_nick 닉네임
	 * @param session 유저 정보
	 * @return 에러 페이지로 이동
	 */
	public Boolean isWriter(String user_nick, HttpSession session);

}
