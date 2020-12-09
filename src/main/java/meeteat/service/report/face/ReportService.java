package meeteat.service.report.face;

import java.util.HashMap;
import java.util.List;

import meeteat.dto.report.ResultReportReason;
import meeteat.dto.report.UserReport;
import meeteat.util.Paging;

public interface ReportService {

	public List<UserReport> getReportList(Paging paging);

	public Paging getPaging(Paging curPage, String user_id);

	public Paging getReportResultPaging(Paging curPage, String user_id);
	
	public ResultReportReason getResultReason();

	public List<HashMap<String, String>> getReportListByReportDateASC(Paging paging, String search);

	public List<HashMap<String, String>> getReportListByReportDateDESC(Paging paging, String search);

	public List<HashMap<String, String>> getReportListByUernoASC(Paging paging, String search);

	public List<HashMap<String, String>> getReportListByUsernoDESC(Paging paging, String search);

	public List<HashMap<String, String>> getReportByReportReasonASC(Paging paging, String search);

	public List<HashMap<String, String>> getReportByReportReasonDESC(Paging paging, String search);

	public void reportResultSet(int user_no);

	public void userGradeSetReportResult(int user_no);

	public void setIsProcessed(int user_no);

	public List<HashMap<String, String>> getReportResultList(int startNo, int endNo, String user_id);

	public List<HashMap<String, String>> getListByUserId(String user_id);


}
