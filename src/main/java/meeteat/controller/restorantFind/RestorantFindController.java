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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import meeteat.service.restorantFind.face.RestorantFindService;
import meeteat.util.GeoTrans;
import meeteat.util.GeoTransPoint;

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
   
   /**
    * 검색 값을 ajax로 받아와서 naver에 값을 넘겨주고, 반환값을 json형태로 돌려준다.
    * 
    * @param query_location - 검색한 지역 값이다.
    * @param query_food - 검색한 먹거리 값이다.
    * @param sort - 유사순으로 정렬할지 리뷰순으로 정렬할지에 대한 값이다.
    * @param resp - json으로 응답하기위한 HttpServletResponse값이다.
    */
   @RequestMapping(value = "/restorantfind/find", method = RequestMethod.POST)
   public void RestorantFindProc(
         String query_location
         ,String query_food
         ,String sort
         ,HttpServletResponse resp
         ) {
      
      //지도에 접근하기 위해 네이버 클라우드 플랫폼에서 받아온 ID와 비밀번호
        String clientId = "WfmT9jU_F810rHN9qdhX"; 
        String clientSecret = "4ZytAzgtN5"; 

        //만약 먹거리의 쿼리 부분이 빈 문자열이면 기본값인 "맛집"으로 바꿔준다
        if(query_food=="") {
           query_food="맛집";
        }
        
        //네이버에 넘겨줄 검색값을 완성한다.
        String query = query_location + " " + query_food;
        
        if(sort == null || sort =="")
           sort="random";
        
        String text = null;
        
        //텍스트를 UTF-8로 인코딩한다
        try {
            text = URLEncoder.encode(query, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }

        //인코딩한 텍스트를 바탕으로 네이버 서버에 넘겨줄 쿼리스트링을 완성한다.
        String apiURL = "https://openapi.naver.com/v1/search/local?"
                    + "display=5" //한번에 받아올 갯수이다. 로케이션 정보의 경우 네이버 정책 상 기본으로 5개만 제공받는다.
                    + "&query=" + text //네이버에 넘겨줄 검색 값
                    + "&sort=" + sort; //유사순, 리뷰순 정렬할지 확인

        
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        //위에서 만든 쿼리스트링과 아이디, 비밀번호를 이용해 서버에서 String으로 구성된 데이터들을 받는다.
        //해당 데이터는 json형식의 String 값이다.
        String responseBody = restorantFindService.get(apiURL,requestHeaders);

        //응답객체를 타입을 json형태의 view로 설정한다.  
        resp.setContentType("application/json; charset=utf-8");
        try {
           //out스트림을 통해 json view를 다시 ajax 응답값으로 넘겨준다. 
         PrintWriter out = resp.getWriter();
         out.print(responseBody);
      } catch (IOException e) {
         e.printStackTrace();
      }
        
   }
   
   /**
    * ajax로 받은 쿼리로 네이버 블로그 검색값을 네이버 서버에서 받아와 응답해준다.
    * 
    * @param location - 검색한 location 값이다. restorantName으로만 검색하면 체인점의 경우 원하는 식당의 검색값을 얻지 못하므로, 지역값도 함께 검색해야한다. 
    * @param retorantName - 검색할 식당의 이름이다.
    * @param start - 몇번째 페이지부터 값을 불러올지에대한 정보이다. (display(한번에 불러올 리스트 수)값이 5라면 2번째 페이지는 6부터 시작한다.)
    * @param resp
    */
   @RequestMapping(value = "/restorantfind/blogSearch_ajax_view")
   public void RestortanFindBlogSearch(
         String location
         ,String retorantName
         ,String start
         ,HttpServletResponse resp
         ) {
      
        String clientId = "WfmT9jU_F810rHN9qdhX"; 
        String clientSecret = "4ZytAzgtN5"; 

        //네이버에 넘겨줄 검색값을 만든다.
        String query = location + " " + retorantName;
        
        
        String text = null;
        
        //검색값을 UTF-8인코딩 타입으로 변환한다.
        try {
            text = URLEncoder.encode(query, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }

        //네이버에 전달할 쿼리스트링을 만든다
        String apiURL = "https://openapi.naver.com/v1/search/blog?"
                    + "start="+start
                    + "&display=5"
                    + "&query=" + text;

        
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        //네이버에 쿼리스트링과 아이디 비밀번호값을 전달하여 json형식의 String값을 응답받는다.
        String responseBody = restorantFindService.get(apiURL,requestHeaders);

        //응답객체를 타입을 json형태의 view로 설정한다.
        resp.setContentType("application/json; charset=utf-8");
        try {//out 스트림을 이용하여 json view를 ajax의 응답값으로 전달한다.
         PrintWriter out = resp.getWriter();
         out.print(responseBody);
      } catch (IOException e) {
         e.printStackTrace();
      }
        
   }
   
   /**
    * 네이버 location검색으로 받아온 카텍좌표계를 
    * 네이버 지도에서 사용할 수 있는 경위도 좌표로 변환하여 반환해준다.
    * 
    * @param mapx - 카텍좌표계 형식으로 되어있는 x좌표값이다.
    * @param mapy - 카텍좌표계 형식으로 되어있는 y좌표값이다.
    * @param model
    * @return
    */
   @RequestMapping(value = "/restorantfind/map_ajax_view")
   public String getRestorantMap(
         int mapx
         ,int mapy
         ,Model model
         ) {
      
      //인터넷에서 떠도는 오픈소스인 클래스를 사용하였다.
      //해당 클래스에서 convert 메소드를 이용하여 카텍좌표를 경위도 좌표로 변환해준다
      GeoTransPoint katecCoordinates = new GeoTransPoint(mapx,mapy);
      GeoTransPoint TransforCoordinates = GeoTrans.convert(GeoTrans.KATEC, GeoTrans.GEO, katecCoordinates);

      double longitude = TransforCoordinates.getX();
      double latitude = TransforCoordinates.getY();
      
      //네이버 지도에서는 소수점 아래 7자리까지만 경위도 좌표를 쓰므로, 
      //경위도 좌표를 해당 위치까지만 표기하도록 바꾼다.
      String.format("%.7f", longitude);
      String.format("%.7f", latitude);
      
      model.addAttribute("mapx",String.format("%.7f", longitude));
      model.addAttribute("mapy",String.format("%.7f", latitude));
      
      //ajax의 응답으로 쓰일 html인 /restorantfind/map_ajax_view.jsp로 이동시킨다.
      //해당 html을 ajax의 응답값으로 사용한다.
      return null;
   }
   
   
   
}