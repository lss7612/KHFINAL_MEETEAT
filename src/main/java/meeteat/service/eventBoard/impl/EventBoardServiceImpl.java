package meeteat.service.eventBoard.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.eventBoard.face.EventBoardDao;
import meeteat.dto.eventBoard.EventBoard;
import meeteat.dto.recruitBoard.SearchParam;
import meeteat.service.eventBoard.face.EventBoardService;
import meeteat.service.recruitBoard.face.ImageService;
import meeteat.util.Paging;

@Service
public class EventBoardServiceImpl implements EventBoardService {

	private static final Logger logger = LoggerFactory.getLogger(EventBoardServiceImpl.class);
	@Autowired EventBoardDao eventBoardDao;
	@Autowired ImageService imageService;
	
	
	@Override
	public Paging getHoldingPaging(String curPage_str, SearchParam searchParam) {
		
		int curPage = 0;
		if(curPage_str!=null || ("").equals(curPage_str))
			curPage = Integer.parseInt(curPage_str);
		
		searchParam.setSearchBoard_no(6);
		int totalCnt = eventBoardDao.selectCntHoldingListAll(searchParam);
		
		return new Paging(totalCnt, curPage, 10);
		
	}
	
	@Override
	public List<HashMap<String, Object>> getHoldingEventList(Paging paging, int board_no, SearchParam searchParam) {
		
		return eventBoardDao.getHoldingEventList();
		
	}

	@Override
	public void write(
			EventBoard param
			,HttpSession session
			,String ext01
			,String ext02
			,String ext03
			) {
		
		int article_no = eventBoardDao.getNextVal();
		param.setArticle_no(article_no);
		
		String user_no_str =""+session.getAttribute("user_no"); 
		int user_no = Integer.parseInt(user_no_str);
		
		param.setBoard_no(6);
		param.setUser_no(user_no);
		
		eventBoardDao.insertEventBoard(param);
		
		imageService.saveFile(session, ext01, ext02, ext03, "6", ""+article_no);
		
	}

	@Override
	public void modify(EventBoard param) {

		eventBoardDao.updateEventBoard(param);
		
	}

	@Override
	public Paging getTerminatedPaging(String curPage_str, SearchParam searchParam) {
		
		int curPage = 0;
		if(curPage_str!=null || ("").equals(curPage_str))
			curPage = Integer.parseInt(curPage_str);
		
		searchParam.setSearchBoard_no(6);
		int totalCnt = eventBoardDao.selectCntTerminatedListAll(searchParam);
		
		return new Paging(totalCnt, curPage, 10);
		
	}

	@Override
	public List<HashMap<String, Object>> getTerminatedEventList(Paging paging, int board_no, SearchParam searchParam) {
		
		return eventBoardDao.getTerminatedEventList();
		
	}

	
	
}
