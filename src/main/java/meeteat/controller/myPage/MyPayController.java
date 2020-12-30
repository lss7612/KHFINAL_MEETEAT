package meeteat.controller.myPage;

import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import meeteat.dto.myPage.MyPay;
import meeteat.dto.user.User;
import meeteat.service.myPage.face.MyPageService;
import meeteat.service.myPage.face.MyPayService;

@Controller
public class MyPayController {
	private static final Logger logger = LoggerFactory.getLogger(MyPayController.class);
	@Autowired private MyPayService myPayService;
	@Autowired MyPageService myPageService;
	
	@RequestMapping(value="/mypay/mypay")
	public void myPayGet(HttpSession session, Model model) {
		int user_no = Integer.parseInt(session.getAttribute("user_no").toString());

		//마이페이지 기본정보 조회
		Map<String, Object> userinfo = new HashMap<>();
		userinfo = myPageService.infoByNo(user_no);
		model.addAttribute("userinfo", userinfo);
	}
	
	@RequestMapping(value="/mypay/mypay", method=RequestMethod.POST)
	public void myPay(HttpServletRequest req
						,HttpServletResponse res
						,MyPay myPay
						, HttpSession session
						, Writer out
						, User user
						) {
		
		String imp_uid = req.getParameter("imp_uid");
		String merchant_uid = req.getParameter("merchant_uid");
		int user_no = Integer.parseInt(req.getParameter("buyer_name").toString());
		
		logger.info("imp_uid" + imp_uid);
		
		myPay.setImp_uid(imp_uid);
		myPay.setMerchant_uid(merchant_uid);
		myPay.setUser_no(user_no);
		
//		logger.info("mypay 정보---------" + myPay);
		
		myPayService.insertPayInfo(myPay);
		
//		return "mypay/paySuccess";
		
		boolean payChk = myPayService.payChk(user_no);
		if(payChk) {
			
//			logger.info("payCHk111111111111111111" + payChk);
			
			myPayService.updateUser(user_no);
			try {
				
				session.setAttribute("user_grade", 1);
				
				out.write("{\"result\":true}");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else {
			try {
				
//				logger.info("payChk222222222222222222222222" + payChk);
				out.write("{\"result\":false}");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		


	}
	
	@RequestMapping(value="/mypay/paySuccess")
	public void paySuccess() {};
	
	@RequestMapping(value="/mypay/payCancel")
	public void payCancel(HttpSession session, Model model) {		
		int user_no = Integer.parseInt(session.getAttribute("user_no").toString());

		logger.info("유저번호 : " + user_no);
		Map<String, Object> user = myPageService.infoByNo(user_no);

		logger.info("유저 정보 : " + user);

		model.addAttribute("u", user);
	}
	
	@RequestMapping(value="/mypay/payCancel" , method=RequestMethod.POST)
	public String payCancelProc(User user, HttpSession session, Model model) {
		
		boolean pwChk = myPageService.pwChk(user);
		
		model.addAttribute("pwChk", pwChk);

		if(pwChk) {
			
			myPayService.deletePayInfo(user);
			
			myPayService.updateUserInfo(user);
			
			session.setAttribute("user_grade", 2);

			//메인으로 돌아가기
			return "redirect:/mypage/mypage";
		}else {

			return "redirect:/mypage/mypage";
		}
	}

}
