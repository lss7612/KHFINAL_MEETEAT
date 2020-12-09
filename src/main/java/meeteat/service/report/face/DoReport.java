package meeteat.service.report.face;

import java.util.HashMap;
import java.util.List;

import meeteat.dto.report.UserReport;

public interface DoReport {

	public List<HashMap<String, String>> getReportReasonList();

	public HashMap<String, String> getUserInfo(int user_no);

	public void insertUserReport(UserReport report);


}
