package meeteat.service.main.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import meeteat.dao.main.face.MainDao;
import meeteat.service.main.face.MainService;

@Service
public class MainServiceImpl implements MainService{

	@Autowired MainDao mainDao;
	@Autowired ServletContext context;

	private static Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);
	
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

	@Override
	public void saveTempImg(MultipartFile previewImg) {
		
		String storedPath = context.getRealPath("resources/img/main/membermain");
		logger.info("storedPath"+storedPath);
		
		//디렉토리폴더 지정
		File stored = new File(storedPath);
		if(!stored.exists()) {
			stored.mkdir();
		}
		
		File tempFile = new File(stored,"animatedbackImg_preview.jpg");
		try {
			previewImg.transferTo(tempFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		} 
		
	}

}
