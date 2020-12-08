package meeteat.service.commentForSSLEE.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.commentForSSLEE.face.CommentDao;
import meeteat.dto.commentForSSLEE.Comment;
import meeteat.service.commentForSSLEE.face.CommentService;
@Service
public class CommentServiceImpl implements CommentService {

	private static final Logger logger = LoggerFactory.getLogger(CommentServiceImpl.class);
	@Autowired CommentDao commentDao;
	
	@Override
	public void write(Comment comment) {

		commentDao.insertComment(comment);
		
	}

	@Override
	public List<Map<String,Object>> getCommentlist(int article_no, int board_no) {

		Map<String,Object> param = new HashMap<>();
		param.put("article_no", article_no);
		param.put("board_no", board_no);
		
		logger.info("paramparam" + param);
		
		List<Map<String,Object>> result = commentDao.getCommentList(param);
		
		return result;
		
	}

}
