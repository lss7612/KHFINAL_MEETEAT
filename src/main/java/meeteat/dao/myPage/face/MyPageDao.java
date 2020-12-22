package meeteat.dao.myPage.face;

import java.util.List;
import java.util.Map;

import meeteat.dto.user.User;

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


	public List<Map<String, Object>> selectMyPostByNo(int user_no);


}
