package meeteat.controller.report;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import meeteat.dto.report.UserReport;
import meeteat.service.report.face.DoReport;

@Controller
@RequestMapping(value="/report")
public class DoReportController {

	private static final Logger logger = LoggerFactory.getLogger(DoReportController.class);
	@Autowired private DoReport doReport;
	
	@RequestMapping(value="/doReport", method=RequestMethod.POST)
	public String doReport(int user_no, String url, Model model) {
		logger.info(""+user_no);
		logger.info(""+url);
		
		HashMap<String, String> user = doReport.getUserInfo(user_no);
		
		model.addAttribute("user", user);
		model.addAttribute("url", url);
		//신고 항목 가져오기
		List<HashMap<String,String>> list;
		list = doReport.getReportReasonList();
		logger.info(""+list);
		model.addAttribute("list", list);
		
		return "/report/doReport";
	}
	
	@RequestMapping(value="/doReport/cmplt", method=RequestMethod.POST)
	public String doReportProc(UserReport report, Model model) {
//		logger.info(""+user_no);
//		logger.info(""+url);
//		logger.info(""+reason_no);
//		logger.info(""+report_content);
//		if(report_content.equals("")) {
//			report_content = null;
//		}
//		logger.info(""+report_content);
		logger.info(""+report);
		doReport.insertUserReport(report);
		
		return "/report/cmplt";
	}
}
