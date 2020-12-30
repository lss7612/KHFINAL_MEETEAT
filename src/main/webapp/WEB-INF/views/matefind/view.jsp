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

/* .container hr { */
/* 	align-content: center; */
/* 	width: 100%; */
/* 	height: 10px;  */
/* 	border: 0; */
/*     border-top: 1px solid #abd5bd; */
/*     border-bottom: 1px solid #abd5bd; */
/* 	background-color: #ced4da; margin: 8px 0px; */
/* } */

.mateInfo {
	float: left;
	margin-top: 0px;
	margin-bottom: 10px;
}

.pof_pic{
	width: 120px;
	height:120px; 
	border-radius:100px; 
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

function joinChat(e){
	var target = $(e).prev().val();
	console.log($(e).prev())
	console.log("target : "+target);

	var frmPop = document.chatSubmitForm;
	//팝업 
	window.open("http://localhost:8088/chat/room", "chatRoom"
			, "width=710px, height=665px");
	frmPop.action = "http://localhost:8088/chat/room";
	frmPop.target = "chatRoom";
	frmPop.chatting_id.value = target
}

</script>

</head>
<body>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="container" id="divpage">

	<div class="row">
		<div align="left" class="col-6">
			<h4>글번호 [ ${view.article_no} ]</h4>
			<input type="hidden" value="${view.article_no }" name="article_no" id="article_no">
		</div>
		<div align="right" class="col-6">
			<h4>조회수 [ ${view.article_hit} ]</h4>
		</div>
	</div>
	
<hr>

	<div class="row" style="margin-bottom: 50px;">
		<div class="col">
			<h1 align="left">${view.article_title }</h1>
		</div>
	</div>
	
	<div class="row" align="left" style="padding-left: 10px;">

		<fmt:parseDate value="${jstlMeetTime }" var="parseDateMeetTime" pattern="yyyyMMddHHmm" scope="page"/>
		<p>날짜　　<fmt:formatDate value="${parseDateMeetTime }" pattern ="yyyy년 MM월 dd일 HH시 mm분"/></p>
		<p>장소　　${view.party_location }</p>
		<p>유형　　${view.category }</p>
		<!-- 모임 채팅방 참여 버튼 구역 -->
		<form name="chatSubmitForm" method="post">
			<input type="hidden" name="chatting_id" value="${chatting_id }" />
			<button id="enterChatBtn" onclick="joinChat(this);">모임 채팅방</button>
		</form>
		<!-- 모임 채팅방 참여 버튼 구역 -->
	
	
	</div>
	
	
<!-- 	<div class="row"> -->
<!-- 		<div align="left" class="col"> -->
		
<!-- 			<ul class="mateInfo"> -->
<!-- 				<li>#${view.party_location }</li> -->
<%-- 				<fmt:parseDate value="${jstlMeetTime }" var="parseDateMeetTime" pattern="yyyyMMddHHmm" scope="page"/> --%>
<%-- 				<li>#<fmt:formatDate value="${parseDateMeetTime }" pattern ="yyyy년 MM월 dd일"/></li> --%>
<%-- 				<li>#<fmt:formatDate value="${parseDateMeetTime }" pattern ="HH시 mm분"/></li> --%>
<!-- 				<li>#${view.category }</li> -->
<!-- 			</ul> -->
			
<!-- 		</div> -->
<!-- 	</div> -->
	
	
	
	<hr>
	<div class="row">
		<div class="col-3">
			<h3 style="float: left;">호스트</h3>
		</div>
	</div>
	
	
	<!-- host -->
	<div class="row">
	
		<!-- user_no는 나중에 사진으로 대체 되어야함 -->
		<div class="col-2">
<%-- 			<img class="pof_pic" style="width: 50px; height: 50px;" src="${hostInfo.user_profilestored }" alt="유저프로필사진">	 --%>
			<img class="pof_pic" style="width: 50px; height: 50px;" src="/resources/upload/${hostInfo.user_profilestored }" alt="유저프로필사진">	
		</div>
		
		<div class="col-2">
			<h3>${hostInfo.user_id }</h3>
		</div>
		<div class="col-2">
			<h3>${hostInfo.user_nick }</h3>
		</div>
	</div>
	<!-- //host -->
	
	
	<hr>
	
	
	<!-- guest -->
	<div id="attendeeAjax"></div>

	
	<hr>
	

		<div class="row" align="left">
			<label for="content" class="form-label" style="float: left; margin-top: 20px;">내용</label>
		</div>
		
		<div class="row" id="content" style="padding: 10px 20px;">
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
	<input type="text" class="form-control" readonly="readonly" id="party_location" name="party_location" style="margin-bottom: 50px;" value="${view.party_location }">

	
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
	
	console.log("${user_no}");
	console.log("${writer}");
	
	var frmPop = document.frmPopup;
	
	//팝업 
	window.open("http://localhost:8088/report/doReport","report"
			, "width=500px,height=425px")
	frmPop.action = "http://localhost:8088/report/doReport";
	frmPop.target = "report";
	//${user_no}에 작성자 번호에 맞는 변수명을 적어주시면 됩니당.
	frmPop.user_no.value = ${writer};
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

function loadAttendeeList() {
	
	$.ajax({
		url: '/matefind/attendeeList',
		data: { article_no : $('#article_no').val() },
		dataType: 'html',
		type: 'get',
		success: function(res) {
			console.log("[ajax] /matefind/attendeeList 전송성공");
			$("#attendeeAjax").empty();
			$("#attendeeAjax").append(res);
		},
	    error:function(request,status,error){
			console.log("[ajax] /matefind/attendeeList 전송실패");
	         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	})
	
}


$(document).ready(function() {
	
	// guest 목록 초기화 불러오기
	loadAttendeeList();

	if(${isAttendee }) {
		
		addAttendee();
		
	} else {
		
		deleteAttendee();
	}
	
	$('#btnAttend').click(function() {
		
		$.ajax({
			url: '/matefind/attend',
			data: { article_no : $('#article_no').val() },
			type: 'get',
			
			success: function(result) {
				
				if(result) {
					
					// 미참여중 참여시키기
					addAttendee()

				} else {
					
					// 이미 참여중 참여취소시키기
					deleteAttendee()

				}
				
				loadAttendeeList();
				
			},
			error: function() {
				console.log("[ajax] /matefind/attend 전송실패");
				
			}
			
		})
		
	})
	
})
</script>


<c:import url="/WEB-INF/views/layout/footer.jsp" />