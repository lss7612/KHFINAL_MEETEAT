package meeteat.service.myPage.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import meeteat.dto.user.User;
import meeteat.util.Paging;

public interface MyPageService {

	/**
	 * 마이페이지 기본 정보 조회
	 * @param user_no
	 * @return
	 */
	public Map<String, Object> infoByNo(int user_no);

	/**
	 * 마이페이지 수정
	 * @param user
	 * @param fileupload
	 */
	public void myEdit(User user, MultipartFile fileupload);

	/**내가 쓴 글 조회
	 * 
	 * @param user_no
	 * @return
	 */
	public List<Map<String, Object>> myPostList(int user_no);

	/**
	 * 내가 쓴 댓글 조회
	 * @param user_no
	 * @return
	 */
	public List<Map<String, Object>> myCommentList(int user_no);

	/**
	 * 비밀번호 체크
	 * @param user
	 * @return
	 */
	public boolean pwChk(User user);

	/**
	 * 회원 탈퇴(삭제)
	 * @param user
	 */
	public void deleteUser(User user);

	/**
	 * 페이징 계산
	 * @param curPage
	 * @param search
	 * @param category
	 * @return
	 */
//	public Paging getPaging(Paging curPage, String search, String category, int user_no);



}
