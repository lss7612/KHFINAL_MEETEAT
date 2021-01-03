package meeteat.dao.main.face;

import java.util.HashMap;
import java.util.List;

public interface MainDao {

	public List<HashMap<String, Object>> getPopularList();

	public List<HashMap<String, Object>> getMostViewList();

	public int getTotalUserCnt();

	public int getAppointmentCnt();

}
