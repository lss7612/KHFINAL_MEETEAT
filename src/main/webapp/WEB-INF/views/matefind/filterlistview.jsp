<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

body {
	margin: 0 auto;
	text-align: center;
}

.thumbnail-wrapper {
	width: 350px;
	margin-top: 30px;
	margin-bottom: 70px;
	padding-left: 8px;
	padding-right: 8px;
	display: inline-block;
}

.thumbnail-img {
	width: 100%;
}

.thumbnail-wrapper h1 {
	margin: 10px 0px 0px;
}

#title {
	margin-top: 0px;
}

.info {
	margin: 6px 0px 0px;
}

.info p {
	margin: 0 auto;
}

.user p {
	margin: 0 auto;
}

#pof_pic{
	width: 120px;
	height:120px; 
	border-radius:100px; 
}


/* 회원 아이디 클릭시 나타나는 목록 CSS */
.userMenu{
	display : inline-block;
	width : 100%;
	position : relative;
}

.userNickMenu{
	cursor : pointer;
}

.userHiddenMenu{ 
	list-style:none;
   	display:none;
	position : absolute; 
	z-index : 1;
} 

.userHiddenMenu > li{
	background-color : #F5DA81;
	position : relative;
	cursor : pointer;
	border : solid 0px;
	padding: 5px 10px 5px 10px;
}

.userHiddenMenu > li:hover{
	background-color : #eee;
}
/* 회원 아이디 클릭시 나타나는 목록 CSS 끝*/

</style>

<script type="text/javascript">

$(document).ready(function(){
	
	console.log('${party_location}');
	console.log('${category}');
	console.log('${meet_time}');

	$("#party_location option[value='${party_location }']").attr("selected", "selected");
	$("#category option[value='${category}']").attr("selected", "selected");
	$("#meet_time option[value='${meet_time}']").attr("selected", "selected");

	
	$("select").change(function() {
		
		console.log("party_location [change]")
		console.log($("#party_location").val())
		console.log($("#meet_time").val())
		console.log($("#category").val())
		
		$.ajax({
			
			url: '/matefind/listFilter'
			, type: 'get'
			, data: {
				party_location: $("#party_location").val()
				, meet_time: $("#meet_time").val()
				, category: $("#category").val()
			} 
			
			, dataType: 'html'
			, success: function(res) {
				
				console.log("filterList 성공")
				
				$('#filterListTable').empty();
				$('#filterListTable').append(res);
				
			}
			
			, error: {
// 				console.log("filterList 실패")
				
			}
			
		}); // ajax 끝
		

	});	// select change 끝

	
	//작성자 정보 누르면 채팅메뉴 나타나게 동작하는 스크립트
	
	//userMenu mouseleave event
	$(".userMenu").mouseleave(function(){
		if($(".userHiddenMenu").is(":visible")){
			console.log("hidden menu close")
			$(".userHiddenMenu").slideUp();
		}
	})
	
	$(".userMenu>span").click(function(){
		
		var submenu = $(this).next("ul");
		if(submenu.is(":visible")){
			submenu.slideUp();
		} else{
			$(".userMenu > ul").slideUp();
			submenu.slideDown();
			//슬라이드 메뉴 조정할려면 left의 style값을 변경하면 됩니다.
			$(submenu).css({"display" : "inline-block", "left" : "40px"});
		}
	})
	
	//작성자 정보 누르면 채팅메뉴 나타나게 동작하는 스크립트 끝

})

//채팅하기 클릭시 동작하는 스크립트
function createChat(e){
	var user_no = $(e).attr("user_no")
	var loginUserNo = $(e).attr("loginUserNo")
	if(loginUserNo == user_no){
		alert("자기 자신과는 대화할 수 없습니다!")
		return false;
	} else {
		window.open("http://localhost:8088/chat/create?user_no="+user_no, "chatCreate"
				, "width = 710px, height = 665px");
	}
}

//채팅하기 클릭시 동작하는 스크립트 끝
</script>




<div id="divpage">

<h1 align="left">메이트찾기</h1>

<hr>

<!-- 필터 -->
	<div class="form-inline">
		<div class="input-group mb-3">
			  <label class="input-group-text" for="party_location">지역</label>
			  <select class="form-control" id="party_location" name="party_location">
			    <option value="">전체</option>
			    <option value="서울특별시">서울특별시</option>
			    <option value="부산광역시">부산광역시</option>
			    <option value="대구광역시">대구광역시</option>
			    <option value="인천광역시">인천광역시</option>
			    <option value="광주광역시">광주광역시</option>
			    <option value="대전광역시">대전광역시</option>
			    <option value="울산광역시">울산광역시</option>
			    <option value="세종특별자치시">세종특별자치시</option>
			    <option value="경기도">경기도</option>
			    <option value="강원도">강원도</option>
			    <option value="충청북도">충청북도</option>
			    <option value="충청남도">충청남도</option>
			    <option value="전라북도">전라북도</option>
			    <option value="전라남도">전라남도</option>
			    <option value="경상북도">경상북도</option>
			    <option value="경상남도">경상남도</option>
			    <option value="제주특별자치도">제주특별자치도</option>
			  </select>
		</div>
			  
		<div class="input-group mb-3">
			  <label class="input-group-text" for="meet_time">시간</label>
			  <select class="form-control" id="meet_time" name="meet_time">
			    <option value="">전체</option>
			    <option value="아침">아침 (06:00 ~ 12:00)</option>
			    <option value="점심">점심 (12:00 ~ 18:00)</option>
			    <option value="저녁">저녁 (18:00 ~ 00:00)</option>
			    <option value="새벽">새벽 (00:00 ~ 06:00)</option>
			  </select>
		</div>
		
		<div class="input-group mb-3">
			  <label class="input-group-text" for="category">종류</label>
			  <select class="form-control" id="category" name="category">
			    <option value="">전체</option>
			    <option value="식사">식사</option>
			    <option value="술">술</option>
			    <option value="카페">카페/디저트</option>
			  </select>
		</div>
	</div>
<!-- //필터 끝 -->


<hr>


<!-- Ajax 필터링 된 List 불러오는 곳 -->
	<div id="filterListTable">
		<c:import url="/WEB-INF/views/matefind/mateFindFilterList.jsp"/>
	</div>



<!-- 버튼 영역v2 -->
	<div class="row">
		<div class="col">
		
			<a href="/matefind/write"><button class="btn btn-primary" style="float: right;">글쓰기</button></a>
		
		</div>
	</div>	
<!-- //버튼 영역v2 -->


</div><!-- //container -->


<c:import url="/WEB-INF/views/layout/footer.jsp" />
