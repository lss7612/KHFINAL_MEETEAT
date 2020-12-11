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



<div id="workBoxes" class="base_padding">


	<div id="popup" class="workBox pull-left bold_padding">
		
		<h3>NON_POPUP</h3>
		<hr>
		
		<div class="eventContent base_padding light_margin selected">
			<div class="">선택된 이벤트</div>
			<div class="eventDate" style="font-size:0; height:0">
				<div class="pull-left" style="width:40%;">20/10/20 부터</div>
				<div class="pull-left" style="width:40%;">20/10/30 까지</div>
			</div>
		</div>
		<div class="eventContent base_padding light_margin selected">
			<div class="">선택된 이벤트</div>
			<div class="eventDate" style="font-size:0; height:0">
				<div class="pull-left" style="width:40%;">20/10/20 부터</div>
				<div class="pull-left" style="width:40%;">20/10/30 까지</div>
			</div>
		</div><div class="eventContent base_padding light_margin selected">
			<div class="">선택된 이벤트</div>
			<div class="eventDate" style="font-size:0; height:0">
				<div class="pull-left" style="width:40%;">20/10/20 부터</div>
				<div class="pull-left" style="width:40%;">20/10/30 까지</div>
			</div>
		</div><div class="eventContent base_padding light_margin selected">
			<div class="">선택된 이벤트</div>
			<div class="eventDate" style="font-size:0; height:0">
				<div class="pull-left" style="width:40%;">20/10/20 부터</div>
				<div class="pull-left" style="width:40%;">20/10/30 까지</div>
			</div>
		</div>
		
		
		
	</div>
	
	
	
	<div id="popupOperator" class="pull-left"><div style="height:250px; padding-left:32px;padding-top:190px">
	
	<i style="cursor:pointer; font-size:50px;" class="fas fa-plus-square"></i>
	
	</div><div style="cursor:pointer;height:250px; padding-left:32px;padding-bottom:190px">
	
	<i style="font-size:50px;" class="fas fa-minus-square"></i>
	
	</div></div>
	
	
	
	
	<div id="notPopup" class="workBox pull-left bold_padding">
		<h3>POPUP</h3>
		<hr>
		
		<div class="eventContent base_padding light_margin selected">
			선택된 이벤트
		</div>
		<div class="eventContent base_padding light_margin notSelected">
			선택되지 않은 이벤트
		</div>
		
	</div>
</div>



</div>

</body>
</html>