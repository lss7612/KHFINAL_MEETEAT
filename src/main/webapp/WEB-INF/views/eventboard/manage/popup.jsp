<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>
<link rel="stylesheet" href="/resources/css/common/common.css" >
<link rel="stylesheet" href="/resources/css/eventboard/popup.css" >
<script type="text/javascript" src="/resources/js/eventboard/popup.js" ></script>

<div id="divpage">
<div id="popupManageWrapper">

<div>
<h2>이벤트</h2>
</div>

<%-- 사이드바 부분 --%>
<div id="eventSideBar" class="pull-left vertical_bolder_padding horizontal_light_padding" >
	<div class="base_bar_height base_padding" style="font-size:1.1em; font-weight:bold">목록</div>
	<div class="base_bar_height base_padding"><a href="/eventboard/holding">진행중인 이벤트</a></div>
	<div class="base_bar_height base_padding"><a href="/eventboard/terminated">종료된 이벤트</a></div>
	
	<c:if test="${user_grade eq 0 }">
	<div class="base_bar_height base_padding" style="font-weight:bold"><a href="/eventboard/manage/popup">이벤트 팝업관리</a></div>
	</c:if>

</div>

<div id="workBoxes" class="base_padding pull-right" style="">
	
	
	<%--왼쪽 박스 --%>
	<div id="popup" class="workBox bold_padding">
		
		<div id="addOrDelete" class="light_padding eventManageButton">팝업 해제화면으로 전환</div>
		<hr>
		
		<div id="List">
			<div style="text-align:center;">
			<img src="/resources/img/loading.gif">
			</div>
		</div>
	</div>
	
</div>

<div class="clearfix"></div>

</div><%-- popupManageWrapper END --%>
</div><%-- divpage --%>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>