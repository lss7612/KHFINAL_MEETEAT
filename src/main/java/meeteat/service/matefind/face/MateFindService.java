package meeteat.service.matefind.face;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import meeteat.dto.mateFindBoard.MateFindBoard;
import meeteat.dto.mateFindBoard.Paging;
import meeteat.dto.mateFindBoard.Recommend;

public interface MateFindService {

//	public List<HashMap<String, String>> list(Paging paging);

	public MateFindBoard mateFindView(MateFindBoard viewBoard);

	public void update(MateFindBoard mateFindBoard);

	public MateFindBoard read(MateFindBoard mateFindBoard);

	public void write(MateFindBoard mateFindBoard);

	public void insertAttend(Recommend recommend);

	public boolean hasData(Recommend recommend);

	public void deleteAttend(Recommend recommend);

	public Paging getPaging(Paging curPage);

	public Paging getFilterPaging(Paging curPage, HashMap<String, Object> pagingMap);

	public List<MateFindBoard> pagingList(Paging paging);

	public List<MateFindBoard> list();

	public List<MateFindBoard> attendUserInfo(MateFindBoard viewBoard);

	public int attendeeCount(MateFindBoard viewBoard);

	public List<Recommend> attendeeList(Recommend recommend);

	public List<MateFindBoard> filterList(MateFindBoard mateFindBoard);

	public List<MateFindBoard> filterListPaging(HashMap<String, Object> map);

	public void deleteMateFind(MateFindBoard mateFindBoard);

	public MateFindBoard boardSetByArticleNo(MateFindBoard viewBoard);

	public List<MateFindBoard> filterPagingList(HashMap<String, Object> map);

	public void writeWithFile(MateFindBoard mateFindBoard, MultipartFile fileupload);


}
