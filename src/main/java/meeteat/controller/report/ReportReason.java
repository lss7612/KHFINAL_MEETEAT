package meeteat.controller.report;

public class ReportReason {

	private int reason_no;
	private String reason_content;
	
	@Override
	public String toString() {
		return "ReportReason [reason_no=" + reason_no + ", reason_content=" + reason_content + "]";
	}
	
	public int getReason_no() {
		return reason_no;
	}
	
	public void setReason_no(int reason_no) {
		this.reason_no = reason_no;
	}
	
	public String getReason_content() {
		return reason_content;
	}
	
	public void setReason_content(String reason_content) {
		this.reason_content = reason_content;
	}
	
}
