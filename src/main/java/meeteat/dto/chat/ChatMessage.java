package meeteat.dto.chat;

public class ChatMessage {

	private int chatRoomNo;
	private String type;
	private int writer;
	private String msg;
	private String msgDate;
	@Override
	public String toString() {
		return "ChatMessage [chatRoomNo=" + chatRoomNo + ", type=" + type + ", writer=" + writer + ", msg=" + msg
				+ ", msgDate=" + msgDate + "]";
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
	public String getMsgDate() {
		return msgDate;
	}
	public void setMsgDate(String msgDate) {
		this.msgDate = msgDate;
	}
}
