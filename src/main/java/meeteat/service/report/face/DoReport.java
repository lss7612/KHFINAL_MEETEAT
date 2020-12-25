package meeteat.service.report.face;

import java.util.HashMap;
import java.util.List;

import meeteat.dto.report.UserReport;

public interface DoReport {

	/**
	 * 신고 사유 갖고오기
	 * @return 신고 사유
	 */
	public List<HashMap<String, String>> getReportReasonList();

	/**
	 * 신고하는 회원의 정보 갖고오기
	 * @param user_no : 해당회원
	 * @return 회원 정보
	 */
	public HashMap<String, String> getUserInfo(int user_no);

	/**
	 * 신고 목록테이블에 추가하기
	 * @param report : 신고 목록 테이블에 들어갈 값
	 */
	public void insertUserReport(UserReport report);


}
