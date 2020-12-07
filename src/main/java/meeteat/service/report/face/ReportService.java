package meeteat.service.report.face;

import java.util.List;

import meeteat.dto.report.ResultReportReason;
import meeteat.dto.report.UserReport;
import meeteat.util.Paging;

public interface ReportService {

	public List<UserReport> getReportList(Paging paging);

	public Paging getPaging(Paging curPage);

	public ResultReportReason getResultReason();

	public List<UserReport> getReportListByReportDateASC(Paging paging);

	public List<UserReport> getReportListByReportDateDESC(Paging paging);

	public List<UserReport> getReportListByUernoASC(Paging paging);

	public List<UserReport> getReportListByUsernoDESC(Paging paging);

	public List<UserReport> getReportByReportReasonASC(Paging paging);

	public List<UserReport> getReportByReportReasonDESC(Paging paging);

	public void reportResultSet(int user_no);

	public void userGradeSetReportResult(int user_no);

	public void setIsProcessed(int user_no);

}
