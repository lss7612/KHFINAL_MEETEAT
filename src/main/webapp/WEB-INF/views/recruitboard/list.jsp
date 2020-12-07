<%@page import="java.util.Date"%>
<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/forTest/header.jsp"/>
<link rel="stylesheet" href="/resources/css/recruitboard/list.css">
<script type="text/javascript" src="/resources/js/recruitboard/list.js"></script>



<div class="wrapper">

<div class="none-height">
	<input class="invisible" type="text" value="${searchParam.searchKeyword }" id="searchParam.searchKeyword">
	<input class="invisible" type="text" value="${searchParam.searchCategory }" id="searchParam.searchCategory">
</div>

<c:set var="now" value="<%= new Date() %>"/>
<fmt:formatDate var="fmt_now_second" value="${now }" pattern="yyyyMMddHHmmss"/>
<fmt:formatDate var="fmt_now_minute" value="${now }" pattern="yyyyMMddHHmm"/>

<h2 class=""><a href="/recruitboard/list">모집게시판</a></h2>

<hr>

<%-- + + + + + + + + + + + + + + + + 알림메시지영역 + + + + + + + + + + + + + + + + + + + +  --%>

<div id="loading" class="none-height invisible">
	<img id="" alt="로딩" src="/resources/img/loading.gif">
	<span>검색중입니다... 잠시만 기다려주세요</span>
</div>
<div id="board">

<%-- - - - - - - - - - - - - - - - - 알림메시지영역끝! -- - - -  - - - - - - - - - - - - --%>


<%-- + + + + + + + + + + + + + + + + 지역영역 + + + + + + + + + + + + + + + + + + + +  --%>
<div id="location" class="">
	<span>전체</span>
	<span>서울</span>
	<span>경기</span>
	<span>경상</span>
	<span>전라</span>
	<span>충청</span>
	<span>강원</span>
	<span>제주</span>
</div>
<div class="clearfix"></div>
<%-- - - - - - - - - - - - - - - - - 지역영역끝! -- - - -  - - - - - - - - - - - - --%>


<%-- + + + + + + + + + + + + + + + + 게시판영역 + + + + + + + + + + + + + + + + + + + +  --%>
<table id="board_table" class="table table-striped table-hover" style="margin: 0 auto;">

<thead>
<tr style="background:#ffa000">
	<th style="width:5%;"><i style="color:white;" class="fas fa-list-ol"></i></th>
	<th style="width:5%;"><i style="color:white;" class="fas fa-thumbs-up"></i></th>
	<th style="width:5%;"><i style="color:white;" class="fas fa-clock"></i></th>
	<th style="width:50%;"></th>
	<th style="width:15%;"><i style="color:white;" class="fas fa-user"></i></th>
	<th style="width:10%;"><i style="color:white;" class="fas fa-eye"></i></th>
</tr>
</thead>

<%-- TBODY영역 --%>
<tbody>

<c:forEach items="${list }" var="list">
<c:set var="origin_create_date" value="${list.CREATE_DATE }" />
<fmt:formatDate var="fmt_creat_date_second" value="${origin_create_date }" pattern="yyyyMMddHHmmss" />
<fmt:formatDate var="fmt_creat_date_minute" value="${origin_create_date }" pattern="yyyyMMddHHmm" />

<tr>
	
	<%-- 글번호 --%>
	<td>${list.ARTICLE_NO }</td>
	
	<%-- 추천수 --%>
	<td>미구현</td>
	
	
	<%-- 작성시간 --%>
	<td>
	<c:choose>
		<c:when test="${(fmt_now_second - fmt_creat_date_second) < 60 }">
			방금 전
		</c:when>
		<c:when test="${(fmt_now_second - fmt_creat_date_second) < 6000 && (fmt_now_second - fmt_creat_date_second) > 60 }">
			${fmt_now_minute-fmt_creat_date_minute }분전
		</c:when>
		<c:when test="${(fmt_now_second - fmt_creat_date_second) < 600000 && (fmt_now_second - fmt_creat_date_second) > 6000 }">
			<fmt:formatDate value="${list.CREATE_DATE }" pattern="HH:mm"/>
		</c:when>
		<c:otherwise>
			<fmt:formatDate value="${list.CREATE_DATE }" pattern="YY-MM-dd"/>
		</c:otherwise>
	</c:choose>
	</td>
	
	



	
	<%-- 글제목 --%>
	<td class="td_article_title">
	<c:if test="${(fmt_now_second - fmt_creat_date_second) < 600000 }">
		<img class="" alt="새글" src="/resources/img/new_article_icon.jpg" style="width:10px">
	</c:if>
	<a href="/recruitboard/view?board_no=3&article_no=${list.ARTICLE_NO }&searchCategory=${searchParam.searchCategory }&searchKeyword=${searchParam.searchKeyword }">
	${list.ARTICLE_TITLE } 
	</a>
	<c:if test="${list.CNT_COMMENT > 0 }">
	<c:set var="commentURI" value="?board_no=3&article_no=${list.ARTICLE_NO }&searchCategory=${searchParam.searchCategory }&searchKeyword=${searchParam.searchKeyword }"  ></c:set>
	<span class="pointer" 
	onclick="window.open('/comment/list${commentURI }','window_name','width=600,height=800,location=no,status=no,scrollbars=yes,left=40,top=20');">
	(${list.CNT_COMMENT })
	</span>
	</c:if>
	</td>
	
	<%-- 닉네임 --%>
	<td>${list.USER_NICK }</td>
	
	
	<%-- 조회수 --%>
	<td>${list.ARTICLE_HIT }</td>
