package meeteat.service.main.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
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

	@Override
	public void deleteTempImg() {
		
		String storedPath = context.getRealPath("resources/img/main/membermain");
		File stored = new File(storedPath);
		File tempFile = new File(stored,"animatedbackImg_preview.jpg");
		tempFile.delete();
		
	}

	@Override
	public void deleteMainImage() {

		String storedPath = context.getRealPath("resources/img/main/membermain");
		File stored = new File(storedPath);
		File mainImg = new File(stored,"animatedbackImg.jpg");
		mainImg.delete();
		
	}

	@Override
	public void moveTempFileToMainFile() {

		String tempImgPath = context.getRealPath("resources/img/main/membermain");
		File temp = new File(tempImgPath+"/animatedbackImg_preview.jpg");
		File tempFile = new File(temp,"");
		
		String mainImgPath = context.getRealPath("resources/img/main/membermain");
		File main = new File(mainImgPath );
		File mainImg = new File(main,"/animatedbackImg.jpg");
		
		
		try {
			FileInputStream fis = new FileInputStream(tempFile);
			FileOutputStream fos = new FileOutputStream(mainImg);
			int fileByte = 0; 
            // fis.read()가 -1 이면 파일을 다 읽은것
            while((fileByte = fis.read()) != -1) {
                fos.write(fileByte);
            }
            fis.close();
			fos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	@Override
	public Boolean isTempFileExist() {
		
		String tempImgPath = context.getRealPath("resources/img/main/membermain");
		File temp = new File(tempImgPath+"/animatedbackImg_preview.jpg");

		
		
		return temp.exists();
	}

}
