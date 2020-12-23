<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	//검색 버틀 클릭
	$("#btnSearch").click(function() {
		
		if($("#search").value()==null){
			alert("검색어를 입력해주세요");
			return;
		}else{
		location.href="/mypage/mypost?search="+$("#search").val();
		}
	});
	
	$("#deleteBtn").click(function(){
		if($('#checkbox').value()==null){
			alert("선택하신 글이 없습니다");
			return;
		}else{
		location.href="/mypage/mypost";
			
		}
	})
})
</script>

<style type="text/css">
table {
 	table-layout: fixed;
 	max-width: 90% 
}

table, th, td {
	text-align: center;
}
td:nth-child(4) {
	white-space: nowrap;	
	text-overflow: ellipsis;
	overflow: hidden;
}
td:nth-child(5) {
	text-align: left;
	
	white-space:nowrap;	
	text-overflow: ellipsis;
	overflow: hidden;
}

.sh_header {
	top: -4px;
	right: -4px;
	padding: 5px;
	padding: 5px;
/* 	line-height: 19px; */
/* 	letter-spacing: 3px; */
	color: #666;
}
th{
	background-color: #F5DA81;
}
</style>


<div id="divpage">
<div class="sh_header">
	<h2>내가 작성한 글</h2>
</div>

<div id="searchForm" style="text-align: right;">
<form action="/mypage/mypost" method="GET">
<select id ="category" name="category">
    <option value="">전체</option>
    <option value="메이트">메이트찾기</option>
    <option value="모집">모집</option>
    <option value="후기">후기</option>
    <option value="문의">문의</option>
</select>

<input type="text" id="search" name="search" placeholder="제목+내용 검색"/>
<button class="btn">검색</button>
</form>

</div><br>

<form action="/mypage/mypost" method="POST">
<table class="table table-condensed"	>
   <tr>
      <th style="width: 5%">선택</th>
      <th style="width: 5%">글번호</th>
      <th style="width: 15%">게시판 이름</th>
      <th style="width: 15%">글 제목</th>
      <th style="width: 45%">글 내용</th>
      <th style="width: 15%">작성일</th>
   </tr>
<c:forEach items="${myAllPList}" var="b">
   <tr>
      <td>
      	<input type="checkbox" name="checkbox" id="checkbox" value="${b.ARTICLE_NO}">
      </td>
      <td>${b.ARTICLE_NO }</td>
      <td>${b.BOARD_NAME}</td>
      <td>${b.ARTICLE_TITLE}</td>
      <td>${b.ARTICLE_CONTENT}</td>
      <td><fmt:formatDate value="${b.CREATE_DATE}" pattern="yy/MM/dd HH:mm"/></td>
   </tr>
</c:forEach>
</table>
<button class="btn btn-danger btn-sm pull-right" id="deleteBtn">선택한 게시글 삭제</button>
**선택 게시글  아직 미완성,, 바로삭제됨
</form>

 
<div class="form-inline">
<button onclick="location.href='/mypage/mypage'" class="btn btn-primary btn-sm pull-left">돌아가기</button>
 </div>

<jsp:include page="/WEB-INF/views/mypage/mypost_paging.jsp" />


</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
    