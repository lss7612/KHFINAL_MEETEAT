package meeteat.controller.chat;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/chat")
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@RequestMapping(value="/create")
	public String createChat(@RequestParam(value="user_no") int user1, HttpSession session, Model model) {
		session.getAttribute("user_no");
		logger.info("대화 상대 : "+user1);
		logger.info("대화 상대 : "+session.getAttribute("user_no"));
		
		return "redirect:/chat/room";
	}
	
}
