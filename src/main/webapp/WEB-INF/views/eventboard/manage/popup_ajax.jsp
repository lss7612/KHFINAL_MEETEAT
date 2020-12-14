<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/css/common/common.css" >
<link rel="stylesheet" href="/resources/css/eventboard/popup.css" >



<c:if test="${empty popupList }">
	<script type="text/javascript" src="/resources/js/eventboard/notPopup_ajax.js" ></script>
	<h3>POPUP 등록</h3>
	팝업등록할 이벤트 선택
	<hr>
	<div id="ajaxList">	
	<c:forEach items="${notPopupList }" var="list">
		<div article_no="${list.ARTICLE_NO }" class="eventContent nonePopupContent base_padding light_margin notSelected">
			<div class="">[등록안됨] ${list.ARTICLE_TITLE }</div>
			<div class="eventDate" style="font-size:0; height:0">
				<div class="pull-left" style="width:40%;">시작: ${list.START_DATE }</div>
				<div class="pull-left" style="width:40%;">종료: ${list.TERMINATE_DATE }</div>
			</div>
		</div>
	</c:forEach>
	</div>
	<hr>
	<div id="popupSubmit" class="eventManageButton light_padding">
		선택반영!
	</div>
</c:if>
<c:if test="${empty notPopupList }">
	<script type="text/javascript" src="/resources/js/eventboard/popup_ajax.js" ></script>
	<h3>POPUP 해제</h3>
	팝업해제할 이벤트 선택
	<hr>
	<div id="ajaxList">	
	<c:forEach items="${popupList }" var="list">
		<div article_no="${list.ARTICLE_NO }" class="eventContent popupContent base_padding light_margin notSelected">
			<div class="">[등록됨] ${list.ARTICLE_TITLE }</div>
			<div class="eventDate" style="font-size:0; height:0">
				<div class="pull-left" style="width:40%;">${list.START_DATE }</div>
				<div class="pull-left" style="width:40%;">${list.TERMINATE_DATE }</div>
			</div>
		</div>
	</c:forEach>
	</div>
	<hr>
	<div id="popupSubmit" class="eventManageButton light_padding">
		선택반영!
	</div>
</c:if>
<hr>

