<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/forTest/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>

$(document).ready(function(){

	$('#searchButton').click(function(){
		
		let query = $('input[name=query]').val()
		let sort = $('select[name=sort]').val()
 		search(query, sort) 
	})
	
})

function search(Query, Sort){
	
	$.ajax({
		type: "POST"
		, url: "/restorantfind/find"
		, data: { query : Query, sort : Sort }
		, dataType:"json" //응답받은 데이터의 형식
		, success: function( res ){
			console.log('성공')
			console.log(res)
			console.log(res.items[0])
			console.log(res.items[0].title)
			
			listup(res)
			
		}
		, error: function(){
			console.log('실패')
		}
	}) 
}

function listup(res){
	
	for(let i=0; i<res.total; i++){
		
		let id = 'restorant'+(i+1)
		
		$('#'+id).append('<hr>')
		$('#'+id+' h3').html(res.items[i].title)
		$('#'+id+' .category').text(res.items[i].category)
		$('#'+id+' .address').text(res.items[i].roadAddress)
		
		if(res.items[i].mapx!=''&&res.items[i].mapy!=''){
			$('#'+id+' .map a').html('<i style="font-size:20px;" class="fas fa-map-marked-alt"></i>')
			$('#'+id+' .map a').attr('mapx',res.items[i].mapx)
			$('#'+id+' .map a').attr('mapy',res.items[i].mapy)
		}
		
		
		if(res.items[i].link!='') {
			$('#'+id+' .homepage a').html('<i style="font-size:20px;" class="fas fa-home"></i>')
			$('#'+id+' .homepage a').attr('href',res.items[i].link)
			$('#'+id+' .homepage a').attr('target','blank')
		}
		
	}
	
}

</script>
</head>
<body>

<div id="findRestorantWrapper" style="width:60%; min-width:600px; margin:0 auto;">


<h2>맛집검색</h2>
<hr>

<%-- 검색부분 --%>
<div id="searchBox" style="">
	<div>'지역' + '먹거리' 로 검색하시면 좋습니다!</div>
	<form class="form-inline">
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


<%-- 결과부분 --%>
<div id="result">

	<%-- 결과 리스트 부분 --%>
	<div id="resultList" style="width:35%;">
	
		<div id="restorant1" class="restorantInfoBox">
			<h3 class="title"></h3><%-- 제목 --%>
			
			<%-- 아이콘들 --%>
			<div class="homepage pull-left" style="width:30px; text-align:center;"><a></a></div>
			<div class="map pull-left" style="width:30px; text-align:center;"><a href="#"></a></div>
			<div class="clearfix"></div>
			
			<div class="category"></div>
			<div class="address"></div>
		</div>
		
		<div id="restorant2" class="restorantInfoBox">
			<h3 class="title"></h3>
			<div class="homepage pull-left" style="width:30px; text-align:center;"><a></a></div>
			<div class="map pull-left" style="width:30px; text-align:center;"><a href="#"></a></div>
			<div class="clearfix"></div>
			<div class="category"></div>
			<div class="address"></div>
		</div>
		
		<div id="restorant3" class="restorantInfoBox">
			<h3 class="title"></h3>
			<div class="homepage pull-left" style="width:30px; text-align:center;"><a></a></div>
			<div class="map pull-left" style="width:30px; text-align:center;"><a href="#"></a></div>
			<div class="clearfix"></div>
			<div class="category"></div>
			<div class="address"></div>
		</div>
		
		<div id="restorant4" class="restorantInfoBox">
			<h3 class="title"></h3>
			<div class="homepage pull-left" style="width:30px; text-align:center;"><a></a></div>
			<div class="map pull-left" style="width:30px; text-align:center;"><a href="#"></a></div>
			<div class="clearfix"></div>
			<div class="category"></div>
			<div class="address"></div>
		</div>
		
		<div id="restorant5" class="restorantInfoBox">
			<h3 class="title"></h3>
			<div class="homepage pull-left" style="width:30px; text-align:center;"><a></a></div>
			<div class="map pull-left" style="width:30px; text-align:center;"><a href="#"></a></div>
			<div class="clearfix"></div>
			<div class="category"></div>
			<div class="address"></div>
		</div>
	
	</div>
	
	<%-- 리뷰 OR 지도부분 --%>
	<div id="resultDetail">
	
	</div>
	
</div>

</div>

</body>
</html>