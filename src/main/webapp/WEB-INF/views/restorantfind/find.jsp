<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/forTest/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:import url="/WEB-INF/views/forTest/header.jsp"></c:import>
<link rel="stylesheet" href="/resources/css/common/common.css">
<script type="text/javascript" src="/resources/js/restorantfind/find.js"></script>
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=el0h9yyc4x"></script>

</head>
<body>

<div id="findRestorantWrapper" style="width:60%; min-width:600px; margin:0 auto;">


<h2>맛집검색</h2>
<hr>

<%-- 검색부분 --%>
<div id="searchBox" style="">
	<div>'지역' + '먹거리' 로 검색하시면 좋습니다!</div>
	<form onsubmit="return false" class="form-inline">
		<select class="form-control" name="sort">
			<option value="random">유사도순</option>
			<option value="comment">리뷰순</option>
		</select>	
		<div class="form-group">
			<input id="form_query" class="form-control" name="query" type="text">
		</div>
		&nbsp;<i id="searchButton" style="font-size:20px; cursor:pointer;" class="fas fa-search"></i>
	</form>
	<hr>
</div>


<%-- 검색 전 --%>
<div id="beforeSearch">

	<div style="width:500px; margin:0 auto; text-align:center;">
		<img alt="" src="/resources/img/error.jpg"><br>
		검색하세요!
	</div>

</div>


<%-- 결과부분 --%>
<div id="result">

	<%-- 결과 리스트 부분 --%>
	<div id="resultList" style="width:35%;" class="pull-left">
	
		<div id="restorant1" class="restorantInfoBox light_padding">
			<h3 class="title"></h3><%-- 제목 --%>
			
			<%-- 아이콘들 --%>
			<div class="homepage pull-left" style="width:30px; text-align:center;"><a></a></div>
			<div class="map pull-left" style="width:30px; text-align:center;"><a href="#"></a></div>
			<div class="clearfix"></div>
			
			<div class="category"></div>
			<div class="address"></div>
		</div>
		
		<div id="restorant2" class="restorantInfoBox light_padding">
			<h3 class="title"></h3>
			<div class="homepage pull-left" style="width:30px; text-align:center;"><a></a></div>
			<div class="map pull-left" style="width:30px; text-align:center;"><a href="#"></a></div>
			<div class="clearfix"></div>
			<div class="category"></div>
			<div class="address"></div>
		</div>
		
		<div id="restorant3" class="restorantInfoBox light_padding">
			<h3 class="title"></h3>
			<div class="homepage pull-left" style="width:30px; text-align:center;"><a></a></div>
			<div class="map pull-left" style="width:30px; text-align:center;"><a href="#"></a></div>
			<div class="clearfix"></div>
			<div class="category"></div>
			<div class="address"></div>
		</div>
		
		<div id="restorant4" class="restorantInfoBox light_padding">
			<h3 class="title"></h3>
			<div class="homepage pull-left" style="width:30px; text-align:center;"><a></a></div>
			<div class="map pull-left" style="width:30px; text-align:center;"><a href="#"></a></div>
			<div class="clearfix"></div>
			<div class="category"></div>
			<div class="address"></div>
		</div>
		
		<div id="restorant5" class="restorantInfoBox light_padding">
			<h3 class="title"></h3>
			<div class="homepage pull-left" style="width:30px; text-align:center;"><a></a></div>
			<div class="map pull-left" style="width:30px; text-align:center;"><a href="#"></a></div>
			<div class="clearfix"></div>
			<div class="category"></div>
			<div class="address"></div>
		</div>
	
	</div>
	
	<%-- 지도부분 --%>
	<div id="resultDetail" style="width:60%" class="pull-left base_margin">
		
	</div>
	
</div>

</div>

</body>
</html>