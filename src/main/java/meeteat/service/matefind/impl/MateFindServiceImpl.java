package meeteat.service.matefind.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.matefind.face.MateFindDao;
import meeteat.dto.mateFindBoard.MateFindBoard;
import meeteat.service.matefind.face.MateFindService;

@Service
public class MateFindServiceImpl implements MateFindService {

	@Autowired MateFindDao mateFindDao;
	
	@Override
	public List<MateFindBoard> list() {
		
		return mateFindDao.selectList();
		
	}
	
	@Override
	public MateFindBoard mateFindView(MateFindBoard viewBoard) {
		
		mateFindDao.updateHit(viewBoard);
		
		return mateFindDao.selectByArticleNo(viewBoard);
	}
	
	@Override
	public void update(MateFindBoard mateFindBoard) {
		
	}
	
	@Override
	public MateFindBoard read(MateFindBoard mateFindBoard) {
		
		return mateFindDao.selectByArticleNo(mateFindBoard);
	}
	
	@Override
	public void write(MateFindBoard mateFindBoard) {
		
		mateFindDao.write(mateFindBoard);
		
	}
	
}
