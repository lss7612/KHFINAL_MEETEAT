package meeteat.service.myPage.impl;

import java.io.File;
import java.io.IOException;
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

import meeteat.dao.myPage.face.MyPageDao;
import meeteat.dto.user.User;
import meeteat.service.myPage.face.MyPageService;
import meeteat.util.MyPaging;


@Service
public class MyPageServiceImpl implements MyPageService{
	private static final Logger logger = LoggerFactory.getLogger(MyPageServiceImpl.class);
	
	@Autowired private MyPageDao myPageDao;
	@Autowired ServletContext context;
	
	@Override
	public Map<String, Object> infoByNo(int user_no) {
		return myPageDao.selectByNo(user_no);
	}
	
	@Override
	public void myEdit(User user, MultipartFile fileupload) {
		//파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("resources/upload");	
		
		//폴더가 존재하지 않으면 생성하기
		File stored = new File(storedPath);
		if(!stored.exists()) {
			stored.mkdir();
		}
		//저장될 파일의 이름
		String filename = fileupload.getOriginalFilename();
		
		//UUID값 생성
		String uid = UUID.randomUUID().toString().split("-")[4];
//		logger.info(uid);
		
		//파일이름에 UUID 추가하기 (파일명 중복되지 않게 설정)
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
		
		
		//DB에 기록하기 - DTO 사용
		User userUpdate = new User();
		userUpdate.setUser_profileorigin(fileupload.getOriginalFilename());
		userUpdate.setUser_profilestored(filename);
		userUpdate.setUser_no(user.getUser_no());
		userUpdate.setUser_email(user.getUser_email());
		userUpdate.setUser_nick(user.getUser_nick());
		userUpdate.setUser_pw(user.getUser_pw());
		
		myPageDao.updateUser(userUpdate);		
	}
	
	@Override
	public boolean pwChk(User user) {
		if(myPageDao.pwChk(user)>=1) {
			return true;
		}
		return false;
	}
	
	@Override
	public void deleteUser(User user) {
		myPageDao.deleteUser(user);
		
	}
	
	@Override
	public List<Map<String, Object>> myPostList(int user_no) {

		return myPageDao.selectMyPostByNo(user_no);
	}
	
	@Override
	public List<Map<String, Object>> myCommentList(int user_no) {
		return myPageDao.selectMyCommentByNo(user_no);
	}

	@Override
	public MyPaging getPaging(MyPaging curPage) {
		
		int totalCount = myPageDao.selectCntAllPost(curPage);
		
		MyPaging paging = new MyPaging(totalCount, curPage.getCurPage(), curPage.getCategory(), curPage.getSearch(), curPage.getUser_no());
		
		return paging;
	}
	
	@Override
	public List<Map<String, Object>> myAllPostList(MyPaging paging) {
		return myPageDao.myAllPostList(paging);
	}
	
	@Override
	public void deleteMyPost(HashMap<String, Object> map) {
		myPageDao.deleteMyPost(map);
		
	}
}
