<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 스마트 에디터2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<!-- 네이버지도 -->
<!-- <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ncf9ktdc08"></script> -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ncf9ktdc08&submodules=geocoder"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">


<title>Insert title here</title>

<style type="text/css">

body {
	margin: 0 auto;
	text-align: center;
}

</style>

<script type="text/javascript">
function goList() {
	location.href="/matefind/list";
}

$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		
		//스마트에디터의 내용을 <textarea>에 적용하기
		submitContents($("#btnWrite"));
		
		//form submit 수행하기
		$("form").submit();
		
	})

	$("#cancel").click(function() {
		history.go(-1);
	})
	
})
</script>

</head>
<body>

<div class="container">

<br><br>


	<div class="row">
		<div class="col-2">
			<h4>글번호 [ ${view.article_no} ]</h4>
			<input type="hidden" name="article_no" value="${view.article_no}">
			<input type="hidden" name="user_no" value="${view.user_no}">
		</div>
		<div class="col-8"></div>
		<div class="col-2">
		</div>
	</div>
	
	<div class="row" style="width: 150px;">
		<div class="col">
			<label class="input-group-text" for="category">만남유형</label>
			<select class="form-select" name="category">
				<option value="식사">식사</option>
				<option value="카페">카페</option>
				<option value="술">술</option>
			</select>
			
			<label class="input-group-text" for="mate_list">모집인원</label>
			<select class="form-select" name="mate_list">
				<option value="1">1명</option>
				<option value="2">2명</option>
				<option value="3">3명</option>
				<option value="4">4명</option>
				<option value="5">5명</option>
				<option value="6">6명</option>
				<option value="7">7명</option>
			</select>
		</div>
	</div>
	
<hr>

	<label for="title" class="form-label" style="float: left;">제목</label>
	<input type="text" class="form-control" id="title" name="article_title" value="${view.article_title }">	
	
	<br>
	
	<label for="content" class="form-label" style="float: left;">내용</label>
	<textarea rows="10" style="width: 100%" id="content" name="article_content">${view.article_content }</textarea>
	
	<!-- 스마트 에디터 적용하는 코드 -->
	<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors
		, elPlaceHolder: "content" //에디터가 적용될 <textarea>의 id
		, sSkinURI: "/resources/se2/SmartEditor2Skin.html" //에디터 스킨
		, fCreator: "createSEditor2"
	})
	
	//<form>태그가 submit되면 스마트에디터에 작성된 내용이 <textarea>에 적용되도록 하는 코드
	function submitContents(elClickedObj) {
		
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		
		try {
			elClickedObj.form.submit();
		} catch(e) { }
	
	}
	
	</script>	
	
	<div class="row">
		<div class="col">
			<h2 style="float: left;">#${view.party_location } #${view.meet_time } #${view.category }</h2>
			<input type="text" id="category" name="category">
		</div>
	</div>
	<hr>
	
	<label for="date" class="form-label" style="float: left;">시간</label>
	<input class="form-control" id="date" type="datetime-local" name="meet_time" style="width: 300px;">
	
	

	<!-- 네이버지도 검색창 -->
	<!-- #수정# absolute - relative 로 지도에 띄우기 -->
	<label for="map" class="form-label" style="float: left; margin-top: 40px;">위치</label>
	<div class="search" id="mapSearch" style="float: left;">
		<input id="address" type="text" placeholder="검색할 주소">
		<input id="submit" type="button" value="주소 검색">
	</div>

	<!-- 네이버지도 -->
	<div id="map" style="width:100%;height:400px; margin-top: 20px;"></div>
	
	<!-- 검색했을 때 적용됨 -->
	<input type="text" class="form-control" readonly="readonly" id="party_location" name="party_location" value="${view.party_location }">

	
	<script>
	/* 네이버지도 */
	var position = new naver.maps.LatLng(37.498993, 127.032909);
	
	var mapOptions = {
	    center: position,
	    zoomControl: true,
	    zoom: 12,
	    mapTypeControl: true
	};
	
	var map = new naver.maps.Map('map', mapOptions);
	
	
// 	var marker = new naver.maps.Marker({
// 	    position: position,
// 	    map: map
// 	});

