package meeteat.service.myPage.face;

import java.util.Map;

public interface MyPageService {

	/**
	 * 마이페이지 기본 정보 조회
	 * @param user_no
	 * @return
	 */
	Map<String, Object> infoByNo(int user_no);

}
