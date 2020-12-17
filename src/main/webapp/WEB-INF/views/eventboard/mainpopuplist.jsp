<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/resources/css/forTest/eventModal.css" >
<link rel="stylesheet" href="/resources/css/common/common.css" >

<script type="text/javascript">

$(document).ready(function(){
	
	$('.eventTitle').click(function(){
		let article_no = $(this).attr('article_no')
		let eventNo = $(this).attr('storedName')
		$('.eventImgBox > a').attr('href','/eventboard/view?board_no=6&article_no='+article_no)
		$('.eventImgBox > a > img').attr('src','/resources/file/recruitboard/save/'+eventNo)
	})

})


</script>

<div class="eventImgBox pull-left">
	<a href="/eventboard/view?board_no=6&article_no=${list.get(0).ARTICLE_NO }">
	<img src="/resources/file/recruitboard/save/${list.get(0).STORED_NAME }">
	</a>
</div>
<div class="eventListBox pull-left base_padding">
	<c:forEach items="${list }" var="list">
		<div article_no="${list.ARTICLE_NO }" storedName="${list.STORED_NAME }" class="eventTitle"><span style="cursor:pointer">${list.ARTICLE_TITLE }</span></div>
		<hr>
	</c:forEach>	
</div>

