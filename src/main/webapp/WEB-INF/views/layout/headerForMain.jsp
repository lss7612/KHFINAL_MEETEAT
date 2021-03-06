<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEET & EAT</title>

<link rel="stylesheet" type="text/css" href="/resources/css/layout/css.css" />

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
 src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- FontAwsome -->
<script src="https://kit.fontawesome.com/2dc2c9d106.js" crossorigin="anonymous"></script>



<script type="text/javascript">

$(document).ready(function () {
	
	$(window).scroll(function() { 
		if ($(this).scrollTop() > 200) { 
			$('#topupBtn').fadeIn(); } 
		else { $('#topupBtn').fadeOut(); }
	}); 
$("#topupBtn").click(function() { 
   	$('html, body').animate({ scrollTop : 0  }, 300); 
    	return false; });
});

</script>


<!-- ------------------------------------------------------------------------ -->

<script type="text/javascript">
$(document).ready(function () {
	
	//모든 이미지 항목 리스트 얻어오기
	var $slider_list = $("#slider li")
// 	console.log($slider_list)

	//모든 이미지 항목을 오른쪽으로 보내기(숨기기)
// 	$slider_list.css("left", "600px" )
	$slider_list.css("left", $("#sliderbox").css("width") )
	
	//-----------------------------------------
	
	/* 새로고침하면 첫번째 이미지를 div 안쪽으로 보낸다 */
	$slider_list.eq(0).css("left", 0)
	
	//-----------------------------------------
	
	//함수를 호출하면 #sliderbox에 클릭 이벤트를 발생시킴
	var sliderClick = function () {
		
		//클릭 이벤트 발생시키기
		$("#sliderbox").click()	
	}
	
	var tid = setInterval(sliderClick, 3000)
	
	
	/* #sliderbox를 클릭할 때마다 이미지를 한 장씩 교체하기
		-> 이미지 슬라이드*/
	//현재 슬라이드 인덱스 
	var curSlide = 0; 
	$("#sliderbox").click(function () {
		
		//클릭이 될 때마다 타이머 객체를 제거하고 다시 등록
		//	->클릭을 하면 3초 타이머가 처음부터 다시 시작된다
		clearInterval(tid)
		tid = setInterval(sliderClick, 3000)

		//다음 슬라이드 인덱스
		var nextSlide = curSlide + 1;
		
		//이미지 개수만큼 인덱스 보정(nextSlide)
		nextSlide %= $slider_list.length;
		
		//순환구조 확인
// 		console.log(curSlide + " : " + nextSlide)
		
		// .animate() 함수로 효과넣기
		
		//현재 슬라이드 숨기기 - curSlide
		//	-><div>태그의 왼쪽으로 보내기
// 		$slider_list.eq(curSlide).animate({"변경할속성": "속성값변화량"})
		$slider_list.eq(curSlide).animate({"left": "-=" + $("#sliderbox").css("width")})
		
		//보여줄 다음 슬라이드 준비하기 - nextSlide
		//	-><div>태그의 오른쪽으로 보내기
		$slider_list.eq(nextSlide).css("left", $("#sliderbox").css("width"))
		
		//다음 슬라이드 보여주기 - nextSlide
		//	-><div>안쪽으로 보내기
		$slider_list.eq(nextSlide).animate({"left": "-=" + $("#sliderbox").css("width")})
		
		
		
		
		//순환구조 만들기(증가식)
		curSlide++;
		
		//이미지 개수만큼 인덱스 보정(curSlide)
		curSlide %= $slider_list.length;
		
	})	
})

</script>
</head>
<body>

	<img id="topupBtn" src="/resources/img/topicon.png" href="#">
	
	<div id="top_menu">
	<div class="top_menu_sub">
			


	</div>
	</div>
	
