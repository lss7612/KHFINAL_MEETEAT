package meeteat.dao.matefind.face;

import java.util.HashMap;
import java.util.List;

import meeteat.dto.mateFindBoard.File;
import meeteat.dto.mateFindBoard.MateFindBoard;
import meeteat.dto.mateFindBoard.Paging;
import meeteat.dto.mateFindBoard.Recommend;

public interface MateFindDao {

	public List<MateFindBoard> selectList();

	public MateFindBoard selectByArticleNo(MateFindBoard viewBoard);

	public void updateHit(MateFindBoard viewBoard);

	public void write(MateFindBoard mateFindBoard);

	public void insertAttend(Recommend recommend);

	public void updateMateFindBoard(MateFindBoard mateFindBoard);

	public void deleteAttend(Recommend recommend);

	public int selectAttend(Recommend recommend);

	public List<MateFindBoard> selectListWithUser();

	public List<MateFindBoard> selectPagingList(Paging paging);

	public int selectCntAll();

	public List<MateFindBoard> attendUserInfo(MateFindBoard viewBoard);

	public int attendeeCount(MateFindBoard viewBoard);

	public List<Recommend> attendeeList(Recommend recommend);

	public List<MateFindBoard> filterListPaging(HashMap<String, Object> map);

	public List<MateFindBoard> filterList(MateFindBoard mateFindBoard);

	public void deleteMateFind(MateFindBoard mateFindBoard);

	public int selectCntFilterList(HashMap<String, Object> pagingMap);

	public List<MateFindBoard> filterPagingList(HashMap<String, Object> map);

	public void writeWithFile(File file);

}
