package meeteat.dao.matefind.face;

import java.util.List;

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

}
