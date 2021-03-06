package meeteat.service.main.face;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface MainService {

	public List<HashMap<String, Object>> getPopularList();

	public List<HashMap<String, Object>> getMostViewList();

	public int getTotalUserCnt();

	public int getAppointmentCnt();

	public void saveTempImg(MultipartFile previewImg);

	public void deleteTempImg();

	public void deleteMainImage();

	public void moveTempFileToMainFile();

	public Boolean isTempFileExist();

}
