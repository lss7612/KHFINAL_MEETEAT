package meeteat.dto.myPage;

public class MyPageParam {
	private int board_no;
	private int user_no;
	private int postCategory;
	private String postSearch;
	@Override
	public String toString() {
		return "MyPageParam [board_no=" + board_no + ", user_no=" + user_no + ", postCategory=" + postCategory
				+ ", postSearch=" + postSearch + "]";
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getPostCategory() {
		return postCategory;
	}
	public void setPostCategory(int postCategory) {
		this.postCategory = postCategory;
	}
	public String getPostSearch() {
		return postSearch;
	}
	public void setPostSearch(String postSearch) {
		this.postSearch = postSearch;
	}

	
}
