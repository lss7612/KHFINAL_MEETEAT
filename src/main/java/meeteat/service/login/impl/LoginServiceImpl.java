package meeteat.service.login.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.login.face.LoginDao;
import meeteat.dto.user.User;
import meeteat.service.login.face.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired private LoginDao loginDao;
	
	@Override
	public boolean login(User user) {
		
		int loginCheck = loginDao.login(user);
		
		if(loginCheck > 0) {
			return true;
		} else {
			return false;
		}
		
	}
	
	@Override
	public User selectUser(User user) {
		
		return loginDao.selectUser(user);
	}
	
	@Override
	public User selectUserByUserNo(User user) {
		
		return loginDao.selectUserByUserNo(user);
	}

}
