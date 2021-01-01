package meeteat.service.main.face;

import java.util.HashMap;
import java.util.List;

public interface MainService {

	public List<HashMap<String, Object>> getPopularList();

	public List<HashMap<String, Object>> getMostViewList();

	public int getTotalUserCnt();

	public int getAppointmentCnt();

}
