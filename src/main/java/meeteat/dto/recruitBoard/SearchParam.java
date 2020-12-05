package meeteat.dto.recruitBoard;

public class SearchParam {

	private int searchBoard_no;
	private String searchCategory;
	private String searchKeyword;
	@Override
	public String toString() {
		return "SearchParam [searchBoard_no=" + searchBoard_no + ", searchCategory=" + searchCategory
				+ ", searchKeyword=" + searchKeyword + "]";
	}
	public int getSearchBoard_no() {
		return searchBoard_no;
	}
	public void setSearchBoard_no(int searchBoard_no) {
		this.searchBoard_no = searchBoard_no;
	}
	public String getSearchCategory() {
		return searchCategory;
	}
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
}
