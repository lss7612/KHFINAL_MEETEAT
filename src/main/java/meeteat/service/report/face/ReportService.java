package meeteat.service.report.face;

import java.util.HashMap;
import java.util.List;

import meeteat.dto.report.ResultReportReason;
import meeteat.dto.report.UserReport;
import meeteat.util.Paging;

public interface ReportService {

	/**
	 * 페이징으로 신고 목록 갖고오기
	 * @param paging : 페이징
	 * @return : 신고 목록
	 */
	public List<UserReport> getReportList(Paging paging);

	/**
	 * report 페이지 페이징 계산
	 * @param curPage : 현재 페이지
	 * @param user_id : 
	 * @return
	 */
	public Paging getPaging(Paging curPage, String user_id);

	/**
	 * 신고 처리 결과 페이징
	 * @param curPage : 페이징 번호
	 * @param user_id : 조회하는 회원 id
	 * @return
	 */
	public Paging getReportResultPaging(Paging curPage, String user_id);
	
	/**
	 * 정지 사유 테이블에서 값 갖고 오기
	 * @return 정지 사유 목록
	 */
	public ResultReportReason getResultReason();

	/**
	 * 신고 일시로 오름차순 정렬
	 * @param paging : 페이징
	 * @param search : 검색id
	 * @return
	 */
	public List<HashMap<String, String>> getReportListByReportDateASC(Paging paging, String search);

	/**
	 * 신고 일시로 내림차순 정렬
	 * @param paging : 페이징
	 * @param search : 검색id
	 * @return
	 */
	public List<HashMap<String, String>> getReportListByReportDateDESC(Paging paging, String search);

	/**
	 * 회원 번호로 오름차순 정렬
	 * @param paging : 페이징
	 * @param search : 검색id
	 * @return
	 */
	public List<HashMap<String, String>> getReportListByUernoASC(Paging paging, String search);

	/**
	 * 회원 번호로 내림차순 정렬
	 * @param paging : 페이징
	 * @param search : 검색id
	 * @return
	 */
	public List<HashMap<String, String>> getReportListByUsernoDESC(Paging paging, String search);

	/**
	 * 신고 사유로 오름차순 정렬
	 * @param paging : 페이징
	 * @param search : 검색id
	 * @return
	 */
	public List<HashMap<String, String>> getReportByReportReasonASC(Paging paging, String search);

	/**
	 * 신고 사유로 내림차순 저렬
	 * @param paging : 페이징
	 * @param search : 검색id
	 * @return
	 */
	public List<HashMap<String, String>> getReportByReportReasonDESC(Paging paging, String search);

	/**
	 * 신고 처리 테이블에 추가
	 * @param user_no : 해당 회원 번호
	 */
	public void reportResultSet(int user_no);

	/**
	 * 신고 처리로 인한 회원 등급 변경
	 * @param user_no : 해당 회원 번호
	 */
	public void userGradeSetReportResult(int user_no);

	/**
	 * 신고목록에서 처리된 신고 값 1로 변경
	 * @param user_no : 해당 회원 번호
	 */
	public void setIsProcessed(int user_no);

	/**
	 * 신고 처리 결과 목록 갖고오기
	 * @param startNo : 페이징 시작 번호
	 * @param endNo : 페이징 끝 번호
	 * @param user_id : 검색id
	 * @return
	 */
	public List<HashMap<String, String>> getReportResultList(int startNo, int endNo, String user_id);


}
