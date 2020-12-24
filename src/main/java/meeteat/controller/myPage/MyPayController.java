package meeteat.controller.myPage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jdk.nashorn.internal.ir.annotations.Reference;
import meeteat.service.myPage.face.MyPayService;

@Controller
public class MyPayController {
	private static final Logger logger = LoggerFactory.getLogger(MyPayController.class);
	@Autowired private MyPayService myPayService;
	
	@RequestMapping(value="/mypay/mypay")
	public void myPayGet() {}
	
	@RequestMapping(value="/mypay/mypay", method=RequestMethod.POST)
	public void myPay(@RequestParam String customer_uid,
						@RequestParam String buyer_email
						,@RequestParam String buyer_name) {
		logger.info("customer_uid : " + customer_uid);
		logger.info("buyer_email : " + buyer_email);
		logger.info("buyer_이름 : " + buyer_name);

	}
	
	@RequestMapping(value="/mypay/paySuccess")
	public void paySuccess() {};
	
	@RequestMapping(value="/mypay/payFail")
	public void payFail() {};
	
	@RequestMapping(value="/mypay/mypayReq")
	public void payReq() {}
}
