package meeteat.dao.report.face;

import java.util.HashMap;
import java.util.List;

import meeteat.dto.report.UserReport;

public interface DoReportDao {

	/**
	 * 신고사유 테이블에서 값 가져오기
	 * @return : 신고 사유 값
	 */
	public List<HashMap<String, String>> getReportReasonList();

	/**
	 * 회원 번호로 신고할 회원 정보 갖고오기
	 * @param user_no : 해당 회원의 회원 번호
	 * @return : 회원 정보
	 */
	public HashMap<String, String> getUserInfoByUserNo(int user_no);

	/**
	 * 신고 목록에 신고 내용 추가하기
	 * @param report  :신고 목록 테이블에 필요한 값
	 */
	public void insertUserReport(UserReport report);

}
