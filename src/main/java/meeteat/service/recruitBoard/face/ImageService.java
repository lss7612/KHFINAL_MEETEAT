package meeteat.service.recruitBoard.face;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface ImageService {

	public HashMap<String,Object> saveTempFile(MultipartFile img1, MultipartFile img2, MultipartFile img3, String user_no);

	public void saveFile(HttpSession session,String ext01,String ext02,String ext03, String board_no, String article_no);

	public void deleteFile(String board_no, String article_no);

}
