package meeteat.dto.boardAdmin;

import java.util.Date;

public class BoardAdmin {
	
	private int article_no;
	private String article_title;
	private String article_content;
	private int board_no;
	private int user_no;
	private Date create_date;
	private Date revision_date;
	private int is_delete;
	private int article_hit;
	
	@Override
	public String toString() {
		return "BoardAdmin [article_no=" + article_no + ", article_title=" + article_title + ", article_content="
				+ article_content + ", board_no=" + board_no + ", user_no=" + user_no + ", create_date=" + create_date
				+ ", revision_date=" + revision_date + ", is_delete=" + is_delete + ", article_hit=" + article_hit
				+ "]";
	}

	public int getArticle_no() {
		return article_no;
	}

	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}

	public String getArticle_title() {
		return article_title;
	}

	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}

	public String getArticle_content() {
		return article_content;
	}

	public void setArticle_content(String article_content) {
		this.article_content = article_content;
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

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Date getRevision_date() {
		return revision_date;
	}

	public void setRevision_date(Date revision_date) {
		this.revision_date = revision_date;
	}

	public int getIs_delete() {
		return is_delete;
	}

	public void setIs_delete(int is_delete) {
		this.is_delete = is_delete;
	}

	public int getArticle_hit() {
		return article_hit;
	}

	public void setArticle_hit(int article_hit) {
		this.article_hit = article_hit;
	}
	
}
