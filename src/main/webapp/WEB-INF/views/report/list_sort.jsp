<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#searchBtn").click(function(){
		var search = $('#search').val();
		console.log(""+search);
		location.href="/report/list/sort?curPage=0&sortType=0&sortPart=0&search="+search;
	})
	
})
	function selectValue(str){
		console.log(str+"을 선택")
		
		$.ajax({
			type : "get"
			, url : "/report/list/sortajax"
			, data : {
				sortPart : $("#sortPart option:selected").val()
				, sortType : $("#sortType option:selected").val()
				, curPage : "${paging.curPage}"
			}
			, dataType : "html"
			, success : function(res){
				console.log('요청성공')
				console.log(res)
				$("#tableview").empty();
				$("#tableview").append(res);
			}
			, error : function(){
				console.log('실패')
			}
		})
	}


</script>
</head>
<body>

<h1><a href="/report/list">신고 목록</a></h1>
<hr>
<div id="tableview">
<c:import url="/WEB-INF/views/report/list_sort_table.jsp"/>
</div>
</body>
</html>