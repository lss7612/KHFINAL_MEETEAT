package meeteat.dto.inquiryBoard;

import java.util.Date;

public class InquiryBoard {

	private int article_no;
	private String article_title;
	private String article_content;
	private int board_no;
	private int user_no;
	private Date create_date;
	private Date revision_date;
	private int is_delete;
	private int article_hit;
	private String post_group;
	private String post_step;
	private String post_indent;
	private int article_secret;
	
	@Override
	public String toString() {
		return "InquiryBoard [article_no=" + article_no + ", article_title=" + article_title + ", article_content="
				+ article_content + ", board_no=" + board_no + ", user_no=" + user_no + ", create_date=" + create_date
				+ ", revision_date=" + revision_date + ", is_delete=" + is_delete + ", article_hit=" + article_hit
				+ ", post_group=" + post_group + ", post_step=" + post_step + ", post_indent=" + post_indent
				+ ", article_secret=" + article_secret + "]";
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

	public String getPost_group() {
		return post_group;
	}

	public void setPost_group(String post_group) {
		this.post_group = post_group;
	}

	public String getPost_step() {
		return post_step;
	}

	public void setPost_step(String post_step) {
		this.post_step = post_step;
	}

	public String getPost_indent() {
		return post_indent;
	}

	public void setPost_indent(String post_indent) {
		this.post_indent = post_indent;
	}

	public int getArticle_secret() {
		return article_secret;
	}

	public void setArticle_secret(int article_secret) {
		this.article_secret = article_secret;
	}
	
	
	
	
}
