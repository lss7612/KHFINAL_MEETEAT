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

	/**
	 * chatting_id로 방정보 얻기
	 * @param chatting_id
	 * @return tb_chatting2의 정보
	 */
	public HashMap<String, Object> getChatRoomInfoById(String chatting_id);

	/**
	 * chatting_no로 속해있는 회원 정보 조회
	 * @param chatting_no : 조회할 채팅방 번호
	 * @return 회원 목록
	 */
	public List<HashMap<String, Object>> getChattingUserList(int chatting_no);

	/**
	 * 회원번호가 속한 채팅방 목록 조회
	 * @param user_no : 접속한 회원의 회원 번호
	 * @return 채팅 목록
	 */
	public List<HashMap<String,Object>> getJoinChatList(int user_no);

	/**
	 * 채팅방 번호로 최신 대화 갖고오기
	 * @param object 
	 * @param chatting_no : 조회할 채팅 방 번호
	 * @return 최신 메시지 내용
	 */
	public HashMap<String, Object> getChatContentNewestAtRoom(int msg_no, int chatting_no);

	/**
	 * 채팅 메시지를 DB에 저장한다.
	 * @param chatRoomNo : 채팅방 번호
	 * @param writer : 작성자
	 */
	public void saveMsg(int chatting_no, int user_no, String msg_content);

	/**
	 * 회원 번호로 회원의 닉네임 얻어오기
	 * @param user_no : 회원 번호
	 * @return : 회원 닉네임
	 */
	public String getUserNick(int user_no);

	/**
	 * 전달받은 채팅방 번호로 과거 대화 이력을 갖고온다.
	 * @param chatting_no : 채팅방번호
	 * @param enterMsgNum : 입장 메시지 번호
	 * @return : 과거 대화 이력
	 */
	public List<HashMap<String, Object>> getOldChatList(int chatting_no, int enterMsgNum);

	/**
	 * 채팅방 참여 여부 확인
	 * @param user_no : 회원번호 
	 * @return true(방 참여중) or false
	 */
	public boolean findJoinUser(int user_no, int chatting_no);

	/**
	 * 채팅방 나가기
	 * @param user_no : 회원 번호
	 * @return true or false
	 */
	public boolean exitChatRoom(int user_no, int chatting_no);

	/**
	 * MateFind에서 게시글 작성시 생성된 채팅방
	 * @param user_no : 방생성 회원
	 * @param chatting_name : 채팅방 이름
	 * @param chatting_id : 채팅방 고유  id
	 */
	public void createMateChatRoom(String chatting_name, String chatting_id);

	/**
	 * 입장 시점 구하기
	 * @param user_no : 회원번호
	 * @param chatting_no : 채팅방 번호
	 * @return : 입장 메시지 번호
	 */
	public HashMap getEnterMsgNo(int user_no, int chatting_no);

	/**
	 * 기존에 퇴장 이력 구하기
	 * @param user_no : 회원 번호
	 * @param chatting_no : 채팅방 번호
	 * @return : 퇴장 메시지 번호
	 */
	public HashMap getLeaveMsgNo(int user_no, int chatting_no);

	/**
	 * 회ㅏ원의 프로필 사진 갖고오기
	 * @param user_no : 해당회원
	 * @return : 프로필사진 저장 이름
	 */
	public String getProfileImg(int user_no);

	/**
	 * 채팅방 최근 정보 갖고오기
	 * @param msg_no : 기준 메시지 번호
	 * @param chatting_no : 채팅방 번호
	 * @return
	 */
	public HashMap<String, Object> getChatContentNewestAtRoomAtNoMsg(int msg_no, int chatting_no);

}
