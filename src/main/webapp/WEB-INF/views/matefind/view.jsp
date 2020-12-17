<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<!-- 네이버지도 -->
<!-- <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ncf9ktdc08"></script> -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ncf9ktdc08&submodules=geocoder"></script>


<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<title>Insert title here</title>

<style type="text/css">

body {
	margin: 0 auto;
	text-align: center;
}

.active {
	color: gray;
}

</style>

<script type="text/javascript">
function goList() {
	location.href="/matefind/list";
}

$(document).ready(function() {
	$("#btnAttend").click(function() {
		console.log("clicked")

		$.ajax({
			type : "get"
			, url: "/matefind/attend"
			, data: { article_no : $('#article_no').val() }
			, dataType: "json" //응답받은 데이터의 형식
			, success: function(res) {
				console.log("성공")
				console.log(res)
				
				if(res) {
					$("#btnAttend").removeClass("active");
				} else {
					$("#btnAttend").addClass("active");
				}
				
// 				if($("#btnRecommend").hasClass("active") === true) {
// 					$("#btnRecommend").removeClass("active");
// 				} else {
// 					$("#btnRecommend").addClass("active");
// 				}
				
			}
			, error: function() {
				console.log("실패")
			}
		})
		
	});
	
})
</script>

</head>
<body>

<div class="container">

<br><br>

	<div class="row">
		<div class="col-2">
			<h4>글번호 [ ${view.article_no} ]</h4>
			<input type="hidden" value="${view.article_no }" name="article_no" id="article_no">
		</div>
		<div class="col-8"></div>
		<div class="col-2">
			<h4>조회수 [ ${view.article_hit} ]</h4>
		</div>
	</div>
	
<hr>

	<div class="row" style="margin-bottom: 30px;">
		<div class="col">
			<h1 style="float: left;">${view.article_title }</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col">
			<h4 style="float: left;">#${view.party_location }  #${view.meet_time }  #${view.category }</h4>
		</div>
	</div>
	
	
	<hr>
	<div class="row">
		<div class="col-3">
			<h3 style="float: left;">host 
<%-- 			[ ${view.user_no } ] --%>
			</h3>
		</div>
	</div>
	
	<!-- host -->
	<div class="row">
		<!-- user_no는 나중에 사진으로 대체 되어야함 -->
		<div class="col-4">
			<h4>${hostInfo.user_no }</h4>		
		</div>
		
		<div class="col-4">
			<h3>${hostInfo.user_id }</h3>
		</div>
		<div class="col-4">
			<h3>${hostInfo.user_nick }</h3>
		</div>
	</div>
	<!-- //host -->
	
	
	<hr>
	
	
	<!-- guest -->
	<div class="row">
		<div class="col">
			<h3 style="float: left;">guest
<%-- 			<c:forEach items="${guestList }" var="guest"> --%>
<%-- 				[ ${guest } ] --%>
<%-- 			</c:forEach> --%>
			</h3>
		</div>
	</div>
	
	<div class="row">
		
		
		<c:forEach items="${guestUserList }" var="guestUser">
			
			<!-- user_no는 나중에 사진으로 대체 되어야함 -->
			<div class="col-2">
				<h4>${guestUser.user_no }</h4>		
			</div>
			
			<div class="col-2">
				<h3>${guestUser.user_id }</h3>
			</div>
			<div class="col-2">
				<h3>${guestUser.user_nick }</h3>
			</div>
		</c:forEach>
	</div>
	<!-- //guest -->
	
	
	<hr>
	
	
	
	<div class="row">
		<div class="col">
			<h2 style="float: left;">내용</h2>
		</div>
	</div>

	<div class="row" style="background-color: #E0E0E0; margin: 20px; 10px;">
		${view.article_content }
	</div>
	
	
	<hr>
	
	<label for="date" class="form-label" style="float: left; margin-top: 40px;">시간</label>
	<input class="form-control" id="date" type="datetime-local" value="${view.meet_time}" readonly="readonly" style="tran">
	
	
		<!-- 네이버지도 검색창 -->
	<!-- #수정# absolute - relative 로 지도에 띄우기 -->
	<label for="map" class="form-label" style="float: left; margin-top: 40px;">위치</label>

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
	    zoom: 16,
	    mapTypeControl: true
	};
	
	var map = new naver.maps.Map('map', mapOptions);
	
	
// 	var marker = new naver.maps.Marker({
// 	    position: position,
// 	    map: map
// 	});

	var infoWindow = new naver.maps.InfoWindow({
	  anchorSkew: true
	});
	
	map.setCursor('pointer');
	

	
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
	
	    infoWindow.setContent([
	      '<div style="padding:10px;min-width:200px;line-height:150%;">',
	      '<h5 style="margin-top:5px;">모임 장소</h5>',
	      '<h6 style="margin-top:5px;">'+ address +'</h6>',
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
	
// 	  map.addListener('click', function(e) {
// 	    searchCoordinateToAddress(e.coord);
// 	  });
	
// 	  $('#address').on('keydown', function(e) {
// 	    var keyCode = e.which;
	
// 	    if (keyCode === 13) { // Enter Key
// 	      searchAddressToCoordinate($('#address').val());
// 	    }
// 	  });
	
// 	  $('#submit').on('click', function(e) {
// 	    e.preventDefault();
	
// 	    searchAddressToCoordinate($('#address').val());
// 	  });
	
	  searchAddressToCoordinate($('#party_location').val());
	}
	
	naver.maps.onJSContentLoaded = initGeocoder;
	naver.maps.Event.once(map, 'init_stylemap', initGeocoder);

	</script>
	
	
	
	
	
	
<br><br><br><br>
	
	
<!-- 버튼 영역v2 -->
	<div class="row" style="margin-bottom: 100px;">
		<div class="col">
			<button class="btn btn-secondary" onclick=goList() style="float: left;">목록으로</button>	
			
			<c:set var="writer" value="${view.user_no }" />

			<c:if test="${user_no  ne writer}">	
				<button class="btn btn-primary" id="btnAttend" style="text-align: center">참여하기</button>			
			</c:if>
			
			<c:choose>
				<c:when test="${user_no  eq writer}">
					<div style="float: right;">
						<a href="/matefind/update?article_no=${view.article_no }"><button class="btn btn-warning">수정하기</button></a>
						<button class="btn btn-danger">삭제하기</button>
					</div>	
				</c:when>
				<c:otherwise>
					<div style="float: right;">
						<!-- 신고하기 버튼 만든걸로 수정 해야함 -->
						<button class="btn btn-danger">신고하기</button>
					</div>
				</c:otherwise>
			</c:choose>
		
		</div>
	</div>	
<!-- //버튼 영역v2 -->

</div>

</body>
</html>