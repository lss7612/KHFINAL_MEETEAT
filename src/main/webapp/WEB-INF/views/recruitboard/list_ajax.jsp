<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/resources/css/recruitboard/list.css">
<script type="text/javascript" src="/resources/js/recruitboard/list.js"></script>


<%-- + + + + + + + + + + + + + + + + 게시판영역 + + + + + + + + + + + + + + + + + + + +  --%>
searchParam ${searchParam }
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
	<td>${list.CNT_RECOMMEND }</td>
	
	
	<c:set var="now" value="<%= new Date() %>"/>
	<fmt:formatDate var="fmt_now_second" value="${now }" pattern="yyyyMMddHHmmss"/>
	<fmt:formatDate var="fmt_now_minute" value="${now }" pattern="yyyyMMddHHmm"/>
	
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
	
	

	<c:if test="${empty paging.curPage }">
	<c:set var="curPage" value="1"/>
	</c:if>
	<c:if test="${paging.curPage ne null }">
	<c:set var="curPage" value="${paging.curPage }"/>
	</c:if>
	<%-- 글제목 --%>
	<td class="td_article_title">
	<span class="pull-left" style="max-width:85%">
		<a href="/recruitboard/view?board_no=3&article_no=${list.ARTICLE_NO }&searchCategory=${searchParam.searchCategory }&searchKeyword=${searchParam.searchKeyword }&searchLocation=${searchParam.searchLocation }&curPage=${curPage}">
		<%--지역태그보여주기 --%>
		<c:if test="${empty searchParam.searchLocation }">
		<span style="font-weight:bold">[${list.PARTY_LOCATION }]</span>
		</c:if>
		<c:if test="${searchParam.searchLocation != ''}">
		<span style="font-weight:bold; color:tomato;">[${list.PARTY_LOCATION }]</span>
		</c:if>
		<%--글제목부분 --%>
		<c:choose>
		<c:when test="${article_no eq list.ARTICLE_NO }">
		<span style="font-weight:bolder; color:orange;">&nbsp;${list.ARTICLE_TITLE }</span> 
		</c:when>
		<c:otherwise>
		&nbsp;${list.ARTICLE_TITLE } 
		</c:otherwise>
		</c:choose>
		</a>
	</span>
	
	<%-- 글제목에 코멘트 개수 표시 --%>
	<div class="pull-left" style="min-width:30px; width:10%;">
		<c:if test="${list.CNT_COMMENT > 0 }">
			<c:set var="commentURI" value="?board_no=3&article_no=${list.ARTICLE_NO }&searchCategory=${searchParam.searchCategory }&searchKeyword=${searchParam.searchKeyword }"  ></c:set>
				<span class="pointer" 
				onclick="window.open('/comment/list${commentURI }','window_name','width=600,height=800,location=no,status=no,scrollbars=yes,left=40,top=20');">
				(${list.CNT_COMMENT })
				</span>
		</c:if>
		<c:if test="${(fmt_now_second - fmt_creat_date_second) < 600000 }">
			<img class="" alt="새글" src="/resources/img/new_article_icon.jpg" style="width:10px">
	</c:if>
	</div>
	
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
		<%-- 보이지 않는 폼 영역 --%>	
		<div class="none-height">
		<input type="text" name="searchBoard_no" value="3" readonly="readonly" class="invisible" />
		<input type="text" class="invisible" id="searchLocation" name="searchLocation" value="${searchParam.searchLocation }">
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
			
		<%-- 검색 input 영역 --%>
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