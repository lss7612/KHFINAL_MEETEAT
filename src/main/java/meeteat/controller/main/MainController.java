package meeteat.controller.main;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import meeteat.service.main.face.MainService;

@Controller
public class MainController {
	
	private static Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired MainService mainService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainPage(
			HttpSession session
			,Model model
			) {
		
		if(session.getAttribute("isLogin")==null || session.getAttribute("isLogin")=="") return "/main/main";
		
		List<HashMap<String,Object>> popularList = mainService.getPopularList();
		model.addAttribute("popularList",popularList);
		
		List<HashMap<String,Object>> mostViewList = mainService.getMostViewList();
		model.addAttribute("mostViewList",mostViewList);
		
		
		//cntUsers 처리
		int cntUsers = mainService.getTotalUserCnt();
		model.addAttribute("cntUsers",cntUsers);
		
		
		String cntUsers_str = ""+cntUsers;
		ArrayList<String> cntUsers_arr = new ArrayList<String>(); 
		
		if(cntUsers>=10) {
			for(int i=0; i<cntUsers_str.length();i++) {
				cntUsers_arr.add(i, cntUsers_str.substring(i, i+1));
			}
		} else {
			cntUsers_arr.add(0,cntUsers_str);
		}
		
		
		
		model.addAttribute("cntUsers_arr",cntUsers_arr);
		
		
		int userBoxCnt = 0;
		
		for(int i = 0; i < 10; i++) {
			if(cntUsers / (int) (Math.pow(10, i)) <= 0) {
				userBoxCnt = i;
				break;
			}
		}
		model.addAttribute("userBoxCnt",userBoxCnt);
		
		
		//cntAppointment 처리
		int cntAppointment = mainService.getAppointmentCnt();
		logger.info("확인 cntAppintment : " + cntAppointment);
		
		model.addAttribute("cntAppointment",cntAppointment);
		
		String cntAppointment_str = ""+cntAppointment;
		logger.info("확인 length : " + cntAppointment_str.length());	
		ArrayList<String> cntAppointment_arr = new ArrayList<String>(); 
		for(int i=cntAppointment_str.length(), j=0; i>0;i--) {
			logger.info(j+"번째에는 i가"+i+"입니다");
			logger.info(cntAppointment_str.substring(i-1, i));
			cntAppointment_arr.add(j, cntAppointment_str.substring(i-1, i));
			j++;
		}
		model.addAttribute("cntAppointment_arr",cntAppointment_arr);
		
		int AppointmentBoxCnt=0;
		for(int i = 0; i < 10; i++) {
			if(cntAppointment / (int) (Math.pow(10, i)) <= 0) {
				AppointmentBoxCnt = i;
				break;
			}
		}
		model.addAttribute("AppointmentBoxCnt",AppointmentBoxCnt);
		
		
		return "/main/member";
	}
	
	@RequestMapping(value = "/admin/main/imgchange",method=RequestMethod.GET)
	public String mainImgChange() {
		
		return null;
	}
	
	@RequestMapping(value = "/admin/main/realimgchange",method=RequestMethod.GET)
	public String mainImgChangeProc() {
		
		mainService.deleteMainImage();
		mainService.moveTempFileToMainFile();
		mainService.deleteTempImg();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/main/memberpreview")
	public String mainPagePreview(
			Boolean isTempUploaded
			,Model model
			) {

		if(isTempUploaded != null) {
			if(isTempUploaded) {
				model.addAttribute("isTempUploaded",isTempUploaded);
			}
		}
		List<HashMap<String,Object>> popularList = mainService.getPopularList();
		model.addAttribute("popularList",popularList);
		
		List<HashMap<String,Object>> mostViewList = mainService.getMostViewList();
		model.addAttribute("mostViewList",mostViewList);
		
		return null;
	}
	
	@RequestMapping(value="/main/savepreviewimg")
	public @ResponseBody HashMap<String,Object> saveTempPreviewImg(
			MultipartFile previewImg
			) {
		HashMap<String,Object> result = new HashMap<String, Object>();
	
		Boolean isTempUploaded = false;
		
		result.put("waitSecond", 1);
		logger.info(""+previewImg);
		if(previewImg.getSize()!=0){
			double fileSize = previewImg.getSize();
			double waitSecond = fileSize / 1000000;
			Math.round(waitSecond);
			if(waitSecond<0) {
				waitSecond = 1;
			}
			waitSecond += 5;
			waitSecond = waitSecond*1000;
			result.put("waitSecond", waitSecond);
			
			mainService.deleteTempImg();
			mainService.saveTempImg(previewImg);
			isTempUploaded = true;
		}
		
		result.put("isTempUploaded", isTempUploaded);
		
		return result;
	}
	
	@RequestMapping(value = "/main/isTempFileExist")
	public @ResponseBody HashMap<String,Object> isTempFileExist() {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		Boolean isTempFileExist = mainService.isTempFileExist();
		result.put("isTempFileExist", isTempFileExist);
		
		return result;
		
	}
	
}
