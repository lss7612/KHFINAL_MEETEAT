package meeteat.controller.adminUser;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import meeteat.controller.reviewBoard.ReviewController;
import meeteat.dto.adminUser.AdminUser;
import meeteat.dto.adminUser.UserSearch;
import meeteat.dto.user.User;
import meeteat.service.adminUser.face.AdminUserService;
import meeteat.util.Paging;

@Controller
public class AdminUserController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private AdminUserService adminUserService;
	
	@RequestMapping(value = "/admin/user/list")
	public void adminUserList(Paging curPage, Model model, HttpServletRequest request
				, AdminUser adminUser, UserSearch userSearch) {
		
		Paging paging = adminUserService.getPaging(curPage, userSearch);
		model.addAttribute("paging", paging);
		
		paging.setSearch(curPage.getSearch());
		paging.setKeyword(curPage.getKeyword());
		
		List<HashMap<String, String>> list = adminUserService.list(paging, adminUser, userSearch);
		model.addAttribute("list", list);
		model.addAttribute("userSearch", userSearch);
		
		String keyword = request.getParameter("keyword");
		String search = request.getParameter("search");
		
		AdminUser adminUserSearch = new AdminUser();
		
		if(keyword != null ) {
			if(search.equals("user_id")) { 
				adminUserSearch.setUser_id(keyword);
			} else if (search.equals("user_nick")) { 
				adminUserSearch.setUser_nick(keyword);
			} else if (search.equals("user_blockcnt")) { 
				adminUserSearch.setUser_blockcnt(Integer.parseInt(keyword));
			}  else if (search.equals("user_grade")) { 
				adminUserSearch.setUser_grade(Integer.parseInt(keyword));
			}
		}
		
	}

}
