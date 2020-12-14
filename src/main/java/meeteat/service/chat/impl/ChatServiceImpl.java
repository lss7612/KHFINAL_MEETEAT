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
	
}
