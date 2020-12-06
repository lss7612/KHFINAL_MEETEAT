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
import org.springframework.web.bind.annotation.RequestParam;

import meeteat.dto.report.ResultReportReason;
import meeteat.dto.report.UserReport;
import meeteat.service.report.face.ReportService;
import meeteat.util.Paging;


@Controller
@RequestMapping(value="/report")
public class ReportController {

	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	@Autowired private ReportService reportService;
	
	@RequestMapping(value="/list")
	public String list(Paging curPage, Model model) {
		logger.info("curPage : "+curPage);
		//페이징 계산
		Paging paging = reportService.getPaging(curPage);
		model.addAttribute("paging", paging);
		
		//신고 목록 조회하기.
		List<UserReport> list = reportService.getReportList(paging);
		logger.info(""+list);
		model.addAttribute("list", list);
		
		//정지사유 가져오기
		ResultReportReason rrr = reportService.getResultReason();
		model.addAttribute("resultReason", rrr);
		
		return "/report/list";
	}
	
	@RequestMapping(value="/list/sort")
	public String listSort(Paging curPage, int sortType, int sortPart, Model model) {
		logger.info("sort AJAX요청");
		logger.info("sortPart : "+sortPart);
		logger.info("sortType : "+sortType);
		logger.info("curPage : "+curPage);
		model.addAttribute("sortPart", sortPart);
		model.addAttribute("sortType", sortType);
		
		//페이징 계산
		Paging paging = reportService.getPaging(curPage);
		
		model.addAttribute("paging", paging);
		
		//sortPart
		//	0 : 신고일시
		//	1 : 회원번호
		//	2 : 신고사유
		
		//sortType
		//	0 : 오름차순ASC
		//	1 : 내림차순DESC
		List<UserReport> list;
		if( sortPart == 0) {
			if(sortType == 0) {
				list = reportService.getReportListByReportDateASC(paging);
			} else {
				list = reportService.getReportListByReportDateDESC(paging);
			}
		} else if( sortPart ==1) {
			if(sortType==0) {
				list = reportService.getReportListByUernoASC(paging);
			} else {
				list = reportService.getReportListByUsernoDESC(paging);
			}
		} else {
			if(sortType==0) {
				list = reportService.getReportByReportReasonASC(paging);
			} else {
				list = reportService.getReportByReportReasonDESC(paging);
			}
		}
		
		logger.info(""+list);
		model.addAttribute("list", list);
		
		//정지사유 가져오기
		ResultReportReason rrr = reportService.getResultReason();
		model.addAttribute("resultReason", rrr);
		
		return "/report/list_sort";
	}
	
	@RequestMapping(value="/result", method=RequestMethod.POST)
	public String doReportResult(@RequestParam HashMap<Integer, Integer> map) {
		logger.info("/report/result 전달값 : "+map);
		
		
		
		return "redirect:/report/list";
	}
}
