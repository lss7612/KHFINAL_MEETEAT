package meeteat.dto.mateFindBoard;

import java.util.Date;

public class MateFindBoard {

// 기본생성
	private int article_no;				// 게시글번호
	private int board_no;				// 게시글분류번호
	private int user_no;				// 작성자
	private Date create_date;			// 작성날짜
	private Date revision_date;			// 수정날짜
	private int file_no;				// 파일번호
	private int is_delete;				// 삭제여부
	private int article_hit;			// 조회수

	private String mate_list;			// 참여자리스트
	
// 사용자입력사항
	private String article_title;		// 제목
	private String article_content;		// 내용
	private String category;			// 지역
	private String party_location;		// 위치
	private String meet_time;			// 약속시간

	
	
// 메이트찾기 게시판 불필요 	
	private Date terminate_date;		// 완료날짜
	private String article_pw;			// 게시글 비밀번호
	private int post_group;
	private int post_step;
	private int post_indent;
	
	
	@Override
	public String toString() {
		return "MateFindBoard [article_no=" + article_no + ", article_title=" + article_title + ", article_content="
				+ article_content + ", board_no=" + board_no + ", party_location=" + party_location + ", user_no="
				+ user_no + ", create_date=" + create_date + ", revision_date=" + revision_date + ", file_no=" + file_no
				+ ", is_delete=" + is_delete + ", article_hit=" + article_hit + ", category=" + category
				+ ", meet_time=" + meet_time + ", mate_list=" + mate_list + ", terminate_date=" + terminate_date
				+ ", article_pw=" + article_pw + ", post_group=" + post_group + ", post_step=" + post_step
				+ ", post_indent=" + post_indent + "]";
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


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getMeet_time() {
		return meet_time;
	}


	public void setMeet_time(String meet_time) {
		this.meet_time = meet_time;
	}


	public String getMate_list() {
		return mate_list;
	}


	public void setMate_list(String mate_list) {
		this.mate_list = mate_list;
	}


	public Date getTerminate_date() {
		return terminate_date;
	}


	public void setTerminate_date(Date terminate_date) {
		this.terminate_date = terminate_date;
	}


	public String getArticle_pw() {
		return article_pw;
	}


	public void setArticle_pw(String article_pw) {
		this.article_pw = article_pw;
	}


	public int getPost_group() {
		return post_group;
	}


	public void setPost_group(int post_group) {
		this.post_group = post_group;
	}


	public int getPost_step() {
		return post_step;
	}


	public void setPost_step(int post_step) {
		this.post_step = post_step;
	}


	public int getPost_indent() {
		return post_indent;
	}


	public void setPost_indent(int post_indent) {
		this.post_indent = post_indent;
	}
	
	
	
	
	
	

}
