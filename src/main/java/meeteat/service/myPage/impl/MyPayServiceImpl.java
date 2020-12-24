package meeteat.service.myPage.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.myPage.face.MyPayDao;
import meeteat.service.myPage.face.MyPayService;

@Service
public class MyPayServiceImpl implements MyPayService{
	
	@Autowired private MyPayDao myPayDao;

}
