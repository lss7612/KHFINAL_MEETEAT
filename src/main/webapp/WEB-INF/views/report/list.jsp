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
function selectValue(str){
	console.log(str+"을 선택")
	
	$.ajax({
		type : "get"
		, url : "/report/list/sort"
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
// $("#sortPart").change(function(){
// 	console.log(this.value);
// })
// $("#sortType").change(function(){
// 	console.log(this.value);
// })
</script>
</head>
<body>

<h1>신고 목록</h1>
<hr>
<div>
 정렬기준 
<select id="sortPart" name ="part" onchange="selectValue(this.value)">
	<option value="0">신고일시</option> 	
	<option value="1">회원번호 </option> 	
	<option value="2">신고사유</option> 	
</select>
방향
<select id="sortType" name="sort" onchange="selectValue(this.value)">
	<option value="0">오름차순</option>
	<option value="1">내림차순</option>
</select> 
</div>

<div id="tableview">
	<jsp:include page="/WEB-INF/views/report/list_report.jsp"/>
</div>


</body>
</html>