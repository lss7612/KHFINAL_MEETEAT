package meeteat.dao.chat.face;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;


public interface ChatDao {

	/**
	 * 두명의 회원번호를 이용해 둘의 공통된 채팅방 검색
	 * @param user0 : 접속한 회원의 번호
	 * @param user1 : 상대 회원의 번호
	 * @return 채팅방 번호
	 */
	public List<HashMap<String, Integer>> findChatRoom(
		@Param("user0") int user0, @Param("user1") int user1);

	/**
	 * 채팅방번호로 채팅방ID구하기
	 * @param chatting_no : 채팅방 번호
	 * @return 채팅방ID
	 */
	public String getChattingId(@Param("chatting_no")int chatting_no);

	/**
	 * chatting_id를 이용해여 채팅방 생성하기
	 * @param chatting_id : 생성할 채팅방의 chatting_id
	 */
	public void insertChatById(String chatting_id);

	/**
	 * chatting_id로 채팅방 번호 검색
	 * @param chatting_id : 채팅방ID
	 * @return 채팅방 번호
	 */
	public int getChatNumById(String chatting_id);

	/**
	 * 채팅방에 회원 삽입하기
	 * @param chatting_no : 회원이 들어갈 채팅방 번호
	 * @param user_no : 채팅방에 참가할 회원 번호
	 */
	public void insertUserToChatNum(@Param("chatting_no")int chatting_no, @Param("user_no")int user_no);

	/**
	 * chatting_id로 채팅방 정보 조회해서 가져오기
	 * @param chatting_id : 조회할 채팅방의 chatting_id
	 * @return tb_chatting2의 정보
	 */
	public HashMap<String, Object> getChatRoomInfoById(String chatting_id);

	/**
	 * 채팅방 번호로 채팅참여자 목록 갖고오기
	 * @param chatting_no : 조회할 채팅방 번호
	 * @return 참여자 목록
	 */
	public List<HashMap<String, Object>> getChatUserListByChatNum(int chatting_no);

	/**
	 * 회원번호가 속한 채팅방 조회
	 * @param user_no : 접속된 회원의 회원 번호
	 * @return 채팅 목록
	 */
	public List<HashMap<String,Object>> getUserJoinChatList(int user_no);

	/**
	 * 채팅방의 최신 메시지 내용을 조회
	 * @param chatting_no : 조회할 채팅방 번호
	 * @return 채팅방 채팅 정보
	 */
	public HashMap<String, Object> getChatNewestContentAtRoom(int chatting_no);

	/**
	 * 채팅 메시지지를 db에 저장한다.
	 * @param chatting_no : 저장할 채팅 번호
	 * @param user_no : 작성자
	 */
	public void inserMsgContent(@Param("chatting_no")int chatting_no, @Param("user_no")int user_no, @Param("msg_content")String msg_content);

	/**
	 * 회원 벙호로 해당 회원의 닉네임 얻어오기
	 * @param user_no : 회원 번호
	 * @return 회원의 닉네임
	 */
	public String getUserNickByUserNo(int user_no);

}
