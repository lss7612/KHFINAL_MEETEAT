package meeteat.service.noticeBoard.impl;

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

import meeteat.dao.noticeBoard.face.NoticeBoardDao;
import meeteat.dto.noticeBoard.NoticeBoard;
import meeteat.dto.noticeBoard.NoticeParam;
import meeteat.service.noticeBoard.face.NoticeBoardService;
import meeteat.util.Paging;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeBoardServiceImpl.class);

	@Autowired NoticeBoardDao noticeBoardDao;
	@Autowired ServletContext context;
	
	@Override
	public Paging getNoticePaging(Paging curPage, NoticeParam noticeParam) {
		
		System.out.println(curPage);
		
		//전체 게시글 수 조회
		int totalCount = noticeBoardDao.selectCntAll(noticeParam);  
		
		//페이징 객체 생성
		Paging paging = new Paging(totalCount, curPage.getCurPage());
		
		return paging;
	}
	
	@Override
	public List<HashMap<String, String>> noticeList(Paging paging, int board_no, NoticeParam noticeParam) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("board_no", 1);
		map.put("is_delete", 0);
		map.put("startNo", paging.getStartNo());
		map.put("endNo", paging.getEndNo());
		map.put("noticeKeyword", noticeParam.getNoticeKeyword());
		map.put("noticeSearch", noticeParam.getNoticeSearch());
		
		List<HashMap<String, String>> result = new ArrayList<>();
		
		result = noticeBoardDao.selectList(map);
		
		return result;
	}

	@Override
	public HashMap<String, Object> noticeWrite(NoticeBoard noticeBoard) {
		
		noticeBoard.setBoard_no(1);
		int article_no = noticeBoardDao.getNextVal();
		noticeBoard.setArticle_no(article_no);
		
		int user_no = noticeBoard.getUser_no();
		noticeBoard.setUser_no(user_no);
		
		noticeBoardDao.noticeWrite(noticeBoard);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("article_no", article_no);
		result.put("board_no", 1);
		

		if("".equals(noticeBoard.getArticle_title())){
			noticeBoard.setArticle_title("(제목없음)");
		}
		
		return result;
	}
	
	@Override
	public HashMap<String, Object> noticeView(NoticeBoard noticeBoard, int article_no) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("board_no", 1);
		map.put("article_no", article_no);

		//조회수
		noticeBoardDao.upDateHit(map);
		
		logger.info("check_noticeView_article_no" + map);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		//상세페이지
		result = noticeBoardDao.getNoticeView(map);
		
		return result;
	}
	
	@Override
	public Map<String, Object> getnoticeModify(int board_no, int article_no, HttpSession session) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("board_no", board_no);
		map.put("article_no", article_no);
		map.put("user_no", session.getAttribute("user_no"));

		logger.info("check_getnoticeModify_article_no" + map);
		
		Map<String, Object> result = new HashMap<>();
		
		logger.info("check_getnoticeModify_article_no" + result);
		
		result = noticeBoardDao.getNoticeView(map);
		
		return result;
	}
	
	@Override
	public void noticeModify(NoticeBoard map) {
		
		map.setBoard_no(1);
		
		noticeBoardDao.upDateNoticeBoard(map);
		
	}
	
	@Override
	public void noticeDelete(NoticeBoard noticeBoard) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("board_no", noticeBoard.getBoard_no());
		map.put("article_no", noticeBoard.getArticle_no());
		
		map.containsKey("board_no");
				
		noticeBoardDao.deleteNotice(map);
		
	}

	
	@Override
	public Boolean isWriter(String user_nick, HttpSession session) {
		
		if(session.getAttribute("user_nick").equals(user_nick)) return true;
		
		return false;
	}

	@Override
	public NoticeBoard getPrevArticle(int article_no, int board_no) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		Integer articleNo = article_no;
		Integer boardNo = board_no;
		
		map.put("article_no", articleNo.toString());
		map.put("board_no", boardNo.toString());
		
		return noticeBoardDao.getPrevArticle(map);
	}

	@Override
	public NoticeBoard getNextArticle(int article_no, int board_no) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		Integer articleNo = article_no;
		Integer boardNo = board_no;
		
		map.put("article_no", articleNo.toString());
		map.put("board_no", boardNo.toString());
		
		return noticeBoardDao.getNextArticle(map);
	}
		
}
