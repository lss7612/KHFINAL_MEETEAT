package meeteat.service.chat.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.chat.face.ChatDao;
import meeteat.dto.chat.Chatting;
import meeteat.service.chat.face.ChatService;

@Service
public class ChatServiceImpl implements ChatService{

	private static final Logger logger = LoggerFactory.getLogger(ChatServiceImpl.class);
	@Autowired private ChatDao chatDao;
	
	@Override
	public List<HashMap<String, Integer>> findChatRoom(int user0, int user1) {
		return chatDao.findChatRoom(user0, user1);
	}
	
	@Override
	public String getChatId(int roomNum) {
		return chatDao.getChattingId(roomNum);
	}
	
	@Override
	public void createChatById(String chatting_id) {
		chatDao.insertChatById(chatting_id);
	}
	
	@Override
	public int getChatNumById(String chatting_id) {
		return chatDao.getChatNumById(chatting_id);
	}
	
	@Override
	public void insertUserToChatNum(int chatting_no, int user0) {
		chatDao.insertUserToChatNum(chatting_no, user0);
	}
	
	@Override
	public HashMap<String, Object> getChatRoomInfoById(String chatting_id) {
		return chatDao.getChatRoomInfoById(chatting_id);
	}
	
	@Override
	public List<HashMap<String, Object>> getChattingUserList(int chatting_no) {
		return chatDao.getChatUserListByChatNum(chatting_no);
	}
	
	@Override
	public List<HashMap<String,Object>> getJoinChatList(int user_no) {
		return chatDao.getUserJoinChatList(user_no);
	}
	
	@Override
	public HashMap<String, Object> getChatContentNewestAtRoom(int chatting_no) {
		return chatDao.getChatNewestContentAtRoom(chatting_no);
	}

	@Override
	public void saveMsg(int chatting_no, int user_no, String msg_content) {
		chatDao.insertMsgContent(chatting_no, user_no, msg_content);
	}
	
	@Override
	public String getUserNick(int user_no) {
		return chatDao.getUserNickByUserNo(user_no);
	}
	
	@Override
	public List<HashMap<String, Object>> getOldChatList(int chatting_no) {
		return chatDao.getOldChatByRoomNo(chatting_no);
	}
	
	@Override
	public boolean findJoinUser(int user_no, int chatting_no) {
		if( chatDao.findUserAtRoomByUserNo(user_no, chatting_no) > 0) {
			return false;
		}
		chatDao.joinChatRoomByUserNo(user_no, chatting_no);
		if( chatDao.findUserAtRoomByUserNo(user_no, chatting_no) > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean exitChatRoom(int user_no, int chatting_no) {
		if( chatDao.findUserAtRoomByUserNo(user_no, chatting_no) == 0) {
			logger.info("> > > 회원이 채팅방에 존재하지 않습니다. < < < ");
			return false;
		}
		chatDao.exitChatRoomByUserNo(user_no, chatting_no);
		if( chatDao.findUserAtRoomByUserNo(user_no, chatting_no) == 0) {
			logger.info("> > > 회원이 채팅방에서 나갔습니다. < < < ");
			return true;
		}
		return false;
	}
	
}
