<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/resources/css/main/memberpreview.css"></link>
<link rel="stylesheet" href="/resources/css/common/common.css"></link>
<script type="text/javascript" src="/resources/js/main/memberpreview.js" ></script>

<div class="bold_height_bar color_primary base_padding" style="text-align:center;">
<span style="font-size:1.5em">미리보기입니다.</span>
</div>
<%-- 회원 수 및 게시글 수 표시 --%>
<div>
<div id="animatedDivs" 
	style='overflow:hidden;
	height:400px;
	background-size: 30%;
	background-repeat: no-repeat;'
class="subDiv">
	이미지 미리보기
	
	<div class="animatedNumbers" class="pull-left" style="float:left;width:45%;">
	
	
	
	</div>
	
</div>
</div>
<div class="clearfix"></div>






<%-- 인기 게시물 표시 박스 --%>
<div>
<div id="popularArticle" class="subDiv subArticleDiv">

	<div class="bolder_bar_height vertical_base_padding title"><i class="fas fa-chart-line"></i> 최고 인기 TOP10</div>
	<div class="bold_bar_height vertical_light_padding sub_title">일주일간 가장 추천을 많이 받은 모임정보에요</div>
	<div class="contentTitle">
		<table class="table table-striped table-hover">
			<thead>
				<tr class="color_primary light_bar_height">
					<th style="width:30%">게시판명</th>
					<th style="width:50%">제목</th>
					<th style="width:20%">작성자</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${popularList }" var="list">
				<tr class="light_bar_height">
					<td style="width:30%">${list.BOARD_NAME }</td>
					
					<td style="width:50%">
					
					<c:choose>
						<%-- 파티모집게시판 --%>
						<c:when test="${list.BOARD_NO eq 3}">
						<a href="/recruitboard/view?board_no=${list.BOARD_NO }&article_no=${list.ARTICLE_NO}">
						<span>${list.ARTICLE_TITLE }</span>
						</a>
						</c:when>
						<%-- 메이트찾기게시판 --%>
						<c:when test="${list.BOARD_NO eq 2}">
						<a href="/matefind/view?article_no=${list.ARTICLE_NO }">
						<span>${list.ARTICLE_TITLE }</span>
						</a>
						</c:when>
						<%-- 후기게시판 --%>
						<c:when test="${list.BOARD_NO eq 4}">
						<a href="/review/view?article_no=${list.ARTICLE_NO }">
						<span>${list.ARTICLE_TITLE }</span>
						</a>
						</c:when>
						<c:otherwise>
						<a href="#">
						<span>${list.ARTICLE_TITLE }</span>
						</a>
						</c:otherwise>
					</c:choose>
					
					</td>
					
					<td style="width:20%">${list.USER_NICK }</td>
				</tr>
			</c:forEach>
			</tbody>		
		</table>
	</div>

</div>
</div>









