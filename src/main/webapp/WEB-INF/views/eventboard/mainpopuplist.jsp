<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/resources/css/forTest/eventModal.css" >
<link rel="stylesheet" href="/resources/css/common/common.css" >

<script type="text/javascript">

$(document).ready(function(){
	
	$('.eventTitle').click(function(){
		
		$('.eventTitle').css('font-weight','normal')
		$(this).css('font-weight','bold')
		
		let article_no = $(this).attr('article_no')
		let eventNo = $(this).attr('storedName')
		
		$('.eventImgBox > a').attr('href','/eventboard/view?board_no=6&article_no='+article_no)
		
		if(eventNo != ""){
			$('.eventImgBox > a > img').attr('src','/resources/file/recruitboard/save/'+eventNo)
		}else{
			$('.eventImgBox > a > img').attr('src','/resources/img/forNullEventImg.png')
		}
	})

})


</script>

<div class="eventImgBox pull-left">
	<c:choose>
	<c:when test="${not empty list.get(0).STORED_NAME }">
		<a href="/eventboard/view?board_no=6&article_no=${list.get(0).ARTICLE_NO }">
		<img class="eventPopupImg" src="/resources/file/recruitboard/save/${list.get(0).STORED_NAME }">
		</a>
	</c:when>
	<c:otherwise>
		<a href="/eventboard/view?board_no=6&article_no=${list.get(0).ARTICLE_NO }">
		<img class="eventPopupImg" src="/resources/img/forNullEventImg.png">
		</a>
	</c:otherwise>
	</c:choose>
</div>
<div class="eventListBox pull-left base_padding">
	<c:forEach items="${list }" var="list" varStatus="stat">
		<c:choose>
			<c:when test="${stat.index eq 0}">
				<div article_no="${list.ARTICLE_NO }" storedName="${list.STORED_NAME }" class="eventTitle" style=" font-weight:bold;"><span style="cursor:pointer;">${list.ARTICLE_TITLE }</span></div>
				<hr>
			</c:when>
			<c:otherwise>
				<div article_no="${list.ARTICLE_NO }" storedName="${list.STORED_NAME }" class="eventTitle"><span style="cursor:pointer">${list.ARTICLE_TITLE }</span></div>
				<hr>
			</c:otherwise>
		</c:choose>
	</c:forEach>	
</div>

