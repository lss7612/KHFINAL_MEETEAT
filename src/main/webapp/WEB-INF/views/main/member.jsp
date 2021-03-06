<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/headerForMember.jsp"/>
<link rel="stylesheet" href="/resources/css/main/member.css"></link>
<link rel="stylesheet" href="/resources/css/common/common.css"></link>
<script type="text/javascript" src="/resources/js/main/member.js" ></script>
<div id="divpage">


<c:if test="${sessionScope.user_grade eq 0 }">

<div id="goToImgChange" style="width:20%; border: 1px solid #ccc; border-radius: 10px; text-align:center; cursor:pointer;" class="pull-right lighter_bar_height lighter_padding">
메인 이미지 변경
</div>

<div class="clearfix"></div>
</c:if>

<%-- 회원 수 및 게시글 수 표시 --%>
<div>
<div id="animatedDivs" class="subDiv">
	<div class="animatedNumbers" class="pull-left" style="float:left;width:45%;">
	
		<div class="">	
			<div class="sub_title">
			<div class="title"><span>MEETEAT의</span></div> 
			<c:forEach begin="0" end="${userBoxCnt - 1}" var="i">
				<div id="userNumberBox${i }" style="float:left" class="numberBox" boxCnt="${userBoxCnt }">${cntUsers_arr.get(i) }</div>
			</c:forEach>
			<div class="clearfix"></div>
			<div><span>명의 회원들이</span></div>
			</div>
		</div>
	
	</div>
	
	<div class="animatedNumbers" class="pull-right" style="float:right;width:45%;text-align:right;">
	
		<div class="">	
		<br><br>
			<div class="sub_title">
			<div class="title"><span>총</span></div> 
			
			<c:if test="${AppointmentBoxCnt eq 0 }">
				<div id="appointmentNumberBox0" style="float:right" class="numberBox" boxCnt="1">0</div>
			</c:if>
			<c:if test="${AppointmentBoxCnt > 0 }">			
			<c:forEach begin="0" end="${AppointmentBoxCnt - 1}" var="i">
				<div id="appointmentNumberBox${i }" style="float:right" class="numberBox" boxCnt="${AppointmentBoxCnt }">${cntAppointment_arr.get(i) }</div>
			</c:forEach>
			</c:if>
			
			<div class="clearfix"></div>
			<div><span>개의 모임을 만들고 즐겼어요!</span></div>
			</div>
		</div>
	
	</div>
	
</div>
</div>
<div class="clearfix"></div>






<%-- 인기 게시물 표시 박스 --%>
<div>
<div id="popularArticle" class="subDiv subArticleDiv">

	<div class="bolder_bar_height vertical_base_padding title"><i class="fas fa-chart-line"></i> 주간 최고 인기 TOP10</div>
	<div class="bold_bar_height vertical_light_padding sub_title"><b>[${user_nick }]</b>님께 추천드릴 주간 최다 추천 모임정보에요</div>
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
					<td style="width:30%">
					<c:choose>
						<c:when test="${list.BOARD_NO eq 3}">
						<a href="/recruitboard/list"><span>${list.BOARD_NAME }</span></a>
						</c:when>
						<c:when test="${list.BOARD_NO eq 2}">
						<a href="/matefind/filterlist?curPage=0&party_location=&category=&meet_time="><span>${list.BOARD_NAME }</span></a>
						</c:when>
						<c:when test="${list.BOARD_NO eq 4}">
						<a href="/review/list"><span>${list.BOARD_NAME }</span></a>
						</c:when>
					</c:choose>
					</td>
					
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



<%-- 많이 본 게시물 표시 박스 --%>
<div>
<div id="popularArticle" class="subDiv subArticleDiv">

	<div class="bolder_bar_height vertical_base_padding title"><i class="fas fa-users"></i> 주간 최고 조회수 TOP10</div>
	<div class="bold_bar_height vertical_light_padding sub_title"><b>[${user_nick }]</b>님께 추천드릴 주간 최다 조회 모임정보에요</div>
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
			<c:forEach items="${mostViewList }" var="list">
				<tr class="light_bar_height">
					<td style="width:30%">
					<c:choose>
						<c:when test="${list.BOARD_NO eq 3}">
						<a href="/recruitboard/list"><span>${list.BOARD_NAME }</span></a>
						</c:when>
						<c:when test="${list.BOARD_NO eq 2}">
						<a href="/matefind/filterlist?curPage=0&party_location=&category=&meet_time="><span>${list.BOARD_NAME }</span></a>
						</c:when>
						<c:when test="${list.BOARD_NO eq 4}">
						<a href="/review/list"><span>${list.BOARD_NAME }</span></a>
						</c:when>
					</c:choose>
					</td>
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






</div>



<c:import url="/WEB-INF/views/layout/footer.jsp"/>