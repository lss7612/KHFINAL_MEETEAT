package meeteat.service.myPage.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.myPage.face.MyPayDao;
import meeteat.dto.myPage.MyPay;
import meeteat.dto.user.User;
import meeteat.service.myPage.face.MyPayService;

@Service
public class MyPayServiceImpl implements MyPayService{
	
	@Autowired private MyPayDao myPayDao;

	@Override
	public void insertPayInfo(MyPay myPay) {
		myPayDao.insertPayInfo(myPay);
	}
	
	@Override
	public boolean payChk(int user_no) {
		if(myPayDao.payChk(user_no)>=1) {
			return true;
		}
		return false;	
		}
	
	@Override
	public void updateUser(int user_no) {
		myPayDao.updateUser(user_no);
	}
	
	@Override
	public void deletePayInfo(User user) {
		myPayDao.deletePayInfo(user);
	}
	
	@Override
	public void updateUserInfo(User user) {
		myPayDao.updateUserInfo(user);
	}
}
