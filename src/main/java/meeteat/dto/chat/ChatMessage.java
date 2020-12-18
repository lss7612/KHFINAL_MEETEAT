package meeteat.dto.chat;

public class ChatMessage {

	private int chatRoomNo;
	private String type;
	private int writer;
	private String msg;
	@Override
	public String toString() {
		return "ChatMessage [chatRoomNo=" + chatRoomNo + ", type=" + type + ", writer=" + writer + ", msg=" + msg + "]";
	}
	public int getChatRoomNo() {
		return chatRoomNo;
	}
	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}
