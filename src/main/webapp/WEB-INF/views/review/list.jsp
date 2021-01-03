<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
	
	white-space:nowrap;	
	text-overflow: ellipsis;
	overflow: hidden;
}

.titlecss {
	padding-left: 10px;
}


.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
	line-height: 1.8;
	height: 35px;
}
</style>

<style type="text/css">
/* 회원 아이디 클릭시 나타나는 목록 CSS */
.userMenu{
	display : inline-block;
	width : 100%;
	position : relative;
}

.userNickMenu{
	cursor : pointer;
}

.userHiddenMenu{ 
	list-style:none;
   	display:none;
	position : absolute; 
	z-index : 1;
} 

.userHiddenMenu > li{
	background-color : #F5DA81;
	position : relative;
	cursor : pointer;
	border : solid 0px;
	padding: 5px 10px 5px 10px;
}

.userHiddenMenu > li:hover{
	background-color : #eee;
}
/* 회원 아이디 클릭시 나타나는 목록 CSS 끝*/
</style>

<script type="text/javascript">
//작성자 정보 누르면 채팅메뉴 나타나게 동작하는 스크립트
$(document).ready(function(){
	//userMenu mouseleave event
	$(".userMenu").mouseleave(function(){
		if($(".userHiddenMenu").is(":visible")){
			console.log("hidden menu close")
			$(".userHiddenMenu").slideUp();
		}
	})
	
	$(".userMenu>span").click(function(){
		
		var submenu = $(this).next().next("ul");
		if(submenu.is(":visible")){
			submenu.slideUp();
		} else{
			$(".userMenu > ul").slideUp();
			submenu.slideDown();
			//슬라이드 메뉴 조정할려면 left의 style값을 변경하면 됩니다.
			$(submenu).css({"display" : "inline-block", "left" : "100px"});
		}
	})
	
})
//작성자 정보 누르면 채팅메뉴 나타나게 동작하는 스크립트 끝


//채팅하기 클릭시 동작하는 스크립트
function createChat(e){
	var user_no = $(e).attr("user_no")
	var loginUserNo = $(e).attr("loginUserNo")
	if(loginUserNo == user_no){
		alert("자기 자신과는 대화할 수 없습니다!")
		return false;
	} else {
		window.open("http://localhost:8088/chat/create?user_no="+user_no, "chatCreate"
				, "width = 710px, height = 665px");
	}
}
//채팅하기 클릭시 동작하는 스크립트 끝
</script>

<div class="container" id="divpage">

<h3 class="pull-left">파티 후기</h3>

<div class="clearfix"></div>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%">글번호</th>
		<th style="width: 45%">제목</th>
		<th style="width: 20%">작성자</th>
		<th style="width: 10%">조회수</th>
		<th style="width: 15%">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="list">
	<tr>
		<td>${list.ARTICLE_NO }</td>
		<td><a href="/review/view?board_no=${list.BOARD_NO }&article_no=${list.ARTICLE_NO }" class="titlecss">${list.ARTICLE_TITLE }</a></td>
		<td>
		<div class="userMenu">
		<span class="userNickMenu">${list.USER_NICK }
		</span>
			<br>
			<ul class="userHiddenMenu" >
				<li onclick="createChat(this);" loginUserNo="${user_no }" user_no="${list.USER_NO }">채팅하기</li>
			</ul>
		</div>
		</td>
		<td>${list.ARTICLE_HIT }</td>
		<td><fmt:formatDate value="${list.CREATE_DATE }" pattern="yy-MM-dd HH:mm" /></td>
	</tr>
</c:forEach>
</tbody>
</table>


<a href="/review/write"><button class="btn btn-primary pull-right">글쓰기</button></a>
<%-- <span class="pull-left">total : ${paging.totalCount }</span> --%>

<div class="clearfix"></div>

<form action="/review/list" method="get" class="form-inline text-center">
	<div class="searchbox form-group form-group-sm ">
		<select class="search form-control" style="width: 100px;" name="review_search" id="review_search">
			<option value="article_title" 
				<c:if test="${reviewSearch.review_search == 'article_title' }">selected</c:if>>제목</option>		
			<option value="article_content" 
				<c:if test="${reviewSearch.review_search == 'article_content' }">selected</c:if>>내용</option>		
			<option value="user_nick" 
				<c:if test="${reviewSearch.review_search == 'user_nick' }">selected</c:if>>작성자</option>		
		</select>
	</div>
	
	<div class="form-group form-group-sm">
		<input type="text" class="form-control" name="review_keyword" id="review_keyword" value="${reviewSearch.review_keyword }" />
		<button type="submit" class="btn btn-sm" id="btnsearch" value="검색">검색</button>
	</div>
</form>

<jsp:include page="/WEB-INF/views/review/paging.jsp" />



</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
