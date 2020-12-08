package meeteat.controller.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import meeteat.dto.report.ResultReportReason;
import meeteat.service.report.face.ReportService;
import meeteat.util.Paging;


@Controller
@RequestMapping(value="/admin/report")
public class ReportController {

	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	@Autowired private ReportService reportService;
	
	@RequestMapping(value="/list")
	public String list(Paging curPage, Model model) {
		
		return "redirect:/admin/report/list/sort?curPage="+curPage.getCurPage()
				+"&sortType=0&sortPart=0";
	}
	
	@RequestMapping(value="/list/sort")
	public String listSort(Paging curPage, int sortType, int sortPart
			, String search, Model model) {
		logger.info("sort요청");
		logger.info("curPage : "+curPage);
		logger.info("sortPart : "+sortPart);
		logger.info("sortType : "+sortType);
		logger.info("user_id : "+search);
		
		if(search == null) {
			search = "";
		}
		model.addAttribute("sortPart", sortPart);
		model.addAttribute("sortType", sortType);
		
		//페이징 계산
		Paging paging = reportService.getPaging(curPage, search);
		model.addAttribute("paging", paging);
		
		//신고 목록 정렬
		List<HashMap<String, String>> list;
		if( search.equals("")) {
			logger.info(" > > >전체 목록 조회 < < <");
			list = sortReport(sortPart, sortType, paging);
		} else {
			logger.info(" > > >회원 ID로 검색 ("+search+")< < <"); 
			list = reportService.getListByUserId(search);
		}
		logger.info(" > > > 조회 결과 < < <");
		logger.info(""+list);
		model.addAttribute("list", list);
		
		//정지사유 가져오기
		ResultReportReason rrr = reportService.getResultReason();
		model.addAttribute("resultReason", rrr);
		
		return "/report/list_sort";
	}
	
	@RequestMapping(value="/list/sortajax")
	public String sortAjax(Paging curPage, int sortType, int sortPart
			,String search, Model model) {
		logger.info("sort요청");
		logger.info("sortPart : "+sortPart);
		logger.info("sortType : "+sortType);
		logger.info("curPage : "+curPage);
		logger.info("search : "+search);
		model.addAttribute("sortPart", sortPart);
		model.addAttribute("sortType", sortType);
		
		//페이징 계산
		Paging paging = reportService.getPaging(curPage, search);
		
		model.addAttribute("paging", paging);
		
		//sortPart
		//	0 : 신고일시
		//	1 : 회원번호
		//	2 : 신고사유
		
		//sortType
		//	0 : 오름차순ASC
		//	1 : 내림차순DESC
		
		//신고 목록 정렬 hashmap으로 변경하자.
		List<HashMap<String,String>> list = sortReport(sortPart, sortType, paging);
		
		logger.info(""+list);
		model.addAttribute("list", list);
		
		//정지사유 가져오기
		ResultReportReason rrr = reportService.getResultReason();
		model.addAttribute("resultReason", rrr);
		
		//sort값 저장하기
		model.addAttribute("sortPart", sortPart);
		model.addAttribute("sortType", sortType);
		
		return "/report/list_sort_table";
	}
	
	@RequestMapping(value="/result", method=RequestMethod.POST)
	public String doReportResult(@RequestParam HashMap<Object, Object> map) {
		//'회원번호 = 0은 처리 안함 1은 정지'
		logger.info("/report/result 전달값 : "+map);
		logger.info(""+map.entrySet());

		//신고 처리할 회원번호를 map에서 추출
		List userList = new ArrayList();
		for(Entry<Object, Object> entry : map.entrySet()) {
			System.out.println("key : "+entry.getKey()+", value : "+entry.getValue());
			int key_integer = Integer.parseInt((String) entry.getKey());
			String key = ""+key_integer;
			if( map.get(key).equals("1")) {
				logger.info(" > > >정지할 회원 "+entry.getKey()+"< < <");
				userList.add(entry.getKey());
			}
		}
		
		//추출한 회원번호 처리하기
		for(int i=0; i<userList.size(); i++) {
			//회원번호 확인
			logger.info(" > > > 정지할 회원 번호 : "+userList.get(i)+" < < <");
			
			//신고 처리 테이블에 데이터 추가하기
			reportService.reportResultSet(Integer.parseInt((String) userList.get(i)));
			
			//회원 등급을 정지 유저로 변경
			reportService.userGradeSetReportResult(Integer.parseInt( (String) userList.get(i)) );
			
			//신고 목록에서 is_processed 값을 1로 변경
			reportService.setIsProcessed( Integer.parseInt( (String) userList.get(i)) );
			logger.info(" > > >회원번호 ["+userList.get(i)+"]가 영구정지 되었습니다. < < <");
		}
		
		logger.info("정지할 유저 : "+userList);
		return "redirect:/admin/report/list";
	}
	
	@RequestMapping(value="/result/list")
	public String reportResultList(String search, Paging curPage, Model model) {
		logger.info("");
		logger.info(""+search);
		
		Paging paging = reportService.getReportResultPaging(curPage, search);
		model.addAttribute("paging", paging);
		
		List<HashMap<String,String>> list;
		if(search == null) {
			search = "";
		}
		list = reportService.getReportResultList(paging.getStartNo(), paging.getEndNo(), search);
		//페이징 계산
		
		
		//신고 처리 목록 조회하기
		
		logger.info(">> 조회 목록 <<< ");
		logger.info(""+list);
		model.addAttribute("list", list);
		
		
		
		return "/report/result_list";
	}
	
	
	//신고 목록 정렬 메소드
	public List<HashMap<String, String>> sortReport(int sortPart, int sortType, Paging paging){
		if( sortPart == 0) {
			if(sortType == 0) {
				logger.info(" > > >신고일시 정렬 : 오름차순 < < <");
				return reportService.getReportListByReportDateASC(paging);
			} else {
				logger.info(" > > >신고일시 정렬 : 내림차순 < < <");
				return reportService.getReportListByReportDateDESC(paging);
			}
		} else if( sortPart ==1) {
			if(sortType==0) {
				logger.info("> > > 회원번호 정렬 : 오름차순 < < <");
				return reportService.getReportListByUernoASC(paging);
			} else {
				logger.info("> > > 회원번호 정렬 : 내림차순 < < <");
				return reportService.getReportListByUsernoDESC(paging);
			}
		} else if(sortPart == 2 ){
			if(sortType==0) {
				logger.info(" > > > 신고 사유 정렬 : 오름차순 < < <");
				return reportService.getReportByReportReasonASC(paging);
			} else {
				logger.info(" > > > 신고 사유 정렬 : 내림차순 < < <");
				return reportService.getReportByReportReasonDESC(paging);
			}
		} else {
			return null;
		}
	}
}
