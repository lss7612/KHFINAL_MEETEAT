package meeteat.service.boardAdmin.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.controller.boardAdmin.BoardAdminController;
import meeteat.dao.boardAdmin.face.BoardAdminDao;
import meeteat.dao.inquiryBoard.face.InquiryBoardDao;
import meeteat.dao.noticeBoard.face.NoticeBoardDao;
import meeteat.dto.boardAdmin.BoardAdmin;
import meeteat.dto.boardAdmin.BoardAdminParam;
import meeteat.service.boardAdmin.face.BoardAdminService;
import meeteat.util.Paging;

@Service
public class BoardAdminServiceImpl implements BoardAdminService {
	
	@Autowired BoardAdminDao boardAdminDao;
	@Autowired NoticeBoardDao noticeDao;
	@Autowired InquiryBoardDao inquiryBoardDao;
	
	
	private static final Logger logger = LoggerFactory.getLogger(BoardAdminController.class);


	@Override
	public Paging getBoardManagePaging(Paging curPage, BoardAdminParam boardAdminParam) {
		
		System.out.println(curPage);
		
		//전체 게시글 수 조회
		int totalCount = boardAdminDao.selectBoardCntAll(boardAdminParam);  
		
		logger.info("getBoardManagePaging/Service" + totalCount);
		
		//페이징 객체 생성
		Paging paging = new Paging(totalCount, curPage.getCurPage());
		
		return paging;
	}

	@Override
	public List<HashMap<String, String>> BoardManageList(
				Paging paging
				, BoardAdminParam boardAdminParam
				, BoardAdmin boardAdmin
				) {
		
		int board_no = boardAdmin.getBoard_no();
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("board_no", boardAdmin.getBoard_no());
		map.put("is_delete", 0);
		map.put("startNo", paging.getStartNo());
		map.put("endNo", paging.getEndNo());
		map.put("manageCategory", boardAdminParam.getManageCategory());
		map.put("manageKeyword", boardAdminParam.getManageKeyword());
		map.put("manageSearch", boardAdminParam.getManageSearch());
		map.put("start_date", boardAdminParam.getStart_date());
		map.put("end_date", boardAdminParam.getEnd_date());
		
		List<HashMap<String, String>> result = new ArrayList<>();
		
		result = boardAdminDao.getBoardAllList(map);
		
		logger.info("board_no1 : "+ board_no);
		logger.info("getSearchCategory1 : "+ boardAdminParam.getManageCategory());
		logger.info("getSearchKeyword1 : "+ boardAdminParam.getManageKeyword());
		logger.info("getManageSearch1 : "+ boardAdminParam.getManageSearch());
		logger.info("getStart_date1 : "+ boardAdminParam.getStart_date());	
		logger.info("getEnd_date1 : "+ boardAdminParam.getEnd_date());	
		
		return result;
	}
	
	@Override
	public void deleteBoard(List<String> articleNoList, List<String> boardNoList) {
		
		Map<String, Object> map = new HashMap<>();
		
		for(int i = 0; i < articleNoList.size();i++) {
			
			map.put("article_no", articleNoList.get(i));
			map.put("board_no", boardNoList.get(i));
			boardAdminDao.deleteBoardManage(map);
		}
			
	}

}