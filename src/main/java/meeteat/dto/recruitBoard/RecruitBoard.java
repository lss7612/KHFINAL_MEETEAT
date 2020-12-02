package meeteat.dto.recruitBoard;

import java.util.Date;

public class RecruitBoard {

	private int article_no;
	private String article_title;
	private String article_content;
	private String party_location;
	private	int user_no;
	private	Date create_date;
	private Date revision_date;
	private int file_no;
	private int is_delete;
	private int article_hit;
	private Date meet_time;
	@Override
	public String toString() {
		return "RecruitBoard [article_no=" + article_no + ", article_title=" + article_title + ", article_content="
				+ article_content + ", party_location=" + party_location + ", user_no=" + user_no + ", create_date="
				+ create_date + ", revision_date=" + revision_date + ", file_no=" + file_no + ", is_delete=" + is_delete
				+ ", article_hit=" + article_hit + ", meet_time=" + meet_time + "]";
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
	public String getParty_location() {
		return party_location;
	}
	public void setParty_location(String party_location) {
		this.party_location = party_location;
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
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
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
	public Date getMeet_time() {
		return meet_time;
	}
	public void setMeet_time(Date meet_time) {
		this.meet_time = meet_time;
	}
	
	
	
}
