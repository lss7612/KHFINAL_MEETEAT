package meeteat.service.eventBoard.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.eventBoard.face.EventBoardDao;
import meeteat.service.eventBoard.face.EventBoardService;

@Service
public class EventBoardServiceImpl implements EventBoardService {

	private static final Logger logger = LoggerFactory.getLogger(EventBoardServiceImpl.class);
	@Autowired EventBoardDao eventBoardDao;
	
	
}
