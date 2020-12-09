package meeteat.dao.report.face;

import java.util.HashMap;
import java.util.List;

import meeteat.dto.report.UserReport;

public interface DoReportDao {

	public List<HashMap<String, String>> getReportReasonList();

	public HashMap<String, String> getUserInfoByUserNo(int user_no);

	public void insertUserReport(UserReport report);

}
