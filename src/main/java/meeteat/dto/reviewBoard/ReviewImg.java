package meeteat.dto.reviewBoard;

public class ReviewImg {
	
	private int file_no;
	private String file_originname;
	private String file_storedname;
	private int article_no;
	private int board_no;
	
	@Override
	public String toString() {
		return "ReviewImg [file_no=" + file_no + ", file_originname=" + file_originname + ", file_storedname="
				+ file_storedname + ", article_no=" + article_no + ", board_no=" + board_no + "]";
	}
	
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public String getFile_originname() {
		return file_originname;
	}
	public void setFile_originname(String file_originname) {
		this.file_originname = file_originname;
	}
	public String getFile_storedname() {
		return file_storedname;
	}
	public void setFile_storedname(String file_storedname) {
		this.file_storedname = file_storedname;
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

}