</tr>
</c:forEach>
</tbody>

</table>

<c:if test="${empty list }">
<c:choose>
	<c:when test="${empty searchParam.searchCategory && empty searchParam.searchKeyword }">
		<div style="text-align:center; width:50%; margin:0 auto;" id="searchMsg">
			<br>
			<img alt="앗!!" src="/resources/img/error.jpg">
			<h4>앗.. 아직 등록된 글이 없어요</h4>
		</div>
	</c:when>
	<c:otherwise>
		<div style="text-align:center; width:50%; margin:0 auto;" id="searchMsg" >
			<br>
			<img alt="" src="/resources/img/error.jpg">
			<h4>앗.. 검색결과가 없네요...</h4>
		</div>
	</c:otherwise>
</c:choose>
</c:if>

</div>
<hr>
<%-- - - - - - - - - - - - - - - - -게시판영역끝! -- - - -  - - - - - - - - - - - - --%>



<%-- + + + + + + + + + + + + + + + + 검색영역 + + + + + + + + + + + + + + + + + + --%>

<div id="search_area">
<form action="/recruitboard/list" method="GET"  id="searchFormWidth" class="form-inline">
	<div class="form-group">
	
		<div class="none-height">
		<input type="text" name="searchBoard_no" value="3" readonly="readonly" class="invisible" />
		</div>
		<label class="sr-only" for="searchKeyword">Amount (in dollars)</label>
		<div class="input-group">
			<c:if test="${(searchParam.searchCategory eq 'article_title') || empty searchParam.searchCategory }">
				<div id="categorySelectBtn"class="input-group-addon" style="width:85px;">제목▼</div>
			</c:if>
			<c:if test="${searchParam.searchCategory eq 'article_content' }">
				<div id="categorySelectBtn"class="input-group-addon" style="width:85px;">내용▼</div>
			</c:if>
			<c:if test="${searchParam.searchCategory eq 'user_nick' }">
				<div id="categorySelectBtn"class="input-group-addon" style="width:85px;">닉네임▼</div>
			</c:if>
		<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색" alertComment="검색어" value="${searchParam.searchKeyword }">
		<div id="searchFormSubmit" class="input-group-addon"><i class="fas fa-search"></i></div>
		</div>
		
		
		<div id="categories" class="none-height invisible">
			
		<input type="radio" id="radio_article_title" name="searchCategory" value="article_title" changeText="제목▼"> 제목<br>
		<input type="radio" id="radio_article_content" name="searchCategory" value="article_content" changeText="내용▼"> 내용<br>
		<input type="radio" id="radio_user_nick" name="searchCategory" value="user_nick" changeText="닉네임▼"> 닉네임<br>
				
		</div> 
	 </div>
	 
	 
</form>
</div>
<%-- - - - - - - - - - - - - - - - -검색영역끝! -- - - -  - - - - - - - - - - - - --%>






<%-- + + + + + + + + + + + + + + + + 페이징영역 + + + + + + + + + + + + + + + + + + --%>
<div id="paging_area">
<c:import url="list_paging.jsp"></c:import>
</div>
<%-- - - - - - - - - - - - - - - - -페이징영역끝! -- - - -  - - - - - - - - - - - - --%>



<a href="/recruitboard/write"><button class="btn btn-primary pull-right">글쓰기</button></a>
</div>
</body>
</html>