// 	naver.maps.Event.addListener(map, 'click', function(e) {
// 	    marker.setPosition(e.coord);
// 	});
	
	var infoWindow = new naver.maps.InfoWindow({
	  anchorSkew: true
	});
	
	map.setCursor('pointer');
	
	/* 클릭시 검색 */
	function searchCoordinateToAddress(latlng) {
	
	  infoWindow.close();
	
	  naver.maps.Service.reverseGeocode({
	    coords: latlng,
	    orders: [
	      naver.maps.Service.OrderType.ADDR,
	      naver.maps.Service.OrderType.ROAD_ADDR
	    ].join(',')
	  }, function(status, response) {
	    if (status === naver.maps.Service.Status.ERROR) {
	      if (!latlng) {
	        return alert('ReverseGeocode Error, Please check latlng');
	      }
	      if (latlng.toString) {
	        return alert('ReverseGeocode Error, latlng:' + latlng.toString());
	      }
	      if (latlng.x && latlng.y) {
	        return alert('ReverseGeocode Error, x:' + latlng.x + ', y:' + latlng.y);
	      }
	      return alert('ReverseGeocode Error, Please check latlng');
	    }
	
	    var address = response.v2.address,
	        htmlAddresses = [];
	
	    if (address.jibunAddress !== '') {
	        htmlAddresses.push('[지번 주소] ' + address.jibunAddress);
	    }
	
	    if (address.roadAddress !== '') {
	        htmlAddresses.push('[도로명 주소] ' + address.roadAddress);
	        
//	 	      /* 추가사항 */
			  $('#party_location').val(address.roadAddress)
			  
			  var addressResult = address.roadAddress.split(' ');
			  var category = addressResult[0];
			  $('#category').val(category);
			  
	        
	    } else {
	    	
	    	$('#party_location').val(address.jibunAddress)
	    	  
	    	  var addressResult = address.jibunAddress.split(' ');
			  var category = addressResult[0];
			  $('#category').val(category);
	    	
	    }
	    
	
	    infoWindow.setContent([
	      '<div style="padding:10px;min-width:200px;line-height:150%;">',
	      '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
	      htmlAddresses.join('<br />'),
	      '</div>'
	    ].join('\n'));
	
	    infoWindow.open(map, latlng);
	  });
	}
	
	/* 검색창 검색 */
	function searchAddressToCoordinate(address) {
	  naver.maps.Service.geocode({
	    query: address
	  }, function(status, response) {
	    if (status === naver.maps.Service.Status.ERROR) {
	      if (!address) {
	        return alert('Geocode Error, Please check address');
	      }
	      return alert('Geocode Error, address:' + address);
	    }
	
	    if (response.v2.meta.totalCount === 0) {
	      return alert('장소 검색결과를 찾을 수 없습니다.');
	    }
	
	    var htmlAddresses = [],
	      item = response.v2.addresses[0],
	      point = new naver.maps.Point(item.x, item.y);
	
	    if (item.roadAddress) {
	      htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
	      
// 	      /* 추가사항 */
		  $('#party_location').val(item.roadAddress)
		  
		  var addressResult = item.roadAddress.split(' ');
		  var category = addressResult[0];
		  $('#category').val(category);
	      
	    } else {
	    	
	    	$('#party_location').val(item.jibunAddress)
	    	
	    	  var addressResult = item.jibunAddress.split(' ');
			  var category = addressResult[0];
			  $('#category').val(category);
	    	
	    }
	
	    if (item.jibunAddress) {
	      htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
	    }
	
	    if (item.englishAddress) {
	      htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
	    }
	
	    infoWindow.setContent([
	      '<div style="padding:10px;min-width:200px;line-height:150%;">',
	      '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
	      htmlAddresses.join('<br />'),
	      '</div>'
	    ].join('\n'));
	
	    map.setCenter(point);
	    infoWindow.open(map, point);
	  });
	}
	
	function initGeocoder() {
	  if (!map.isStyleMapReady) {
	    return;
	  }
	
	  map.addListener('click', function(e) {
	    searchCoordinateToAddress(e.coord);
	  });
	
	  $('#address').on('keydown', function(e) {
	    var keyCode = e.which;
	
	    if (keyCode === 13) { // Enter Key
	      searchAddressToCoordinate($('#address').val());
	    }
	  });
	
	  $('#submit').on('click', function(e) {
	    e.preventDefault();
	
	    searchAddressToCoordinate($('#address').val());
	  });
	
	  searchAddressToCoordinate($('#party_location').val());
	}
	
	naver.maps.onJSContentLoaded = initGeocoder;
	naver.maps.Event.once(map, 'init_stylemap', initGeocoder);

	</script>

	
<br><br><br><br>
	
<!-- 버튼 영역v2 -->
	<div class="row">
		<div class="col">
		
			<button class="btn btn-secondary" onclick=goList() style="float: left;">목록으로</button>
					
			<button class="btn btn-primary" type="submit">수정하기</button>		
			<button class="btn btn-secondary" id="cancel">취소하기</button>
			
			<button class="btn btn-danger" style="float: right;">삭제하기</button>
			
		
		</div>
	</div>	
<!-- //버튼 영역v2 -->


</div><!-- //container -->

</body>
</html>