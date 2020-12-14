package meeteat.service.chat.face;

import java.util.HashMap;
import java.util.List;

public interface ChatService {

	public List<HashMap<String, Integer>> findChatRoom(int user0, int user1);

}
