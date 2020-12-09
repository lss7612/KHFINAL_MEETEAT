<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/resources/css/recruitboard/view.css">
<link rel="stylesheet" href="/resources/css/recruitboard/comment_ajax.css">
<script type="text/javascript" src="/resources/js/recruitboard/comment_ajax.js"></script>

<div>
<hr>

<c:forEach items="${list }" var="list" >
<div class="border vertical_base_margin comment_lump" >

	<div class="light_padding color_base light_bar_height">
	
		<div id="" class=".col-md-4 pull-left commendWriter">
			<c:if test="${user_nick eq list.USER_NICK }">
				<i style="color:blue; "class="fas fa-user-edit"></i>
			</c:if>
			<span>${list.USER_NICK }</span>
		</div>
		<div id="" class=".col-md-4 pull-right commendFunction"  style="text-align:center;">
			<c:if test="${user_nick eq list.USER_NICK }">
				<span id="updateComment" class=" toggle_invisible invisible none_width">수정</span>
				<span id="deleteComment" class=" toggle_invisible invisible none_width">삭제</span>
			</c:if>
			<span id="" class=" toggle_invisible invisible none_width">답글</span>
			<span class="toggle_invisible ">
			<fmt:formatDate value="${list.CREATE_DATE }" pattern="yy/MM/dd hh:mm" />
			</span>
		</div>
		
	</div>
	
	<div class='clearfix'></div>
	
	<div class="base_padding">
		<span>${list.COMMENT_CONTENT }</span>
	</div>
	
</div>
</c:forEach>
</div>