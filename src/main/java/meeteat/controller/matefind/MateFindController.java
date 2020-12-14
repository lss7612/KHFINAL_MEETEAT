package meeteat.controller.matefind;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import meeteat.dto.mateFindBoard.MateFindBoard;
import meeteat.dto.user.User;
import meeteat.service.login.face.LoginService;
import meeteat.service.matefind.face.MateFindService;

@Controller
@RequestMapping(value = "/matefind")
public class MateFindController {
	
	private static final Logger logger = LoggerFactory.getLogger(MateFindController.class);
	
	@Autowired MateFindService mateFindService;
	@Autowired LoginService loginService;

	@RequestMapping(value = "/list")
	public void mateFindList(Model model) {
		
		List<MateFindBoard> mateFindList = mateFindService.list();
		
		model.addAttribute("mateFindList", mateFindList);
		
	}
	
	
	@RequestMapping(value = "/view")
	public String mateFindView(MateFindBoard viewBoard, Model model) {
		
		if(viewBoard.getArticle_no() < 1) {
			return "redirect:/matefind/list";
		}
		
		viewBoard = mateFindService.mateFindView(viewBoard);
		model.addAttribute("view", viewBoard);
		
		viewBoard.setMate_list(viewBoard.getMate_list().replaceAll(" ", ""));
		
		String[] list = viewBoard.getMate_list().split(",");
		int[] guestList = new int[list.length];
		
		List<User> userList = new ArrayList<>();

		for(int i = 0; i < list.length; i++) {
			
			guestList[i] = Integer.valueOf(list[i]);
			
			User user = new User();
			user.setUser_no(guestList[i]);
			
			userList.add(loginService.selectUserByUserNo(user));
			
		}
		
		User user = new User();
		user.setUser_no(viewBoard.getUser_no());
		model.addAttribute("hostInfo", loginService.selectUserByUserNo(user));
		model.addAttribute("guestList", guestList);
		model.addAttribute("guestUserList", userList);
		
		return "matefind/view";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void mateFindUpdate(MateFindBoard mateFindBoard, Model model) {
		
		mateFindBoard = mateFindService.read(mateFindBoard);
		
		model.addAttribute("view", mateFindBoard);
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String mateFindUpdateProcess(MateFindBoard mateFindBoard) {
		
		Date revision_date = new Date();
		
		mateFindBoard.setRevision_date(revision_date);
		
		mateFindService.update(mateFindBoard);
		
		return "redirect:/matefind/view?article_no=" + mateFindBoard.getArticle_no();
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void mateFindWrite() {
		
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String mateFindWriteProcess(MateFindBoard mateFindBoard, HttpSession session) {
		
		mateFindBoard.setUser_no((int)session.getAttribute("user_no"));
		
		System.out.println("===========================");
		logger.info(mateFindBoard.getCategory());
		logger.info(mateFindBoard.getParty_location());
		logger.info(mateFindBoard.getMeet_time());
		System.out.println("===========================");
		
		String mateTimeStr = mateFindBoard.getMeet_time();
		mateTimeStr = mateTimeStr.replaceAll("-", "");
		mateTimeStr = mateTimeStr.replaceAll("T", "");
		mateTimeStr = mateTimeStr.replaceAll(":", "");
		logger.info(mateTimeStr);
		
		mateFindBoard.setMeet_time(mateTimeStr);
		
		mateFindService.write(mateFindBoard);
		
		return "redirect:/matefind/list";
		
	}
	
	@RequestMapping(value = "/attend")
	public void mateFindAttend() {
		
		
	}
	

	
	
}
