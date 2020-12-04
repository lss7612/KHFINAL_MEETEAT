<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/resources/css/recruitboard/view.css">

<div>
<hr>

<c:forEach items="${list }" var="list" >
<div class="border vertical_base_margin" >
	<div class="light_padding color_base light_bar_height">
		<div class=".col-md-4 pull-left">
			<span>${list.USER_NICK }</span>
		</div>
		<div class=".col-md-4 pull-right" style="text-align:center;">
			<span class="horizontal_light_margin">
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