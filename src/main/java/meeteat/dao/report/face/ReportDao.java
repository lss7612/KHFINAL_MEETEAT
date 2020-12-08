package meeteat.dao.report.face;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import meeteat.dto.report.ResultReportReason;
import meeteat.dto.report.UserReport;
import meeteat.util.Paging;

public interface ReportDao {


	public List<UserReport> getAllReportList(Paging paging);

	public int selectCntAll(String user_id);

	public int selectCntAllReportResult(String user_id);
	
	public ResultReportReason getResultReasonList();

	public List<HashMap<String, String>> getReportByUsernoASC(Paging paging);

	public List<HashMap<String, String>> getReportByUsernoDESC(Paging paging);

	public List<HashMap<String, String>> getReportByReportDateASC(Paging paging);

	public List<HashMap<String, String>> getReportByReportDateDESC(Paging paging);

	public List<HashMap<String, String>> getReportByReportReasonASC(Paging paging);

	public List<HashMap<String, String>> getReportByReportReasonDESC(Paging paging);

	public void reportResultSet(int user_no);

	public void userGradeUpdate(int user_no);

	public void setIsProcessedReportList(int user_no);

	public List<HashMap<String, String>> searchReportResultList(@Param("startNo")int startNo
			, @Param("endNo")int endNo, @Param("user_id")String user_id);

	public List<HashMap<String, String>> searchListByUserId(String user_id);


}
