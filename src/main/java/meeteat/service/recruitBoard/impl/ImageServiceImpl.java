package meeteat.service.recruitBoard.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import meeteat.dao.recruitBoard.face.ImageDao;
import meeteat.service.recruitBoard.face.ImageService;

@Service
public class ImageServiceImpl implements ImageService{

	private static final Logger logger = LoggerFactory.getLogger(ImageServiceImpl.class);
	
	@Autowired ServletContext context;
	@Autowired ImageDao imageDao;
	
	@Override
	public HashMap<String,Object> saveTempFile(MultipartFile img1, MultipartFile img2, MultipartFile img3, String user_no) {

		HashMap<String,Object> result = new HashMap<>();
		
		String storedPath = context.getRealPath("resources/file/recruitboard/tmp");
		logger.info("realPath : " + storedPath);
		
		//디렉토리폴더 지정
		File stored = new File(storedPath);
		if(!stored.exists()) {
			stored.mkdir();
		}
		
		
		//각각의 파일들을 받을 인스턴스 생성
		if(img1!=null) {
			if(img1.getSize()!=0) {
				int position = img1.getOriginalFilename().lastIndexOf(".");
				String ext = img1.getOriginalFilename().substring(position);
				String filename01 = "user_"+ user_no + "_recruitImg01"+	ext ;
				logger.info(filename01);
				result.put("StoredPath01","/resources/file/recruitboard/tmp/"+filename01);
				result.put("ext01", ext);
				
				File temp01 = new File(stored,filename01);
				
				try {
					img1.transferTo(temp01);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		if(img2!=null) {
			if(img2.getSize()!=0) {
				int position = img2.getOriginalFilename().lastIndexOf(".");
				String ext = img2.getOriginalFilename().substring(position);
				String filename02 = "user_"+ user_no + "_recruitImg02"+	ext ;
				logger.info(filename02);
				result.put("StoredPath02","/resources/file/recruitboard/tmp/"+filename02);
				result.put("ext02", ext);
				File temp02 = new File(stored,filename02);
				
				try {
					img2.transferTo(temp02);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
			}
		}
		
		if(img3!=null) {
			if(img3.getSize()!=0) {
				int position = img3.getOriginalFilename().lastIndexOf(".");
				String ext = img3.getOriginalFilename().substring(position);
				String filename03 = "user_"+ user_no + "_recruitImg03"+	ext ;
				logger.info(filename03);
				result.put("StoredPath03","/resources/file/recruitboard/tmp/"+filename03);
				result.put("ext03", ext);
				File temp03 = new File(stored,filename03);
				
				try {
					img3.transferTo(temp03);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		
		return result;
		
	}

	@Override
	public void saveFile(
			HttpSession session
			,String ext01
			,String ext02
			,String ext03
			,String board_no
			,String article_no) {

		String user_no = ""+session.getAttribute("user_no");
		String tmpPath = context.getRealPath("resources/file/recruitboard/tmp");
		String savePath = context.getRealPath("resources/file/recruitboard/save/");
		
		String tmpFile01Path = tmpPath+"/user_"+user_no+"_recruitImg01"+ext01;
		String tmpFile02Path = tmpPath+"/user_"+user_no+"_recruitImg02"+ext02;
		String tmpFile03Path = tmpPath+"/user_"+user_no+"_recruitImg03"+ext03;
		
		//tmp파일을 각각 변수에 저장
		File tmp01 = new File(tmpFile01Path);
		File tmp02 = new File(tmpFile02Path);
		File tmp03 = new File(tmpFile03Path);

		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		
		String val = sdf.format(now);
		
		//저장이름만들기
		String saveName01 = user_no+val+"01"+ext01;
		String saveName02 = user_no+val+"02"+ext02;
		String saveName03 = user_no+val+"03"+ext03;
		
		
		//tmp파일 각각을 파일 입출력 스트림을 이용해 save할 directory에 저장이름으로 복사 
		if(tmp01.exists()) {
			File save01 = new File(savePath, saveName01);
			try {
				FileInputStream fis = new FileInputStream(tmp01);
				FileOutputStream fos = new FileOutputStream(save01);
				
				int fileByte = 0; 
	            // fis.read()가 -1 이면 파일을 다 읽은것
	            while((fileByte = fis.read()) != -1) {
	                fos.write(fileByte);
	            }
	            fis.close();
				fos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("article_no", article_no);
			param.put("board_no", board_no);
			param.put("file_originname", tmp01.getName());
			param.put("file_storedname", saveName01);
			
			logger.info("첫번쨰파일 저장합니다!");
			logger.info(saveName01);
			
			imageDao.saveFile(param);

			
		}
		
		if(tmp02.exists()) {
			File save02 = new File(savePath, saveName02);
			try {
				FileInputStream fis = new FileInputStream(tmp02);
				FileOutputStream fos = new FileOutputStream(save02);
				
				int fileByte = 0; 
	            // fis.read()가 -1 이면 파일을 다 읽은것
	            while((fileByte = fis.read()) != -1) {
	                fos.write(fileByte);
	            }
	            fis.close();
				fos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("article_no", article_no);
			param.put("board_no", board_no);
			param.put("file_originname", tmp02.getName());
			param.put("file_storedname", saveName02);
			
			logger.info("두번째파일 저장합니다!");
			logger.info(saveName02);
			
			imageDao.saveFile(param);
			
		}
		if(tmp03.exists()) {
			File save03 = new File(savePath, saveName03);
			try {
				FileInputStream fis = new FileInputStream(tmp03);
				FileOutputStream fos = new FileOutputStream(save03);
				
				int fileByte = 0; 
	            // fis.read()가 -1 이면 파일을 다 읽은것
	            while((fileByte = fis.read()) != -1) {
	                fos.write(fileByte);
	            }
				fis.close();
				fos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				
			}
			
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("article_no", article_no);
			param.put("board_no", board_no);
			param.put("file_originname", tmp03.getName());
			param.put("file_storedname", saveName03);
			
			logger.info("세번째파일 저장합니다!");
			logger.info(saveName03);
			
			imageDao.saveFile(param);
			
		}
		
		tmp01.delete();
		tmp02.delete();
		tmp03.delete();
		
	}

	@Override
	public void deleteFile(String board_no, String article_no) {

		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("board_no", board_no);
		param.put("article_no", article_no);
		
		imageDao.deleteFile(param);
		
	}

	
	
	
	
	
	
}
