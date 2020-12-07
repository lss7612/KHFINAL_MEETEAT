package meeteat.dto.report;

public class ResultReportReason {

	private int report_result;
	private String report_result_content;
	@Override
	public String toString() {
		return "ResultReportReason [report_result=" + report_result + ", report_result_content=" + report_result_content
				+ "]";
	}
	public int getReport_result() {
		return report_result;
	}
	public void setReport_result(int report_result) {
		this.report_result = report_result;
	}
	public String getReport_result_content() {
		return report_result_content;
	}
	public void setReport_result_content(String report_result_content) {
		this.report_result_content = report_result_content;
	}
	
	
}
