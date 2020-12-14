package meeteat.service.chat.face;

import java.util.HashMap;
import java.util.List;

public interface ChatService {

	/**
	 * 두명의 회원 번호로 개인 채팅방 조회하기
	 * @param user0 : 현재 접속한 회원의 회원 번호
	 * @param user1 : 대화 상대 회원 번호 
	 * @return : 채팅방 리스트
	 */
	public List<HashMap<String, Integer>> findChatRoom(int user0, int user1);

	/**
	 * 채팅방 번호로 채팅방 id구하기
	 * @param roomNum : 채팅방번호
	 * @return chatting_id
	 */
	public String getChatId(int roomNum);

	/**
	 * UUID로 만든 난수로 채팅방 개설하기
	 * @param chatting_id
	 */
	public void createChatById(String chatting_id);

	/**
	 * chatting_id로 개설된 채팅방 번호 갖고오기
	 * @param chatting_id
	 */
	public int getChatNumById(String chatting_id);

	/**
	 * chatting_no에 user0 참가시키기
	 * @param chatting_no : 참가할 채팅방 번호
	 * @param user0 : 참가할 회원 번호
	 */
	public void insertUserToChatNum(int chatting_no, int user0);

}
