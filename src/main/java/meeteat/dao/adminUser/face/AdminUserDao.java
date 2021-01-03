package meeteat.dao.adminUser.face;

import java.util.HashMap;
import java.util.List;

import meeteat.dto.adminUser.UserSearch;
import meeteat.dto.user.User;
import meeteat.util.Paging;

public interface AdminUserDao {

	public int selectCntAll(UserSearch userSearch);

	public List<HashMap<String, String>> selectList(HashMap<String, Object> listmap);

	public void userGradeUpdate(int user_no);

}
