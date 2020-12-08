package meeteat.controller.recruitBoard;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import meeteat.service.recruitBoard.face.ImageService;

@Controller
public class ImageController {

	private static final Logger logger = LoggerFactory.getLogger(ImageController.class);
	@Autowired ImageService imageService;
	
	
	@RequestMapping(value = "/recruitboard/saveTmpFile_ajax")
	public @ResponseBody HashMap<String,Object> saveTmpFile(
			MultipartFile img1
			,MultipartFile img2
			,MultipartFile img3
			,HttpSession session
			) {
		
		String user_no = ""+ session.getAttribute("user_no");
		logger.info(""+img1);
		logger.info(""+img2);
		logger.info(""+img3);
		if(img1!=null) {
			if(img1.getSize()!=0)
				logger.info(img1.getOriginalFilename());
		}
		if(img1!=null) {
			if(img2.getSize()!=0)
				logger.info(img2.getOriginalFilename());
		}
		if(img1!=null) {
			if(img3.getSize()!=0)
				logger.info(img3.getOriginalFilename());
		}
		
		logger.info("saveTmpFile_ajax - [GET]");
		
		HashMap<String,Object> param = new HashMap<String, Object>();
		
		HashMap<String,Object> result = new HashMap<String, Object>();
		result = imageService.saveTempFile(img1, img2, img3, user_no);
		
		return result;
	}
	
}
