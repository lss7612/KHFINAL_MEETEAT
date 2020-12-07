package meeteat.dao.report.face;

import java.util.List;

import meeteat.dto.report.ResultReportReason;
import meeteat.dto.report.UserReport;
import meeteat.util.Paging;

public interface ReportDao {


	public List<UserReport> getAllReportList(Paging paging);

	public int selectCntAll(Paging curPage);

	public ResultReportReason getResultReasonList();

	public List<UserReport> getReportByUsernoASC(Paging paging);

	public List<UserReport> getReportByUsernoDESC(Paging paging);

	public List<UserReport> getReportByReportDateASC(Paging paging);

	public List<UserReport> getReportByReportDateDESC(Paging paging);

	public List<UserReport> getReportByReportReasonASC(Paging paging);

	public List<UserReport> getReportByReportReasonDESC(Paging paging);

}
