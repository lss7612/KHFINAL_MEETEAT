package meeteat.dto.boardAdmin;

public class BoardAdminParam {
	
	private int manageBoard_no;
	private String manageCategory;
	private String manageKeyword;
	private String manageSearch;
	private String start_date;
	private String end_date;
	
	@Override
	public String toString() {
		return "BoardAdminParam [manageBoard_no=" + manageBoard_no + ", manageCategory=" + manageCategory
				+ ", manageKeyword=" + manageKeyword + ", manageSearch=" + manageSearch + ", start_date=" + start_date
				+ ", end_date=" + end_date + "]";
	}

	public int getManageBoard_no() {
		return manageBoard_no;
	}

	public void setManageBoard_no(int manageBoard_no) {
		this.manageBoard_no = manageBoard_no;
	}

	public String getManageCategory() {
		return manageCategory;
	}

	public void setManageCategory(String manageCategory) {
		this.manageCategory = manageCategory;
	}

	public String getManageKeyword() {
		return manageKeyword;
	}

	public void setManageKeyword(String manageKeyword) {
		this.manageKeyword = manageKeyword;
	}

	public String getManageSearch() {
		return manageSearch;
	}

	public void setManageSearch(String manageSearch) {
		this.manageSearch = manageSearch;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	
	
}
