<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/forTest/header.jsp"/>
<link rel="stylesheet" href="/resources/css/common/common.css" >
<link rel="stylesheet" href="/resources/css/eventboard/popup.css" >
<script type="text/javascript" src="/resources/js/eventboard/popup.js" ></script>


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
	
	<%--위쪽 박스 --%>
	<div>
	팝업 등록<br>
	팝업 해제
	</div>
	
	<%--왼쪽 박스 --%>
	<div id="popup" class="workBox pull-left bold_padding">
		
		<h3>NON_POPUP</h3>
		팝업등록할 이벤트 선택
		<hr>
		
		<div id="notPopupList">
		<div style="text-align:center;">
		<img src="/resources/img/loading.gif">
		</div>
		</div>
		
	</div>
	
	
	<%--중간 박스 --%>
	<div id="popupOperator" class="pull-left"><div style="height:250px; padding-left:15px;padding-top:190px">
	
	<i id="add" style="cursor:pointer; font-size:50px;" class="fas fa-plus-square"></i>
	
	</div><div style="cursor:pointer;height:250px; padding-left:15px;padding-bottom:190px">
	
	<i id="delete" style="font-size:50px;" class="fas fa-minus-square"></i>
	
	</div></div>
	
	
	
	<%--오른쪽 박스 --%>
	<div id="notPopup" class="workBox pull-left bold_padding">
	
		<h3>POPUP</h3>
		팝업해제할 이벤트 선택
		<hr>
		
		<div id="popupList">
		<div style="text-align:center;">
		<img src="/resources/img/loading.gif">
		</div>
		</div>
		
	</div>
	
	
	
</div>
	<button>적용</button>



</div>

</body>
</html>