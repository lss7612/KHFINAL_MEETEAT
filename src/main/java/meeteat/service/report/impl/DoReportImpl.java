package meeteat.service.report.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.report.face.DoReportDao;
import meeteat.dto.report.UserReport;
import meeteat.service.report.face.DoReport;

@Service
public class DoReportImpl implements DoReport{

	private static final Logger logger = LoggerFactory.getLogger(DoReportImpl.class);
	@Autowired private DoReportDao doReportDao;
	
	@Override
	public List<HashMap<String, String>> getReportReasonList() {
		return doReportDao.getReportReasonList();
	}
	
	@Override
	public HashMap<String, String> getUserInfo(int user_no) {
		return doReportDao.getUserInfoByUserNo(user_no);
	}
	
	@Override
	public void insertUserReport(UserReport report) {
		doReportDao.insertUserReport(report);
	}
}
