<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/resources/css/forTest/eventModal.css" >
<link rel="stylesheet" href="/resources/css/common/common.css" >
<script type="text/javascript" src="/resources/js/forTest/eventModal.js" ></script>


<div id="eventModalWrapper" class="">
	
	<div id="modalExitButtonDiv"><i class="fas fa-times"></i></div>
	
	<div id="centerDiv">
		<div class="pull-left left">왼쪽</div>
		<div class="eventImgBox pull-left">
			<img src="/resources/img/eventDemo.jpg">
		</div>
		<div class="pull-left right">오른쪽</div>
	
	</div>
	
	<div id="deleteTodayButton" style="cursor:pointer;">오늘하루는 보지않기(미구현)</div>
	
</div>