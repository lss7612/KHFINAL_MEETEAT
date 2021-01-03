package meeteat.service.adminUser.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.adminUser.face.AdminUserDao;
import meeteat.dto.adminUser.AdminUser;
import meeteat.dto.adminUser.UserSearch;
import meeteat.dto.user.User;
import meeteat.service.adminUser.face.AdminUserService;
import meeteat.util.Paging;

@Service
public class AdminUserImpl implements AdminUserService {
	
	@Autowired
	AdminUserDao adminUserDao;

	@Override
	public Paging getPaging(Paging curPage, UserSearch userSearch) {
		
		int totalCount = adminUserDao.selectCntAll(userSearch);
		
		int listCount = 20;
		
		Paging paging = new Paging(totalCount, curPage.getCurPage(), listCount);
		
		return paging;
	}
	

	@Override
	public List<HashMap<String, String>> list(Paging paging, AdminUser adminUser, UserSearch userSearch) {
		
		HashMap<String, Object> listmap = new HashMap<>();
		
		listmap.put("startNo", paging.getStartNo());
		listmap.put("endNo", paging.getEndNo());
		listmap.put("user_keyword", userSearch.getUser_keyword());
		listmap.put("user_search", userSearch.getUser_search());
		
		List<HashMap<String, String>> adminresult = new ArrayList<>();
		
		adminresult = adminUserDao.selectList(listmap);
		
		return adminresult;
	}


	@Override
	public void userGradeSet(int user_no, int grade_no) {
		adminUserDao.userGradeUpdate(user_no, grade_no);
	}


}



















