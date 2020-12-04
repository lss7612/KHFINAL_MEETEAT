package meeteat.service.recruitBoard.impl;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.recruitBoard.face.RecruitBoardDao;
import meeteat.dto.recruitBoard.RecruitBoard;
import meeteat.dto.recruitBoard.SearchParam;
import meeteat.service.recruitBorad.face.RecruitBoardService;
import meeteat.util.Paging;

@Service
public class RecruitSerivceImpl implements RecruitBoardService{

	private static final Logger logger = LoggerFactory.getLogger(RecruitSerivceImpl.class);
	@Autowired RecruitBoardDao recruitBoardDao;
	
	@Override
	public void write(RecruitBoard param) {

		//남은구현
		//파일이 있으면 tb_file_seq.nextval받아오기
		//파일이 있으면 file insert하기
		
		//param에 fileno set하기
		
		param.setBoard_no(3);
		
		recruitBoardDao.insertRecruitBoard(param);
		
	}

	
	@Override
	public Paging getPaging(String curPage_str, SearchParam searchParam) {
	
		int curPage = 0;
		if(curPage_str!=null || ("").equals(curPage_str))
			curPage = Integer.parseInt(curPage_str);

		searchParam.setSearchBoard_no(3);//검색form에 invisible로 3을 submit해주는 태그 만들어줘야함
		int totalCnt = recruitBoardDao.selectCntListAll(searchParam);
		
		logger.info("****totalCnt = "+totalCnt +"****");
		logger.info("searchParam : "+ searchParam);
		return new Paging(totalCnt, curPage, 10);
	}
	
	
	@Override
	public List<LinkedHashMap<String,String>> list(Paging paging, SearchParam searchParam) {

		HashMap<String, Object> param = new HashMap<>();
		
		//보드클래스정보와, 삭제여부
		param.put("board_no", 3);
		param.put("is_delete", 0);
		
		//페이징 starNo, endNo
		param.put("startNo", paging.getStartNo());
		param.put("endNo", paging.getEndNo());
		
		//
		param.put("searchCategory", searchParam.getSearchCategory());
		param.put("searchKeyword", searchParam.getSearchKeyword());
		
		return recruitBoardDao.getRecruitBoardList(param);
		
	}


	@Override
	public HashMap<String, Object> getBoardView(int board_no, int article_no) {

		Map<String, Object> param = new HashMap<>();
		
		param.put("board_no", board_no);
		param.put("article_no", article_no);
		
		return recruitBoardDao.getBoardView(param);
	}


}
