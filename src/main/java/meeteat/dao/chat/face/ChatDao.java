package meeteat.dao.chat.face;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;


public interface ChatDao {

	public List<HashMap<String, Integer>> findChatRoom(
		@Param("user0") int user0, @Param("user1") int user1);

}
