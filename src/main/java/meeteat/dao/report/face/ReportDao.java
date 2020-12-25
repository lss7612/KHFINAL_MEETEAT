package meeteat.dao.report.face;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import meeteat.dto.report.ResultReportReason;
import meeteat.dto.report.UserReport;
import meeteat.util.Paging;

public interface ReportDao {


	/**
	 * 페이징 계산을 위해 모든 신고 목록 계산
	 * @param paging 페이징 계산 객체
	 * @return 신고 목록
	 */
	public List<UserReport> getAllReportList(Paging paging);

	/**
	 * 전체 신고 건수 계산(id있으면 해당 id의 신고 건수 조회)
	 * @param user_id : 검색할 회원 아이디
	 * @return 신고 건수 
	 */
	public int selectCntAll(String user_id);

	/**
	 * 
	 * @param user_id
	 * @return
	 */
	public int selectCntAllReportResult(String user_id);
	
	/**
	 * 신고 사유 테이블에서 값 가져오기
	 * @return : 신고 사유
	 */
	public ResultReportReason getResultReasonList();

	/**
	 * 회원 번호 오름차순 정렬
	 * @param startNo : 페이징 번호
	 * @param endNo : 페이징 번호
	 * @param user_id : 회원 id
	 * @return 조회된 신고 목록
	 */
	public List<HashMap<String, String>> getReportByUsernoASC(@Param("startNo")int startNo
			, @Param("endNo")int endNo, @Param("user_id")String user_id);

	/**
	 * 회원 번호 내림차순 정렬
	 * @param startNo : 페이징 번호
	 * @param endNo : 페이징 번호
	 * @param user_id : 회원 id
	 * @return 조회된 신고 목록
	 */
	public List<HashMap<String, String>> getReportByUsernoDESC(@Param("startNo")int startNo
			, @Param("endNo")int endNo, @Param("user_id")String user_id);

	/**
	 * 신고일 오름차순 정렬
	 * @param startNo : 페이징 번호
	 * @param endNo : 페이징 번호
	 * @param user_id : 회원 id
	 * @return 조회된 신고 목록
	 */
	public List<HashMap<String, String>> getReportByReportDateASC(@Param("startNo")int startNo
			, @Param("endNo")int endNo, @Param("user_id")String user_id);

	/**
	 * 신고일 내림차순 정렬
	 * @param startNo : 페이징 번호
	 * @param endNo : 페이징 번호
	 * @param user_id : 회원 id
	 * @return 조회된 신고 목록
	 */
	public List<HashMap<String, String>> getReportByReportDateDESC(@Param("startNo")int startNo
			, @Param("endNo")int endNo, @Param("user_id")String user_id);

	/**
	 * 신고 사유 오름차순 정렬
	 * @param startNo : 페이징 번호
	 * @param endNo : 페이징 번호
	 * @param user_id : 회원 id
	 * @return 조회된 신고 목록
	 */
	public List<HashMap<String, String>> getReportByReportReasonASC(@Param("startNo")int startNo
			, @Param("endNo")int endNo, @Param("user_id")String user_id);

	/**
	 * 신고 사유 내림차순 정렬
	 * @param startNo : 페이징 번호
	 * @param endNo : 페이징 번호
	 * @param user_id : 회원 id
	 * @return 조회된 신고 목록
	 */
	public List<HashMap<String, String>> getReportByReportReasonDESC(@Param("startNo")int startNo
			, @Param("endNo")int endNo, @Param("user_id")String user_id);

	/**
	 * 신고 처리 등록
	 * @param user_no : 해당 회원 번호
	 */
	public void reportResultSet(int user_no);

	/**
	 * 신고 처리후 회원 등급 변경
	 * @param user_no : 해당 회원 번호
	 */
	public void userGradeUpdate(int user_no);

	/**
	 * 신고 처리 완료된 신고의 값 변경
	 * @param user_no : 해당 회원 번호
	 */
	public void setIsProcessedReportList(int user_no);

	/**
	 * 신고 처리 결과 목록 조회
	 * @param startNo : 시작하는 페이지 번호
	 * @param endNo : 끝나는 페이징 번호
	 * @param user_id : 검삭하는 회원의 id
	 * @return : 신고 처리 목록
	 */
	public List<HashMap<String, String>> searchReportResultList(@Param("startNo")int startNo
			, @Param("endNo")int endNo, @Param("user_id")String user_id);

}
