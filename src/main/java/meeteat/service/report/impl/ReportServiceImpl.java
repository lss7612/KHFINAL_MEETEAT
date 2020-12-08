package meeteat.service.report.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.report.face.ReportDao;
import meeteat.dto.report.ResultReportReason;
import meeteat.dto.report.UserReport;
import meeteat.service.report.face.ReportService;
import meeteat.util.Paging;

@Service
public class ReportServiceImpl implements ReportService{

	private static final Logger logger = LoggerFactory.getLogger(ReportServiceImpl.class);
	@Autowired private ReportDao reportDao;
	
	@Override
	public Paging getPaging(Paging curPage, String user_id) {
		
		//전체 신고 수 조회
		int totalCount = reportDao.selectCntAll(user_id);
		logger.info(""+totalCount);
		
		//페이징 객체 생성
		Paging paging = new Paging(totalCount, curPage.getCurPage());
		return paging;
	}
	
	@Override
	public Paging getReportResultPaging(Paging curPage, String user_id) {
		
		//전체 신고 처리 수 조회
		int totalCount = reportDao.selectCntAllReportResult(user_id);
		logger.info(""+totalCount);
		
		//페이징 객체 생성
		Paging paging = new Paging(totalCount, curPage.getCurPage());
		return paging;
	}
	
	@Override
	public List<UserReport> getReportList(Paging paging) {
		List<UserReport> list;
		return list = reportDao.getAllReportList(paging);
	}
	
	@Override
	public List<HashMap<String, String>> getListByUserId(String user_id) {
		return reportDao.searchListByUserId(user_id);
	}
	
	
	@Override
	public ResultReportReason getResultReason() {
		ResultReportReason rrr;
		return rrr = reportDao.getResultReasonList();
	}
	
	@Override
	public List<HashMap<String, String>> getReportByReportReasonASC(Paging paging) {
		return reportDao.getReportByReportReasonASC(paging);
	}
	
	@Override
	public List<HashMap<String, String>> getReportByReportReasonDESC(Paging paging) {
		return reportDao.getReportByReportReasonDESC(paging);
	}
	
	@Override
	public List<HashMap<String, String>> getReportListByReportDateASC(Paging paging) {
		return reportDao.getReportByReportDateASC(paging);
	}
	
	@Override
	public List<HashMap<String, String>> getReportListByReportDateDESC(Paging paging) {
		return reportDao.getReportByReportDateDESC(paging);
	}
	
	@Override
	public List<HashMap<String, String>> getReportListByUernoASC(Paging paging) {
		return reportDao.getReportByUsernoASC(paging);
	}
	
	@Override
	public List<HashMap<String, String>> getReportListByUsernoDESC(Paging paging) {
		return reportDao.getReportByUsernoDESC(paging);
	}
	
	@Override
	public void reportResultSet(int user_no) {
		reportDao.reportResultSet(user_no);
	}
	
	@Override
	public void userGradeSetReportResult(int user_no) {
		reportDao.userGradeUpdate(user_no);
	}
	
	@Override
	public void setIsProcessed(int user_no) {
		reportDao.setIsProcessedReportList(user_no);
	}
	
	@Override
	public List<HashMap<String, String>> getReportResultList(String user_id) {
		return reportDao.searchReportResultList(user_id);
	}
}
