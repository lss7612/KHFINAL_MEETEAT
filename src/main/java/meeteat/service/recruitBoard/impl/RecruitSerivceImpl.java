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

		//글내용과 파일을 등록할 article_no를 불러온다
		param.setBoard_no(3);
		int article_no = recruitBoardDao.getNextVal();
		param.setArticle_no(article_no);
		
		//글내용을 등록한다.
		recruitBoardDao.insertRecruitBoard(param);
		
		
		//임시저장한 파일을 실제 저장 위치로 옮긴다.
		//저장한 파일을 글번호화 게시판 분류번호를 이용해 DB에도 등록한다. 
		imageService.saveFile(session, ext01, ext02, ext03, "3", ""+article_no);

		
		//반환할 article_no와 board_no를 생성하고 반환한다.
		HashMap<String,Object> result = new HashMap<String, Object>();
		result.put("article_no", article_no);
		result.put("board_no", 3);
		return result;
		
	}

	
	@Override
	public Paging getPaging(String curPage_str, SearchParam searchParam) {
	
		//curPage가 없거나 빈 문자열이면 curPage는 그대로 0
		int curPage = 0;
		if(curPage_str!=null && !("").equals(curPage_str))
			curPage = Integer.parseInt(curPage_str);

		//처음 게시판에 들어오게 되면 Location이 null인데 null을 빈 문자열로 바꿔준다. (오류 방지)
		if(searchParam.getSearchLocation() == null)
			searchParam.setSearchLocation("");
		
		//검색내용을 이용하여 총 게시글 개수를 불러온다
		searchParam.setSearchBoard_no(3);
		int totalCnt = recruitBoardDao.selectCntListAll(searchParam);
		
		//페이지 객체를 생성하여 return한다.
		return new Paging(totalCnt, curPage, 10);
	}
	
	
	@Override
	public List<HashMap<String,String>> list(Paging paging, SearchParam searchParam, int board_no) {
		
		HashMap<String, Object> param = new HashMap<>();
		
		//보드클래스정보와, 삭제여부 param에 설정
		param.put("board_no", 3);
		param.put("is_delete", 0);
		
		//페이징 starNo, endNo param에 설정
		param.put("startNo", paging.getStartNo());
		param.put("endNo", paging.getEndNo());
		
		
		//검색내용 param에 설정
		if(searchParam.getSearchLocation() == null)
			searchParam.setSearchLocation("");
		param.put("searchCategory", searchParam.getSearchCategory());
		param.put("searchKeyword", searchParam.getSearchKeyword());
		param.put("searchLocation", searchParam.getSearchLocation());
		
		//DB에 게시글 목록을 받는다.
		List<HashMap<String,String>> result = new ArrayList<>();
		result = recruitBoardDao.getRecruitBoardList(param);
		
		if(searchParam.getSearchCategory()!=null && !searchParam.getSearchCategory().equals("")) {//카테고리를 선택했어야 한다
			//제목으로 검색 시 
			//검색결과 색깔 바꾸고 굵게 하는 코드
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
			//작성자로 검색 시
			//검색결과 색깔 바꾸고 굵게 하는 코드		
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

		//DB 쿼리로 넘겨줄 파라미터를 setting한다.
		Map<String, Object> param = new HashMap<>();
		param.put("board_no", board_no);
		param.put("article_no", article_no);
		param.put("user_no", session.getAttribute("user_no"));

		//조회수를 늘려준다.
		recruitBoardDao.updateHit(param);
		

		//result값을 받아온다.
		HashMap<String,Object> result = new HashMap<String, Object>() ;
		result = recruitBoardDao.getBoardView(param);
		
		
		//글 내용으로 검색했을 때 
		//검색결과 색깔 바꾸고 굵게 하는 코드		
		if(searchParam.getSearchCategory()!=null && !searchParam.getSearchCategory().equals("")) {
			if(searchParam.getSearchCategory().equals("article_content")) {
				if(searchParam.getSearchKeyword()!=null && !searchParam.getSearchKeyword().equals("")) {
						String before = (String) result.get("ARTICLE_CONTENT");
						before = before.replace(
								searchParam.getSearchKeyword()
								,"<span style=\"color:tomato; margin:0; font-weight:bold;\">"+searchParam.getSearchKeyword()+"</span>");
						result.put("ARTICLE_CONTENT", before);
				}
			}
		}
				
		//이미지리스트를 받아서 result에 추가해준다.
		List<HashMap<String,Object>> imglist = recruitBoardDao.getImgList(param);
		result.put("IMGLIST", imglist);
				
		return result;
	}


	@Override
	public Boolean isWriter(String user_nick, HttpSession session) {

		//세션정보와 작성자 정보 비교
		if(session.getAttribute("user_nick").equals(user_nick)) return true;
		
		return false;
		
	}


	@Override
	public Map<String, Object> getModifyParam(int board_no,int article_no,HttpSession session) {
		
		Map<String, Object> param = new HashMap<>();
		
		param.put("board_no", board_no);
		param.put("article_no", article_no);
		param.put("user_no", session.getAttribute("user_no"));
		
		Map<String, Object> result = new HashMap<>();
		result = recruitBoardDao.getBoardView(param);
		
		//만나는시간 DB에서 가져온 후 날짜, 시각, 분, 오전오후 나누는 코드
		if(board_no == 3) {//만나는 시간은 recruitboard에만 포함되는 내용이므로 board_no는 3만 포함된다.
			int meet_time_clock = Integer.parseInt((String) result.get("MEET_TIME_CLOCK"));
			String meet_time_area = null;
			String meet_time_clock_str = null;
			if(meet_time_clock >= 12) {//시각이 12 이상일 때
				meet_time_area = "pm";//오후로 설정
				if(meet_time_clock > 12) {//12보다 크면 12를 빼고 앞에 0을 붙혀준다. (ex.14시 -> 2시 -> 02시)
					meet_time_clock = meet_time_clock - 12;
					meet_time_clock_str = "0" + meet_time_clock;
				}else {//12와 같을때는 그대로 12로 쓴다.
					meet_time_clock_str = "" + meet_time_clock;
				}
			} else {//12보다 작을 때
				meet_time_area = "am";//오전으로 설정
				if(meet_time_clock >=10) {//10보다 크면 그대로 쓴다. (ex.10시)
					meet_time_clock_str=""+meet_time_clock;
				} else if(meet_time_clock == 0) {//0과 같으면 12로 바꿔준다
					meet_time_clock_str="12";
				} else {//10보다 작으면 앞에 0을 붙혀준다 (ex.9시 -> 09시)
					meet_time_clock_str="0"+meet_time_clock;
				}
			}
			//설정한 시각과 오전 오후여부를 result에 저장한다.
			result.put("MEET_TIME_AREA", meet_time_area);
			result.put("MEET_TIME_CLOCK", meet_time_clock_str);
		}
		
		//이미지리스트를 result에 포함시킨다.
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
		
		//내가 이미 추천했는지 확인한다. 
		//추천했다면 count값으로 1을 반환하고 안했다면 0을 반환한다.
		int isRecommended = recruitBoardDao.isRecommended(param);
		result.put("isRecommend", isRecommended);

		if(isRecommended==0) {//추천하지 않았을때
			//추천수를 늘려준다.
			recruitBoardDao.increaseRecommendCnt(param);
		} else {//추천했을 때 
			//추천수를 줄여준다..
			recruitBoardDao.decreaseRecommendCnt(param);
		}

		//지금까지 쌓인 총 추천수를 확인하고 반환한다.
		int recommendCnt = recruitBoardDao.getRecommendCnt(param);
		result.put("recommendCnt", recommendCnt);
		return result;
	}


}
