$(document).ready(function() {
	
	console.log('${boardAdminParam}')
	if('${boardAdminParam.manageCategory}'==$("#manageCategory > option").val())
		$(this).attr('selected','selected')
		
	
// 전체,선택 삭제 기능
	$(function() {
		var chkObj = document.getElementsByName("delmod");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function() {
			var chk_listArr = $("input[name='delmod']");
			for(var i=0; i<chk_listArr.length; i++) {
				chk_listArr[i].checked = this.checked;
			}
		})
		
		$("input[name='delmod']").click(function(){
			if($("input[name='delmod']:checked").length == rowCnt) {
				$("input[name='allCheck']")[0].checked = true;
			}
			else {
				$("input[name='allCheck']")[0].checked = false;	
			}
		})
	});
	
	
// 기간별 검색 스크립트
	 $(function() {
		 
		    // 시작 날짜와 끝나는 날짜를 지정한다. (기본 설정)
		    var start_date = moment().subtract(29, 'days');
			var end_date = moment();
		    
		    function cb(start_date, end_date) {
		
		        $('#reportrange span').html(start_date.format('YY-MM-DD') + ' - ' + end_date.format('YY-MM-DD'));
		    }
		    
		
		    $('#reportrange').daterangepicker({
		        'startDate' :  start_date,
		        'endDate' : end_date,
		        ranges : {
		            '오늘' : [ moment(), moment() ],
		            '어제' : [ moment().subtract(1, 'days'), moment().subtract(1, 'days') ],
		            '지난 7일' : [ moment().subtract(6, 'days'), moment() ],
		            '지난 30일' : [ moment().subtract(29, 'days'), moment() ],
		            '이번 달' : [ moment().startOf('month'), moment().endOf('month') ],
		            '지난 달' : [ moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month') ]
		        },
		    }, cb);
		    
		    $('#reportrange').on('apply.daterangepicker', (e, picker) => {
		        console.log('The value has changed.');
		      });
		    
		    cb(start_date, end_date);
		    
		});
		
})


function isDelete() {

	var url = "delete";
	var boardNoArr = new Array();
	var articleNoArr = new Array();
	var list = $("input[name='delmod']");
	for (var i=0; i<list.length; i++){
		if(list[i].checked) {
			
			console.log("article_no : " + list[i].value);
			
			boardNoArr.push(list.eq(i).attr("board_no"));
			
			var x = list.eq(i).val()
			console.log(x);
			
			articleNoArr.push(list[i].value);
			
		}
	}

	console.log(boardNoArr);
	console.log(articleNoArr);
	
	if (articleNoArr.length == 0 ) {
		alert("선택된 글이 없습니다.");
	}
	else {
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url : url
				, type : 'POST'
				, async: false
				, tranditional : true
				, data : {
					articleNoArr : articleNoArr
					, boardNoArr : boardNoArr
				}
				, success : function(is_delete){
					if(is_delete = 1) {
						alert("삭제가 완료되었습니다.");
						location.replace("list")
					}
					else {
						alert("삭제를 실패하였습니다.");
					}
				}
			})
		}
	}
}


function dateSearch() {
	
	var start_date = $("input[name=daterangepicker_start]").val();
	var end_date = $("input[name=daterangepicker_end]").val();
	var manageCategory = $("select[name=manageCategory]").val();
	var manageKeyword = $("input[name=manageKeyword]").val();
	var manageSearch = $("select[name=manageSearch]").val();
	
	$.ajax({
		url: "/admin/board/list"
		, type: "GET"
		, data: {
			start_date : start_date
			, end_date : end_date
			, manageCategory : manageCategory
			, manageKeyword : manageKeyword
			, manageSearch : manageSearch
		}
		, success: function(dateSearch) {
			console.log("성공");
		}
		, error : function (dateSearch) {
			console.log("실패");
		}
	})
	
    location.href = '/admin/board/list?manageCategory='+manageCategory+'&manageKeyword='+manageKeyword+'&manageSearch='+manageSearch+'&start_date='+start_date+'&end_date='+end_date;
}