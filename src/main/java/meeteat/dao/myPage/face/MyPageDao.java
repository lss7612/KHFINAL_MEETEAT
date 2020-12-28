package meeteat.dao.myPage.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import meeteat.dto.user.User;
import meeteat.util.MyPaging;

public interface MyPageDao {

	/**
	 * 마이페이지 기본 정보 조회
	 * @param user_no
	 * @return
	 */
	public Map<String, Object> selectByNo(int user_no);


	/**
	 * 마이페이지 수정
	 * @param user
	 */
	public void updateUser(User userUpdate);

	/**
	 * 내가 쓴 글 조회
	 * @param user_no
	 * @return
	 */
	public List<Map<String, Object>> selectMyPostByNo(int user_no);


	/**내가 쓴 댓글 조회
	 * 
	 * @param user_no
	 * @return
	 */
	public List<Map<String, Object>> selectMyCommentByNo(int user_no);

	/**
	 * 비밀번호 확인
	 * @param user
	 * @return
	 */
	public int pwChk(User user);

	/**
	 * 회원 탈퇴(회원 삭제)
	 * @param user
	 */
	public void deleteUser(User user);

	/**
	 * 마이 포스트 페이징 계산
	 * @param param
	 * @return
	 */
	public int selectCntAllPost(MyPaging curPage);

	/**
	 * 내 전체 글 조회
	 * @param paging
	 * @return
	 */
	public List<Map<String, Object>> myAllPostList(MyPaging paging);

	/**
	 * 선택한 게시글 삭제
	 * @param map
	 */
	public void deleteMyPost(HashMap<String, Object> map);

}