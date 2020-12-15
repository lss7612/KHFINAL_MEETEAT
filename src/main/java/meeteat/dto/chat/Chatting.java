package meeteat.dto.chat;

public class Chatting {

	private int chatting_no;
	private int user_total;
	
	@Override
	public String toString() {
		return "chatting [chatting_no=" + chatting_no + ", user_total=" + user_total + "]";
	}
	public int getChatting_no() {
		return chatting_no;
	}
	public void setChatting_no(int chatting_no) {
		this.chatting_no = chatting_no;
	}
	public int getUser_total() {
		return user_total;
	}
	public void setUser_total(int user_total) {
		this.user_total = user_total;
	}
}
