package meeteat.service.recruitBoard.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.recruitBoard.face.RecruitBoardDao;
import meeteat.dto.recruitBoard.RecruitBoard;
import meeteat.dto.recruitBoard.SearchParam;
import meeteat.service.recruitBoard.face.ImageService;
import meeteat.service.recruitBoard.face.RecruitBoardService;
import meeteat.util.Paging;

@Service
public class RecruitSerivceImpl implements RecruitBoardService{

	private static final Logger logger = LoggerFactory.getLogger(RecruitSerivceImpl.class);
	@Autowired RecruitBoardDao recruitBoardDao;
	@Autowired ImageService imageService;
	
	@Override
	public HashMap<String,Object> write(RecruitBoard param
			, HttpSession session
			, String ext01
			, String ext02
			,String ext03) {

		
		param.setBoard_no(3);
		int article_no = recruitBoardDao.getNextVal();
		param.setArticle_no(article_no);
		
		recruitBoardDao.insertRecruitBoard(param);
		
		HashMap<String,Object> result = new HashMap<String, Object>();
		result.put("article_no", article_no);
		result.put("board_no", 3);
		
		imageService.saveFile(session, ext01, ext02, ext03, "3", ""+article_no);
		
		return result;
		
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
		param.put("searchLocation", searchParam.getSearchLocation());
		
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
	public HashMap<String, Object> getBoardView(int board_no, int article_no, SearchParam searchParam, HttpSession session) {

		Map<String, Object> param = new HashMap<>();
		
		param.put("board_no", board_no);
		param.put("article_no", article_no);
		param.put("user_no", session.getAttribute("user_no"));
		
		recruitBoardDao.updateHit(param);
		
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
								,"<span style=\"color:tomato; margin:0; font-weight:bold;\">"+searchParam.getSearchKeyword()+"</span>");
						result.put("ARTICLE_CONTENT", before);
				}
			}
		}
				
		List<HashMap<String,Object>> imglist = recruitBoardDao.getImgList(param);
		result.put("IMGLIST", imglist);
				
		return result;
	}


	@Override
	public Boolean isWriter(String user_nick, HttpSession session) {

		if(session.getAttribute("user_nick").equals(user_nick)) return true;
		
		return false;
		
	}


	@Override
	public Map<String, Object> getModifyParam(int board_no,int article_no,HttpSession session) {
		
		Map<String, Object> param = new HashMap<>();
		
		param.put("board_no", 3);
		param.put("article_no", article_no);
		param.put("user_no", session.getAttribute("user_no"));
		
		Map<String, Object> result = new HashMap<>();
		result = recruitBoardDao.getBoardView(param);
		
		int meet_time_clock = Integer.parseInt((String) result.get("MEET_TIME_CLOCK"));
		String meet_time_area = null;
		String meet_time_clock_str = null;
		if(meet_time_clock >= 12) {
			
			if(meet_time_clock > 12) {
				
				meet_time_clock = meet_time_clock - 12;
				meet_time_clock_str = "0" + meet_time_clock;
				
			}else {
				
				meet_time_clock_str = "" + meet_time_clock;
				
			}
			
			meet_time_area = "pm";
			
		} else {
			if(meet_time_clock >=10) {
				meet_time_clock_str=""+meet_time_clock;
			} else if(meet_time_clock == 0) {
				meet_time_clock_str="12";
			} else {
				meet_time_clock_str="0"+meet_time_clock;
			}
			meet_time_area = "am";
		}
		
		logger.info(""+meet_time_clock_str);
		
		result.put("MEET_TIME_AREA", meet_time_area);
		result.put("MEET_TIME_CLOCK", meet_time_clock_str);
		
		List<HashMap<String,Object>> imglist = recruitBoardDao.getImgList(param);
		result.put("IMGLIST", imglist);
		
		return result;
	}
	
	


	@Override
	public void modify(RecruitBoard param) {

		param.setBoard_no(3);
		
		recruitBoardDao.updateRecruitBoard(param);
		
	}


	@Override
	public void delete(int article_no, int board_no) {

		Map<String, Object> param = new HashMap<>();
		
		param.put("board_no", board_no);
		param.put("article_no", article_no);
		
		recruitBoardDao.deleteRecruitBoard(param);
		
	}


	@Override
	public HashMap<String, Object> recommend(Map<String, Object> param) {

		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int isRecommended = recruitBoardDao.isRecommended(param);
		result.put("isRecommend", isRecommended);
		
		if(isRecommended==0) {
			recruitBoardDao.increaseRecommendCnt(param);
		} else {
			recruitBoardDao.decreaseRecommendCnt(param);
		}
		
		logger.info("isrecommended : " + isRecommended);
		
		
		int recommendCnt = recruitBoardDao.getRecommendCnt(param);
		result.put("recommendCnt", recommendCnt);
		
		return result;
		
	}


}
