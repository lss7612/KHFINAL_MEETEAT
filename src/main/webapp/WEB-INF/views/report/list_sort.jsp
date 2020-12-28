<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/report/list_sort.css" />
<script type="text/javascript">

function searchBtnclick(){
	console.log("아이디 검색 시작")
	var search = $('#search').val();
	console.log(""+search);
	location.href="/admin/report/list/sort?curPage=0&sortType=0&sortPart=0&search="+search;
}

function enterKey(){
	if(window.event.keyCode == 13){
		searchBtnclick();
	}
}


//정렬기준, 방향 실시간 적용 AJAX
function selectValue(str){
	console.log(str+"을 선택")
	
	$.ajax({
		type : "get"
		, url : "/admin/report/list/sortajax"
		, data : {
			sortPart : $("#sortPart option:selected").val()
			, sortType : $("#sortType option:selected").val()
			, curPage : "${paging.curPage}"
			, search : $("#search").val()
		}
		, dataType : "html"
		, success : function(res){
			//console.log('요청성공')
			//console.log(res)
			$("#tableview").empty();
			$("#tableview").append(res);
		}
		, error : function(){
			console.log('실패')
		}
	})
}

function doUserProcess(){
	var state = confirm("해당 유저를 영구정지 하시겠습니까?")
	if (state){
		alert("처리가 완료되었습니다.")
		reportResultForm.submit();
	} else {
		return false;
	}
	
}

</script>

<div id="divpage">
	<h1><a href="/admin/report/list">신고 목록</a></h1>
	<hr>
	<div id="tableview">
	<c:import url="/WEB-INF/views/report/list_sort_table.jsp"/>
	</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>
