package meeteat.service.recruitBoard.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.recruitBoard.face.RecruitBoardDao;
import meeteat.dto.recruitBoard.RecruitBoard;
import meeteat.service.recruitBorad.face.RecruitBoardService;

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

}
