package meeteat.controller.main;

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
		for(int i=0; i<cntUsers_str.length();i++) {
			cntUsers_arr.add(i, cntUsers_str.substring(i, i+1));
		}
		model.addAttribute("cntUsers_arr",cntUsers_arr);
		
		int userBoxCnt = 0;
		
		for(int i = 0; i < 9; i++) {
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
		for(int i = 0; i < 9; i++) {
			if(cntAppointment / (int) (Math.pow(10, i)) <= 0) {
				AppointmentBoxCnt = i;
				break;
			}
		}
		model.addAttribute("AppointmentBoxCnt",AppointmentBoxCnt);
		
		
		return "/main/member";
	}
	
}
