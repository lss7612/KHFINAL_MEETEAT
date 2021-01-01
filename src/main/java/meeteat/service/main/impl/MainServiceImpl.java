package meeteat.service.main.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.main.face.MainDao;
import meeteat.service.main.face.MainService;

@Service
public class MainServiceImpl implements MainService{

	@Autowired MainDao mainDao;
	
	@Override
	public List<HashMap<String, Object>> getPopularList() {
		return mainDao.getPopularList();
	}

	@Override
	public List<HashMap<String, Object>> getMostViewList() {
		return mainDao.getMostViewList();
	}

	@Override
	public int getTotalUserCnt() {
		return mainDao.getTotalUserCnt();
	}

	@Override
	public int getAppointmentCnt() {
		return mainDao.getAppointmentCnt();
	}

}
