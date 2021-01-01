package meeteat.dto.adminUser;

public class AdminUser {
	
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_nick;
	private String user_gender;
	private String user_age;
	private int user_blockcnt;
	private String user_email;
	private String user_profileorigin;
	private String user_profilestored;
	private int user_grade;
	
	@Override
	public String toString() {
		return "AdminUser [user_no=" + user_no + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_nick="
				+ user_nick + ", user_gender=" + user_gender + ", user_age=" + user_age + ", user_blockcnt="
				+ user_blockcnt + ", user_email=" + user_email + ", user_profileorigin=" + user_profileorigin
				+ ", user_profilestored=" + user_profilestored + ", user_grade=" + user_grade + "]";
	}

	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_age() {
		return user_age;
	}
	public void setUser_age(String user_age) {
		this.user_age = user_age;
	}
	public int getUser_blockcnt() {
		return user_blockcnt;
	}
	public void setUser_blockcnt(int user_blockcnt) {
		this.user_blockcnt = user_blockcnt;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_profileorigin() {
		return user_profileorigin;
	}
	public void setUser_profileorigin(String user_profileorigin) {
		this.user_profileorigin = user_profileorigin;
	}
	public String getUser_profilestored() {
		return user_profilestored;
	}
	public void setUser_profilestored(String user_profilestored) {
		this.user_profilestored = user_profilestored;
	}
	public int getUser_grade() {
		return user_grade;
	}
	public void setUser_grade(int user_grade) {
		this.user_grade = user_grade;
	}
	

}
