<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script id="code">

$(document).ready(function(){
	let mapy = $('#mapy').val()
	let mapx = $('#mapx').val()
	
	loadMap(mapx,mapy);
	
})

function loadMap(mapx, mapy){
	let location = new naver.maps.LatLng(mapy, mapx);
	var infowindow = new naver.maps.InfoWindow();
	
	var map = new naver.maps.Map('map', {
	    center: location,
	    zoom: 16,
	    mapTypeId: naver.maps.MapTypeId.NORMAL
	})
	infowindow.setContent('<div style="padding:10px;">' + '여기!' + '</div>');
	infowindow.open(map, location);
}

</script>


<div id="LocaitionInfoWrap" class="section">
	<input type="hidden" id="mapx" value="${mapx }">
	<input type="hidden" id="mapy" value="${mapy }">
    <div id="map" style="margin:5%;width:100%;height:600px;"></div>
    <code id="snippet" class="snippet"></code>
</div>
