package meeteat.dao.myPage.face;

import java.util.Map;

public interface MyPageDao {

	/**
	 * 마이페이지 기본 정보 조회
	 * @param user_no
	 * @return
	 */
	Map<String, Object> selectByNo(int user_no);

}
