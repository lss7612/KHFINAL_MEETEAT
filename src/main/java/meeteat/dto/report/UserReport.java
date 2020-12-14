package meeteat.dto.report;

import java.util.Date;

public class UserReport {

	private int report_no;
	private int user_no;
	private Date report_time;
	private int reason_no;
	private String report_content;
	private String board_url;
	
	@Override
	public String toString() {
		return "UserReport [report_no=" + report_no + ", user_no=" + user_no + ", report_time=" + report_time
				+ ", reason_no=" + reason_no + ", report_content=" + report_content + ", board_url=" + board_url + "]";
	}
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public Date getReport_time() {
		return report_time;
	}
	public void setReport_time(Date report_time) {
		this.report_time = report_time;
	}
	public int getReason_no() {
		return reason_no;
	}
	public void setReason_no(int reason_no) {
		this.reason_no = reason_no;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public String getBoard_url() {
		return board_url;
	}
	public void setBoard_url(String board_url) {
		this.board_url = board_url;
	}
	
	
}
