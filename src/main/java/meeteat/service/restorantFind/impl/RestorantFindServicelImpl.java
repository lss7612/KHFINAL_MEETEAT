package meeteat.service.restorantFind.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

import org.springframework.stereotype.Service;

import meeteat.service.restorantFind.face.RestorantFindService;

@Service
public class RestorantFindServicelImpl implements RestorantFindService{

   @Override
   public String get(String apiURL, Map<String, String> requestHeaders) {
       HttpURLConnection con = connect(apiURL);
           try {
               con.setRequestMethod("GET");
               for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                   con.setRequestProperty(header.getKey(), header.getValue());
               }

               int responseCode = con.getResponseCode();
               if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                   return readBody(con.getInputStream());
               } else { // 에러 발생
                   return readBody(con.getErrorStream());
               }
           } catch (IOException e) {
               throw new RuntimeException("API 요청과 응답 실패", e);
           } finally {
               con.disconnect();
           }
   }

   private HttpURLConnection connect(String apiURL) {
      try {
            URL url = new URL(apiURL);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiURL, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiURL, e);
        }
   }

   private String readBody(InputStream body) {
      
      InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
           
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
            
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
      
   }
   
   
   

}