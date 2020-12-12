<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/css/common/common.css" >
<link rel="stylesheet" href="/resources/css/eventboard/popup.css" >
<script type="text/javascript" src="/resources/js/eventboard/popup_ajax.js" ></script>
<c:if test="${empty popupList }">
	<c:forEach items="${notPopupList }" var="list">
		<div class="eventContent nonePopupContent base_padding light_margin notSelected">
			<div article_no="${list.ARTICLE_NO }" class="">${list.ARTICLE_TITLE }</div>
			<div class="eventDate" style="font-size:0; height:0">
				<div class="pull-left" style="width:40%;">${list.START_DATE }</div>
				<div class="pull-left" style="width:40%;">${list.TERMINATE_DATE }</div>
			</div>
		</div>
	</c:forEach>
</c:if>


<c:if test="${empty notPopupList }">
	<c:forEach items="${popupList }" var="list">
		<div article_no="${list.ARTICLE_NO }" class="eventContent popupContent base_padding light_margin notSelected">
			<div class="">${list.ARTICLE_TITLE }</div>
			<div class="eventDate" style="font-size:0; height:0">
				<div class="pull-left" style="width:40%;">${list.START_DATE }</div>
				<div class="pull-left" style="width:40%;">${list.TERMINATE_DATE }</div>
			</div>
		</div>
	</c:forEach>
</c:if>