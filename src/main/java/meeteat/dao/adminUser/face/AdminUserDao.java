package meeteat.dao.adminUser.face;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import meeteat.dto.adminUser.UserSearch;
import meeteat.dto.user.User;
import meeteat.util.Paging;

public interface AdminUserDao {

	public int selectCntAll(UserSearch userSearch);

	public List<HashMap<String, String>> selectList(HashMap<String, Object> listmap);

	public void userGradeUpdate(@Param("user_no")int user_no, @Param("grade_no")int grade_no);

}
