package meeteat.dao.matefind.face;

import java.util.List;

import meeteat.dto.mateFindBoard.MateFindBoard;

public interface MateFindDao {

	public List<MateFindBoard> selectList();

	public MateFindBoard selectByArticleNo(MateFindBoard viewBoard);

	public void updateHit(MateFindBoard viewBoard);

	public void write(MateFindBoard mateFindBoard);

}
