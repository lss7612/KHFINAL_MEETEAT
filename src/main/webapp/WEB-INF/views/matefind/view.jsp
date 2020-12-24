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
	
	$("#deleteBtn").click(function() {
		
		var clickResult = confirm("정말 삭제하시겠습니까?") 
		console.log(clickResult);
		
		if(clickResult) {
			location.href = "/matefind/delete?article_no=" + ${view.article_no };
		} else {
			return false;
		}
		
		
	})
	
})

</script>

</head>
<body>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="container" id="divpage">

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
			<img style="width: 50px; height: 50px;" src="${hostInfo.user_profilestored }" alt="유저프로필사진">	
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
			<h3 style="float: left;">guest [ ${attendeeCount } / ${attendeeMax } ]</h3>
		</div>
	</div>
	
	<div class="row">
		
		<c:forEach items="${attendUserList }" var="attendUserList">
			
			<!-- user_no는 나중에 사진으로 대체 되어야함 -->
			<div class="col-2">
				<img style="width: 50px; height: 50px;" src="${attendUserList.user.user_profilestored }" alt="유저프로필사진">	
			</div>
			
			<div class="col-2">
				<h3>${attendUserList.user.user_id }</h3>
			</div>
			<div class="col-2">
				<h3>${attendUserList.user.user_nick }</h3>
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
	<div class="row">
		<div class="col">
			<button class="btn btn-secondary" onclick=goList() style="float: left;">목록으로</button>	
			
			<c:set var="writer" value="${view.user_no }" />
		
	
	<c:set var="isAttendee" value="false" />
	<c:forEach items="${attendeeList }" var="list">
		<c:if test="${user_no eq list.user_no }">
			<c:set var="isAttendee" value="true" />
		</c:if>
	</c:forEach>
	
	<input type="hidden" readonly="readonly" value="${isAttendee }">
	
		<c:if test="${user_no  ne writer}">
			<c:choose>
				<c:when test="${attendeeMax le attendeeCount && !isAttendee}">
					<input type="button" class="btn btn-danger" value="정원이 다 찼습니다">
				</c:when>
				
				<c:otherwise>
					<input type="button" class="btn" id="btnAttend" value="참여하기">
				</c:otherwise>
			
			</c:choose>
		</c:if>
		
			<c:choose>
				<c:when test="${user_no  eq writer}">
					<div style="float: right;">
						<a href="/matefind/update?article_no=${view.article_no }"><button class="btn btn-warning">수정하기</button></a>
						<input type="button" id="deleteBtn" class="btn btn-danger" value="삭제하기">
					</div>	
				</c:when>
				<c:otherwise>
					<div style="float: right;">
					
						<!-- 게시글 신고 버튼 구역 -->
						<form name="frmPopup" method="POST">
							<input type="hidden" name= "user_no">
							<input type="hidden" name= "url" />
						<button onclick="reportPopup();" class="btn btn-danger" >신고</button>
						</form>
						<!-- 게시글 신고 버튼 구역  종료-->
<!-- 						신고하기 버튼 만든걸로 수정 해야함 -->
<!-- 						<button class="btn btn-danger">신고하기</button> -->
					</div>
				</c:otherwise>
			</c:choose>
		
		</div>
	</div>	
<!-- //버튼 영역v2 -->

</div>

<style type="text/css">

.active {
	background-color: blue;
	color: white;
}

</style>

<script type="text/javascript">

//게시글 신고하기버튼 클릭시 동작할 함수
function reportPopup(){
	var frmPop = document.frmPopup;
	
	//팝업 
	window.open("http://localhost:8088/report/doReport","report"
			, "width=500px,height=425px")
	frmPop.action = "http://localhost:8088/report/doReport";
	frmPop.target = "report";
	//${user_no}에 작성자 번호에 맞는 변수명을 적어주시면 됩니당.
	frmPop.user_no.value = ${user_no};
	//현재글 URL정보 전달
	frmPop.url.value = window.location.href
}
// 신고하기 동작 함수 끝


function addAttendee() {
	
	$('#btnAttend').val("참여취소");
	$("#btnAttend").addClass("btn-secondary")
	$("#btnAttend").removeClass("btn-primary")
	
}

function deleteAttendee() {
	
	$('#btnAttend').val("참여하기");
	$("#btnAttend").removeClass("btn-secondary")
	$("#btnAttend").addClass("btn-primary")
	
	
}


$(document).ready(function() {

	if(${isAttendee }) {
		
		addAttendee()
		
	} else {
		
		deleteAttendee()
	}
	
	$('#btnAttend').click(function() {
		
		$.ajax({
			url: '/matefind/attend',
			data: { article_no : $('#article_no').val() },
			type: 'get',
			
			success: function(result) {
				
// 				console.log(booelanResult);
// 				console.log(booelanResult2);
				
				if(result) {
					
					addAttendee()
					// 미참여중 참여시키기
// 					$('#btnAttend').val("참여취소");
// 					$("#btnAttend").addClass("btn-secondary")
// 					$("#btnAttend").removeClass("btn-primary")
					
					
					// recommend - user join결과 불러오기

				} else {
					
					deleteAttendee()
					// 이미 참여중 참여취소시키기
// 					$('#btnAttend').val("참여하기");
// 					$("#btnAttend").removeClass("btn-secondary")
// 					$("#btnAttend").addClass("btn-primary")
					
					// recommend - user join결과 불러오기
				}
				
			},
			error: function() {
				console.log("[ajax] /matefind/attend 전송실패")
				
			}
			
			
			
			
		})
		
	})
	
})
</script>


<c:import url="/WEB-INF/views/layout/footer.jsp" />