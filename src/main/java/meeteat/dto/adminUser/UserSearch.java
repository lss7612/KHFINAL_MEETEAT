package meeteat.dto.adminUser;

public class UserSearch {
	
	private String user_search;
	private String user_keyword;
	
	public String getUser_search() {
		return user_search;
	}
	public void setUser_search(String user_search) {
		this.user_search = user_search;
	}
	public String getUser_keyword() {
		return user_keyword;
	}
	public void setUser_keyword(String user_keyword) {
		this.user_keyword = user_keyword;
	}
	
	@Override
	public String toString() {
		return "Usersearch [user_search=" + user_search + ", user_keyword=" + user_keyword + "]";
	}
	
}
