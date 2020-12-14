package meeteat.service.matefind.face;

import java.util.List;

import meeteat.dto.mateFindBoard.MateFindBoard;

public interface MateFindService {

	public List<MateFindBoard> list();

	public MateFindBoard mateFindView(MateFindBoard viewBoard);

	public void update(MateFindBoard mateFindBoard);

	public MateFindBoard read(MateFindBoard mateFindBoard);

	public void write(MateFindBoard mateFindBoard);

}
