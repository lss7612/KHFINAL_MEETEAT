<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<link rel="stylesheet" href="/resources/css/common/common.css" >
<link rel="stylesheet" href="/resources/css/eventboard/holdingAndTerminate.css" >
<script type="text/javascript" src="/resources/js/eventboard/holdingAndTerminate.js" ></script>

<div id="divpage">
<div id="eventWrapper">
<c:set var="now" value="<%= new Date() %>"/>
<fmt:formatDate var="fmt_now_second" value="${now }" pattern="yyyyMMddHHmmss"/>
<fmt:formatDate var="fmt_now_minute" value="${now }" pattern="yyyyMMddHHmm"/>


<div class="bold_padding">
<h2><a href="/eventboard/holding">이벤트</a></h2>
</div>

<%-- 사이드바 부분 --%>
<div id="eventSideBar" class="pull-left vertical_bolder_padding horizontal_light_padding" >
	<div class="base_bar_height base_padding" style="font-size:1.1em; font-weight:bold">목록</div>
	<div class="base_bar_height base_padding"><a href="/eventboard/holding">진행중인 이벤트</a></div>
	<div class="base_bar_height base_padding" style="font-weight:bold"><a href="/eventboard/terminated">종료된 이벤트</a></div>
	
	<c:if test="${user_grade eq 0 }">
	<div class="base_bar_height base_padding"><a href="/eventboard/manage/popup">이벤트 팝업관리</a></div>
	</c:if>

</div>



<%-- 본문 부분 --%>
<div id="eventContent" class="pull-right light_padding">

<%-- 게시판 테이블 --%>
<table class="table table-striped" style="width:100%; margin:0 auto;">

<thead>
	<tr class="color_base">
		<th style="width:10%">no</th>
		<th style="max-width:40%;width:40%">제목</th>
		<th style="width:20%; min-width:100px">시작</th>
		<th style="width:20%; min-width:100px">종료</th>
		<c:if test="${user_grade eq 0 }">
		</c:if>
	</tr>
</thead>

<tbody>
<c:forEach items="${list }" var="list" >

<c:set var="origin_create_date" value="${list.CREATE_DATE }" />
<fmt:formatDate var="fmt_creat_date_second" value="${origin_create_date }" pattern="yyyyMMddHHmmss" />
<fmt:formatDate var="fmt_creat_date_minute" value="${origin_create_date }" pattern="yyyyMMddHHmm" />


	<tr>
		<td style="width:10%">${list.ARTICLE_NO }</td>
		
		<td class="td_article_title" style="max-width:40%;width:40%"> 
			<span class="pull-left" style="max-width:85%">
			<a href="/eventboard/view?board_no=6&article_no=${list.ARTICLE_NO }&searchCategory=${searchParam.searchCategory }&searchKeyword=${searchParam.searchKeyword }&searchLocation=${searchParam.searchLocation }&curPage=${curPage}">
				&nbsp;${list.ARTICLE_TITLE }
			</a>
			</span>
			
			<div class="pull-left" style="min-width:30px; width:10%;">
				<c:if test="${list.CNT_COMMENT > 0 }">
				<c:set var="commentURI" value="?board_no=3&article_no=${list.ARTICLE_NO }&searchCategory=${searchParam.searchCategory }&searchKeyword=${searchParam.searchKeyword }"  ></c:set>
					<span class="pointer" >
					(${list.CNT_COMMENT })
					</span>
				</c:if>
				<c:if test="${(fmt_now_second - fmt_creat_date_second) < 600000 }">
					<img class="" alt="새글" src="/resources/img/new_article_icon.jpg" style="width:10px">
				</c:if>
			</div>
			 
		</td>
		
		<td style="width:15%"><fmt:formatDate value="${list.START_DATE }" pattern="yyyy-MM-dd" /></td>
		
		<td style="width:15%"><fmt:formatDate value="${list.TERMINATE_DATE }" pattern="yyyy-MM-dd" /></td>
		
		<c:if test="${user_grade eq 0 }">
		</c:if>
		
	</tr>
</c:forEach>
</tbody>

</table>
<%-- 버튼부분 --%>
<c:if test="${user_grade eq 0 }">
<div class="light_padding">
<a href="/eventboard/manage/write"><button type="button" class="btn btn-primary pull-right" style="">이벤트 등록</button></a>
</div>
</c:if>
</div>


<%-- 페이징 부분 --%>
<div>
	<c:import url="terminated_paging.jsp"></c:import>
</div>


<div class="clearfix"></div>
</div><%-- Wrapper END --%>
</div><%-- divpage END --%>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>