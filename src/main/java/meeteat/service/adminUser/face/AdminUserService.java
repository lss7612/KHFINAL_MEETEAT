package meeteat.service.adminUser.face;

import java.util.HashMap;
import java.util.List;

import meeteat.dto.adminUser.AdminUser;
import meeteat.dto.adminUser.UserSearch;
import meeteat.dto.user.User;
import meeteat.util.Paging;

public interface AdminUserService {

	Paging getPaging(Paging curPage, UserSearch userSearch);

	List<HashMap<String, String>> list(Paging paging, AdminUser adminUser, UserSearch userSearch);

	public void userGradeSet(int user_no, int grade_no);

}
