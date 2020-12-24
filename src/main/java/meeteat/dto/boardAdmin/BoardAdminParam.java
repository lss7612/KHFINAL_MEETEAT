package meeteat.dto.boardAdmin;

public class BoardAdminParam {
	
	private int manageBoard_no;
	private String manageCategory;
	private String manageKeyword;
	private String manageSearch;
	
	@Override
	public String toString() {
		return "BoardAdminParam [manageBoard_no=" + manageBoard_no + ", manageCategory=" + manageCategory
				+ ", manageKeyword=" + manageKeyword + ", manageSearch=" + manageSearch + "]";
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
	
}
