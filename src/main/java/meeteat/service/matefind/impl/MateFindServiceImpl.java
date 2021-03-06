package meeteat.service.matefind.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import meeteat.dao.matefind.face.MateFindDao;
import meeteat.dto.mateFindBoard.MateFindBoard;
import meeteat.dto.mateFindBoard.Paging;
import meeteat.dto.mateFindBoard.Recommend;
import meeteat.dto.user.User;
import meeteat.service.matefind.face.MateFindService;

@Service
public class MateFindServiceImpl implements MateFindService {

	@Autowired MateFindDao mateFindDao;
	@Autowired ServletContext context;
	
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
	
//	@Override
//	public Paging getFilterPaging(Paging curPage, MateFindBoard mateFindBoard) {
//		
//		int totalCount = mateFindDao.selectCntFilterList(mateFindBoard);
//		
//		Paging paging = new Paging(totalCount, curPage.getCurPage());
//		
//		return paging;
//	}
	
	@Override
	public Paging getFilterPaging(Paging curPage, HashMap<String, Object> pagingMap) {
		
		int totalCount = mateFindDao.selectCntFilterList(pagingMap);
		
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
	public MateFindBoard boardSetByArticleNo(MateFindBoard viewBoard) {
		
		return mateFindDao.selectByArticleNo(viewBoard);
	}
	
	
	@Override
	public void update(MateFindBoard mateFindBoard) {
		
		mateFindDao.updateMateFindBoard(mateFindBoard);
		
	}
	
	@Override
	public void deleteMateFind(MateFindBoard mateFindBoard) {

		mateFindDao.deleteMateFind(mateFindBoard);
		
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
	public void writeWithFile(MateFindBoard mateFindBoard, MultipartFile fileupload) {
		
		//파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("resources/upload");	
		
		//폴더가 존재하지 않으면 생성하기
		File stored = new File(storedPath);
		if(!stored.exists()) {
			stored.mkdir();
		}
		//저장될 파일의 이름
		String filename = fileupload.getOriginalFilename();
		
		//UUID값 생성
		String uid = UUID.randomUUID().toString().split("-")[4];
//		logger.info(uid);
		
		//파일이름에 UUID 추가하기 (파일명 중복되지 않게 설정)
		filename += uid;
		
		//저장될 파일 정보 객체
		File dest = new File(stored, filename);
		
		try {
			//업로드된 파일 저장하기
			fileupload.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		String originName = fileupload.getOriginalFilename();
		String storedName = filename;
		
		meeteat.dto.mateFindBoard.File file = new meeteat.dto.mateFindBoard.File();
		
		file.setFile_originname(originName);
		file.setFile_storedname(storedName);
		file.setBoard_no(2);
		file.setArticle_no(mateFindBoard.getArticle_no());
		
		mateFindDao.writeWithFile(file);
		
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
	
	@Override
	public List<MateFindBoard> filterListPaging(HashMap<String, Object> map) {
		
		return mateFindDao.filterListPaging(map);

	}
	
	@Override
	public List<MateFindBoard> filterList(MateFindBoard mateFindBoard) {
		
		return mateFindDao.filterList(mateFindBoard);
	}
	
	@Override
	public List<MateFindBoard> filterPagingList(HashMap<String, Object> map) {
		
		return mateFindDao.filterPagingList(map);
		
	}
	
	
}
