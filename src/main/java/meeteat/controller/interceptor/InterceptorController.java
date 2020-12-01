package meeteat.controller.interceptor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InterceptorController {

	@RequestMapping(value = "/interceptor/adminfail")
	public void adminFail() {}
	
	@RequestMapping(value = "/interceptor/banfail")
	public void banFail() {}
	
	@RequestMapping(value = "/interceptor/loginfail")
	public void loginFail() {}
	
	@RequestMapping(value = "/interceptor/payfail")
	public void payFail() {}
	
}
