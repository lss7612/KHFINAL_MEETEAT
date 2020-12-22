package meeteat.service.myPage.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.myPage.face.MyPageDao;
import meeteat.service.myPage.face.MyPageService;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired private MyPageDao myPageDao;
	
	@Override
	public Map<String, Object> infoByNo(int user_no) {
		return myPageDao.selectByNo(user_no);
	}
}
