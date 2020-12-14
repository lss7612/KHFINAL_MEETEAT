package meeteat.dto.recruitBoard;

public class SearchParam {

	private int searchBoard_no;
	private String searchCategory;
	private String searchKeyword;
	private String searchLocation;
	@Override
	public String toString() {
		return "SearchParam [searchBoard_no=" + searchBoard_no + ", searchCategory=" + searchCategory
				+ ", searchKeyword=" + searchKeyword + ", searchLocation=" + searchLocation + "]";
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
	public String getSearchLocation() {
		return searchLocation;
	}
	public void setSearchLocation(String searchLocation) {
		this.searchLocation = searchLocation;
	}
	
	
	
}
