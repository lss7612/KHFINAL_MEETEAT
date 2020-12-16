package meeteat.controller.restorantFind;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import meeteat.service.restorantFind.face.RestorantFindService;

@Controller
public class RestorantFindController {

	@Autowired RestorantFindService restorantFindService;
	
	@RequestMapping(value = "/restorantfind/ex01")
	public void RestorantFind01Ex() {}
	@RequestMapping(value = "/restorantfind/ex02")
	public void RestorantFind02Ex() {}
	@RequestMapping(value = "/restorantfind/ex03")
	public void RestorantFind03Ex() {}
	@RequestMapping(value = "/restorantfind/ex04")
	public void RestorantFind04Ex() {}
	@RequestMapping(value = "/restorantfind/ex05")
	public void RestorantFind05Ex() {}
	@RequestMapping(value = "/restorantfind/ex06")
	public void RestorantFind06Ex() {}
	@RequestMapping(value = "/restorantfind/ex07")
	public void RestorantFind07Ex() {}
	@RequestMapping(value = "/restorantfind/ex08")
	public void RestorantFind08Ex() {}
	
	
	@RequestMapping(value = "/restorantfind/find", method = RequestMethod.GET)
	public void RestorantFind() {}
	
	@RequestMapping(value = "/restorantfind/find", method = RequestMethod.POST)
	public void RestorantFindProc(
			String query
			,String sort
			,HttpServletResponse resp
			) {
		
        String clientId = "WfmT9jU_F810rHN9qdhX"; 
        String clientSecret = "4ZytAzgtN5"; 

        
        if(sort == null || sort =="")
        	sort="random";
        
        String text = null;
        
        try {
            text = URLEncoder.encode(query, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }

        String apiURL = "https://openapi.naver.com/v1/search/local?"
        				+ "display=5"
        				+ "&query=" + text 
        				+ "&sort=" + sort;

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = restorantFindService.get(apiURL,requestHeaders);

        
        resp.setContentType("application/json; charset=utf-8");
        try {
			PrintWriter out = resp.getWriter();
			out.print(responseBody);
		} catch (IOException e) {
			e.printStackTrace();
		}
        
	}
	
	
	
}
