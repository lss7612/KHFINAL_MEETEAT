package meeteat.service.inquiryBoard.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.inquiryBoard.face.InquiryBoardDao;
import meeteat.dto.inquiryBoard.InquiryBoard;
import meeteat.service.inquiryBoard.face.InquiryBoardService;
import meeteat.util.Paging;

@Service
public class InquiryBoardServiceImpl implements InquiryBoardService {

	private static final Logger logger = LoggerFactory.getLogger(InquiryBoardServiceImpl.class);

	@Autowired InquiryBoardDao inquiryBoardDao;
	@Autowired ServletContext context;

	
	@Override
	public Paging getInquiryPaging(Paging curPage) {
		
		System.out.println(curPage);
		
		//전체 게시글 수 조회
		int totalCount = inquiryBoardDao.selectCntAll();  
		
		logger.info("check_getInquiryPaging" + totalCount);
		
		//페이징 객체 생성
		Paging paging = new Paging(totalCount, curPage.getCurPage());
		
		return paging;
	}

	@Override
	public List<HashMap<String, String>> InquiryList(Paging paging, int board_no, int article_secret) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("board_no", 5);
		map.put("is_delete", 0);
		map.put("article_secret", article_secret);
		map.put("startNo", paging.getStartNo());
		map.put("endNo", paging.getEndNo());
		map.put("keyword", paging.getKeyword());
		map.put("search", paging.getSearch());
		
		logger.info("check_inquiryList_article_secret" + article_secret);
		
		List<HashMap<String, String>> result = new ArrayList<>();
		
		result = inquiryBoardDao.selectIquiryList(map);
		
		return result;
	}

	@Override
	public HashMap<String, Object> inquiryWrite(InquiryBoard inquiryBoard) {
		
		inquiryBoard.setBoard_no(5);
		
		int article_no = inquiryBoardDao.getNextVal();
		inquiryBoard.setArticle_no(article_no);
		
		int user_no = inquiryBoard.getUser_no();
		inquiryBoard.setUser_no(user_no);
		
		logger.info("check_inquiryWrite_user_no" + user_no);
		
		inquiryBoardDao.inquiryWrite(inquiryBoard);
	
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("article_no", article_no);
		result.put("board_no", 5);

		if("".equals(inquiryBoard.getArticle_title())){
			inquiryBoard.setArticle_title("(제목없음)");
		}
		
		return result;
		
	}

	@Override
	public HashMap<String, Object> inquiryView(InquiryBoard inquiryBoard, int article_no) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("board_no", 5);
		map.put("article_no", article_no);
		map.put("post_group", inquiryBoard.getPost_group());
		map.put("post_step", inquiryBoard.getPost_step());
		map.put("post_indent", inquiryBoard.getPost_indent());

		//조회수
		inquiryBoardDao.upDateHit(map);
		
		logger.info("check_inquiryView_map" + map);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		//상세페이지
		result = inquiryBoardDao.getInquiryView(map);
		
		return result;
	}

	@Override
	public Boolean isWriter(String user_nick, HttpSession session) {
		
		if(session.getAttribute("user_nick").equals(user_nick)) return true;
		
		return false;
	}

	@Override
	public Map<String, Object> getInquiryModify(int board_no, int article_no, HttpSession session) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("board_no", board_no);
		map.put("article_no", article_no);
		map.put("user_no", session.getAttribute("user_no"));

		logger.info("check_getInquiryModify_map" + map);
		
		Map<String, Object> result = new HashMap<>();
		
		System.out.println(result);
		
		result = inquiryBoardDao.getInquiryView(map);
		
		return result;
	}

	@Override
	public void inquiryModify(InquiryBoard map) {
		
		map.setBoard_no(5);
		
		inquiryBoardDao.upDateInquiryBoard(map);
		
	}

	@Override
	public void inquiryDelete(InquiryBoard inquiryBoard) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("board_no", inquiryBoard.getBoard_no());
		map.put("article_no", inquiryBoard.getArticle_no());
		
		map.containsKey("board_no");
				
		inquiryBoardDao.deleteInquiry(map);
		
	}
	
	@Override
	public InquiryBoard articleno(int article_no) {
		return inquiryBoardDao.articleno(article_no);
	}
	
	@Override
	public void reply(InquiryBoard inquiryBoard) {

		inquiryBoardDao.replyArticle(inquiryBoard);
		inquiryBoardDao.replyByUpdate(inquiryBoard);
	}
	
	@Override
	public Map<String, Object> getInquiryParam(int board_no, int article_no, HttpSession session, String post_group,
			String post_indent, String post_step) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("board_no", board_no);
		map.put("article_no", article_no);
		map.put("user_no", session.getAttribute("user_no"));
		map.put("post_group", post_group);
		map.put("post_step", post_step);
		map.put("post_indent", post_indent);
		
		logger.info("check_getInquiryParam_map" + map);
		
		Map<String, Object> result = new HashMap<>();
		
		logger.info("check_getInquiryParam_result" + result);
		
		result = inquiryBoardDao.getInquiryView(map);
		
		return result;
	}

//	이전글&다음글
	@Override
	public InquiryBoard getPrevArticle(int article_no, int board_no) {

		HashMap<String, String> map = new HashMap<String, String>();
		
		Integer articleNo = article_no;
		Integer boardNo = board_no;
		
		map.put("article_no", articleNo.toString());
		map.put("board_no", boardNo.toString());
		
		return inquiryBoardDao.getPrevArticle(map);
	}

	@Override
	public InquiryBoard getNextArticle(int article_no, int board_no) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		Integer articleNo = article_no;
		Integer boardNo = board_no;
		
		map.put("article_no", articleNo.toString());
		map.put("board_no", boardNo.toString());
		
		return inquiryBoardDao.getNextArticle(map);
	}

	
}
