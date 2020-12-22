package meeteat.service.matefind.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.matefind.face.MateFindDao;
import meeteat.dto.mateFindBoard.MateFindBoard;
import meeteat.dto.mateFindBoard.Paging;
import meeteat.dto.mateFindBoard.Recommend;
import meeteat.service.matefind.face.MateFindService;

@Service
public class MateFindServiceImpl implements MateFindService {

	@Autowired MateFindDao mateFindDao;
	
	@Override
	public List<MateFindBoard> list() {
		
//		return mateFindDao.selectList();
		
		return mateFindDao.selectListWithUser();
		
	}
	
//	@Override
//	public List<HashMap<String, String>> list(Paging paging) {
//		
//		HashMap<String, Object> param = new HashMap<>();
//		
//		
//		// TODO Auto-generated method stub
//		return null;
//	}
	
	@Override
	public Paging getPaging(Paging curPage) {
		
		int totalCount = mateFindDao.selectCntAll();
		
		Paging paging = new Paging(totalCount, curPage.getCurPage());
		
		return paging;
	}
	
	@Override
	public List<MateFindBoard> pagingList(Paging paging) {

		return mateFindDao.selectPagingList(paging);
	}
	
	@Override
	public MateFindBoard mateFindView(MateFindBoard viewBoard) {
		
		mateFindDao.updateHit(viewBoard);
		
		return mateFindDao.selectByArticleNo(viewBoard);
	}
	
	@Override
	public void update(MateFindBoard mateFindBoard) {
		
		mateFindDao.updateMateFindBoard(mateFindBoard);
		
	}
	
	@Override
	public MateFindBoard read(MateFindBoard mateFindBoard) {
		
		return mateFindDao.selectByArticleNo(mateFindBoard);
	}
	
	@Override
	public void write(MateFindBoard mateFindBoard) {
		
		mateFindDao.write(mateFindBoard);
		
	}
	
	@Override
	public void insertAttend(Recommend recommend) {

		mateFindDao.insertAttend(recommend);
		
	}
	
	@Override
	public void deleteAttend(Recommend recommend) {
		
		mateFindDao.deleteAttend(recommend);
		
	}
	
	@Override
	public boolean hasData(Recommend recommend) {
		
		if(mateFindDao.selectAttend(recommend) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public List<MateFindBoard> attendUserInfo(MateFindBoard viewBoard) {
		
		return mateFindDao.attendUserInfo(viewBoard);
	}
	
	@Override
	public int attendeeCount(MateFindBoard viewBoard) {
		
		return mateFindDao.attendeeCount(viewBoard);
	}
	
	@Override
	public List<Recommend> attendeeList(Recommend recommend) {
		return mateFindDao.attendeeList(recommend);
	}
	
	
}
