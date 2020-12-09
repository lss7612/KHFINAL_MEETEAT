package meeteat.dao.recruitBoard.face;

import java.util.HashMap;

public interface ImageDao {

	public void saveFile(HashMap<String, Object> param);

	public void modifyFile(HashMap<String, Object> param);

	public void deleteFile(HashMap<String, Object> param);

}
