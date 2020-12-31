package meeteat.dto.reviewBoard;

import java.util.Date;

public class ReviewComment {
	
	private int comment_no;
	private int article_no;
	private int board_no;
	private String comment_content;
	private int user_no;
	private int comment_order;
	private Date create_date;
	private int is_delete;
	private String user_nick;
	
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
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
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getComment_order() {
		return comment_order;
	}
	public void setComment_order(int comment_order) {
		this.comment_order = comment_order;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public int getIs_delete() {
		return is_delete;
	}
	public void setIs_delete(int is_delete) {
		this.is_delete = is_delete;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	
	@Override
	public String toString() {
		return "ReviewComment [comment_no=" + comment_no + ", article_no=" + article_no + ", board_no=" + board_no
				+ ", comment_content=" + comment_content + ", user_no=" + user_no + ", comment_order=" + comment_order
				+ ", create_date=" + create_date + ", is_delete=" + is_delete + ", user_nick=" + user_nick + "]";
	}
	
}
