package meeteat.service.recruitBoard.impl;

import java.util.ArrayList;
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
import meeteat.service.recruitBoard.face.RecruitBoardService;
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
	public List<HashMap<String,String>> list(Paging paging, SearchParam searchParam) {

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
		
		List<HashMap<String,String>> result = new ArrayList<>();
		
		result = recruitBoardDao.getRecruitBoardList(param);
		
		logger.info("getSearchCategory : "+searchParam.getSearchCategory());
		logger.info("getSearchKeyword : "+searchParam.getSearchKeyword());
		
		//검색결과 색깔 바꾸고 굵게 하는 코드
		if(searchParam.getSearchCategory()!=null && !searchParam.getSearchCategory().equals("")) {
			
			if(searchParam.getSearchCategory().equals("article_title")) {
				
				if(searchParam.getSearchKeyword()!=null && !searchParam.getSearchKeyword().equals("")) {
					
					for(int i = 0; i < result.size(); i++) {
						String before = result.get(i).get("ARTICLE_TITLE");
						before = before.replace(
								searchParam.getSearchKeyword()
								,"<span style=\"color:tomato; font-weight:bold;\">"+searchParam.getSearchKeyword()+"</span>");
						result.get(i).put("ARTICLE_TITLE", before);
					}
				}
			}
		}
		
		//검색결과 색깔 바꾸고 굵게 하는 코드		
		if(searchParam.getSearchCategory()!=null && !searchParam.getSearchCategory().equals("")) {
			
			if(searchParam.getSearchCategory().equals("user_nick")) {
				
				if(searchParam.getSearchKeyword()!=null && !searchParam.getSearchKeyword().equals("")) {
					
					for(int i = 0; i < result.size(); i++) {
						String before = result.get(i).get("USER_NICK");
						before = before.replace(
								searchParam.getSearchKeyword()
								,"<span style=\"color:tomato; font-weight:bold;\">"+searchParam.getSearchKeyword()+"</span>");
						result.get(i).put("USER_NICK", before);
					}
				}
			}
		}
		
		
		
		
		return result;
		
	}


	@Override
	public HashMap<String, Object> getBoardView(int board_no, int article_no, SearchParam searchParam) {

		Map<String, Object> param = new HashMap<>();
		
		param.put("board_no", board_no);
		param.put("article_no", article_no);
		
		HashMap<String,Object> result = new HashMap<String, Object>() ;
		
		result = recruitBoardDao.getBoardView(param);
		
		//검색결과 색깔 바꾸고 굵게 하는 코드		
				if(searchParam.getSearchCategory()!=null && !searchParam.getSearchCategory().equals("")) {
					
					logger.info("여기까지" );
					
					if(searchParam.getSearchCategory().equals("article_content")) {
						logger.info("여기까지" );
						
						if(searchParam.getSearchKeyword()!=null && !searchParam.getSearchKeyword().equals("")) {
							logger.info("여기까지" );
							
								String before = (String) result.get("ARTICLE_CONTENT");
								before = before.replace(
										searchParam.getSearchKeyword()
										,"<span style=\"color:tomato; font-weight:bold;\">"+searchParam.getSearchKeyword()+"</span>");
								result.put("ARTICLE_CONTENT", before);
						}
					}
				}
		
		return result;
	}


}
