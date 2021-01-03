package meeteat.service.reviewBoard.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import meeteat.controller.reviewBoard.ReviewController;
import meeteat.dao.reviewBoard.face.ReviewCommentDao;
import meeteat.dao.reviewBoard.face.ReviewDao;
import meeteat.dto.reviewBoard.ReviewBoard;
import meeteat.dto.reviewBoard.ReviewComment;
import meeteat.dto.reviewBoard.ReviewImg;
import meeteat.dto.reviewBoard.ReviewSearch;
import meeteat.service.reviewBoard.face.ReviewService;
import meeteat.util.Paging;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	private static final Logger logger
	= LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired private ReviewDao reviewDao;
	@Autowired private ReviewCommentDao reviewCommentDao;
	@Autowired ServletContext context;

	@Override
	public Paging getPaging(Paging curPage, ReviewSearch reviewSearch) {
		
		int totalCount = reviewDao.selectCntAll(reviewSearch);
		
		int listCount = 15;
		
		Paging paging = new Paging(totalCount, curPage.getCurPage(), listCount);
		
		return paging;
	}

//	@Override
//	public List<ReviewBoard> list(Paging paging) {
//		
//		return reviewDao.selectList(paging);
//
//	}
	

	@Override
	public ReviewBoard boardView(ReviewBoard reviewBoard) {
		reviewDao.updateHit(reviewBoard);
		
		return reviewDao.selectByBoardNo(reviewBoard);
	}

	@Override
	public void write(ReviewBoard reviewBoard) {
		reviewDao.write(reviewBoard);
	}

	@Override
	public void update(ReviewBoard reviewBoard) {
		reviewDao.update(reviewBoard);
	}

	@Override
	public void delete(ReviewBoard reviewBoard) {
		reviewDao.delete(reviewBoard);
	}

	@Override
	public void insertComment(ReviewComment comment) {
		reviewCommentDao.insertComment(comment);
	}

	@Override
	public boolean deleteComment(ReviewComment comment) {
		reviewCommentDao.deleteComment(comment);
		
		if(reviewCommentDao.countComment(comment) > 0 ) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public List<ReviewComment> getCommentList(ReviewBoard reviewBoard) {
		return reviewCommentDao.selectComment(reviewBoard);
	}

	@Override
	public void filesave(MultipartFile fileupload, int article_no) {
		
		//파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("upload");
		
		//폴더가 존재하지 않으면 생성하기
		File stored = new File(storedPath);
		if(!stored.exists()) {
			stored.mkdir();
		}
				
		//저장될 파일의 이름
		String filename = fileupload.getOriginalFilename();
				
		//UUID값 생성
		String uid = UUID.randomUUID().toString().split("-")[4];

		//파일이름에 UUID 추가하기
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
				
		//DB에 기록하기
		ReviewImg reviewImg = new ReviewImg();
		logger.info("> > >reviewImg : "+reviewImg+"< < <");
		logger.info("---------------------------------------------------- originname : "+fileupload.getOriginalFilename());
		reviewImg.setFile_originname(fileupload.getOriginalFilename());
		reviewImg.setFile_storedname(filename);
		reviewImg.setArticle_no(article_no);
		
		logger.info("------------------------------------------------------------ : " + reviewImg);
				
		reviewDao.insertFile(reviewImg);
	
	}

	@Override
	public List<ReviewImg> list() {
		return reviewDao.selectImgAll();
	}

	@Override
	public ReviewImg getFile(int file_no) {
		return reviewDao.selectByFileno(file_no);
	}

	@Override
	public List<HashMap<String, String>> list
					(Paging paging, ReviewSearch reviewSearch, int board_no) {
		HashMap<String, Object> listmap = new HashMap<>();
		
		listmap.put("board_no", 4);
		listmap.put("is_delete", 0);
		listmap.put("startNo", paging.getStartNo());
		listmap.put("endNo", paging.getEndNo());
		listmap.put("review_keyword", reviewSearch.getReview_keyword());
		listmap.put("review_search", reviewSearch.getReview_search());
		
		List<HashMap<String, String>> listresult = new ArrayList<>();
		listresult = reviewDao.selectList(listmap);
		
		return listresult;
	}

	@Override
	public void errorPage() {
		reviewDao.errorPage();
	}

//	@Override
//	public void write(ReviewBoard reviewBoard, MultipartFile fileupload) {
//		reviewDao.write(reviewBoard);
//		
//	}

//	@Override
//	public void deleteComment(ReviewComment comment) {
//		reviewCommentDao.deleteComment(comment);
//	}

	



}




 








