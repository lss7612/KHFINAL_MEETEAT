package meeteat.dto.mateFindBoard;

public class Recommend {
	
	private int article_no;
	private int board_no;
	private int user_no;
	
	@Override
	public String toString() {
		return "Recommend [article_no=" + article_no + ", board_no=" + board_no + ", user_no=" + user_no + "]";
	}

	public int getArticle_no() {
		return article_no;
	}

	public void setArticle_no(int article_no) {
		this.article_no = article_no;
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
	
	

}
