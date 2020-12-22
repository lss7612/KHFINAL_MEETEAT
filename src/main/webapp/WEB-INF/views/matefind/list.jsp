<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 



<!DOCTYPE html>
<html>
<head>

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

body {
	margin: 0 auto;
	text-align: center;
}

.filter {
	display: inline-block;
	background-color: #E0E0E0;
}

.thumbnail-wrapper {
	width: 350px;
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

.info {
	margin: 6px 0px 0px;
}

.info p {
	margin: 0 auto;
}

.user p {
	margin: 0 auto;
}


/* 회원 아이디 클릭시 나타나는 목록 CSS */
#userMenuList{
   list-style:none;
   padding : 0 0 0 0;
}

#userHiddenMenu{ 
	list-style:none;
   	display:none;
	padding : 0 0 0 40px; 
	position : absolute; 
} 

#userHiddenMenu > li{
	background-color : #ff8f11;
	position : relative;
	cursor : pointer;
	border : solid #e46508 1px;
	padding : 3px 3px 3px 3px;
}
/* 회원 아이디 클릭시 나타나는 목록 CSS 끝*/

</style>

<script type="text/javascript">

//작성자 정보 누르면 채팅메뉴 나타나게 동작하는 스크립트
$(document).ready(function(){
	$("#userMenu>span").click(function(){
		
		//2. 슬라이드 형식으로 나타나기
		var submenu = $(this).next("ul");
		if(submenu.is(":visible")){
			submenu.slideUp();
		} else{
			submenu.slideDown();
		}
	})
})
//작성자 정보 누르면 채팅메뉴 나타나게 동작하는 스크립트 끝

//채팅하기 클릭시 동작하는 스크립트
function createChat(){
	window.open("http://localhost:8088/chat/create?user_no=${user_no}"
			, "width = 710px, height = 665px");
}
//채팅하기 클릭시 동작하는 스크립트 끝
</script>

</head>
<body>

<div class="container">

<h1>MateFind List</h1>


<hr>

	<div class="filter">
	<h4>필터</h4>
	
	<form action="/matefind/search" method="post">
		<div class="input-group mb-3">
		  <label class="input-group-text" for="party_location">지역</label>
		  <select class="form-select" id="party_location" name="party_location">
		    <option selected>지역</option>
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
		  
		  <span style="width: 50px;"></span>
	
		  <label class="input-group-text" for="meet_time">시간</label>
		  <select class="form-select" id="meet_time" name="meet_time">
		    <option selected>시간</option>
		    <option value="1">아침</option>
		    <option value="2">점심</option>
		    <option value="3">저녁</option>
		  </select>
	
		  <span style="width: 50px;"></span>
	
		  <label class="input-group-text" for="category">종류</label>
		  <select class="form-select" id="category" name="category">
		    <option selected>종류</option>
		    <option value="1">식사</option>
		    <option value="2">술</option>
		    <option value="3">카페/디저트</option>
		  </select>
		</div>
		<button type="button" class="btn btn-primary">검색하기</button>
	
	</form>
	</div>

<br><br>

<div class="locSort">
	<div class="row">
		<a href="">전체</a>
		<a href="">서울</a>
		<a href="">경기</a>
		<a>인천</a>
		<a>강원</a>
		<a>충청</a>
		<a>전라</a>
		<a>경상</a>
		<a>제주</a>
	</div>
</div>

	<c:forEach items="${mateFindList }" var="list">
	
	<div class="thumbnail-wrapper">
		<a href="/matefind/view?article_no=${list.article_no }">
		
			<img class="thumbnail-img" style="margin-bottom: 10px;" alt="썸네일이미지" src="https://www.bloter.net/wp-content/uploads/2016/08/%EC%8A%A4%EB%A7%88%ED%8A%B8%ED%8F%B0-%EC%82%AC%EC%A7%84.jpg">
			
			<h2 style="white-space:nowrap; text-overflow: ellipsis; overflow: hidden;">${list.article_title }</h2>
			
		</a>
			<div class="info">
			
				<p style="	white-space:nowrap;	
						text-overflow: ellipsis;
						overflow: hidden;"># ${list.party_location }</p>
				<p># ${list.meet_time }</p>
				<p># ${list.category }</p>
				
			</div>
			<div class="user">
			<hr style="margin: 4px 0px;">
				<p class="span-parent">
					<span class="user-left" style="float: right;">
						<img style="width: 50px; height: 50px;" src="${list.user.user_profilestored }" alt="유저프로필사진">
					</span>
					
					
					<ul id="userMenuList">
						<li id="userMenu">
							<span>
							${list.user.user_id } <br>
							${list.user.user_nick }
							</span>
							<ul id="userHiddenMenu" >
								<li onclick="createChat();" >채팅하기</li>
							</ul>
						</li>
					</ul>
<!-- 					<span class="user-right" style="float: right; height: 50px;"> -->
<%-- 						${list.user.user_id } <br> --%>
<%-- 						${list.user.user_nick } --%>
<!-- 					</span> -->
<!-- 					<ul id="userHiddenMenu" > -->
<!-- 						<li onclick="createChat();" >채팅하기</li> -->
<!-- 					</ul> -->
				</p>
			
			</div>
		</div>
		
	
	</c:forEach>
	
<div class="row">
	<div class="col" style="text-align: center;">
		<jsp:include page="./paging.jsp" />
	</div>
</div>

<!-- 버튼 영역v2 -->
	<div class="row">
		<div class="col">
		
			<a href="/login/main"><button class="btn btn-secondary" style="float: left; margin-bottom: 50px;">로그인메인</button></a>
			<a href="/matefind/write"><button class="btn btn-primary" style="float: right; margin-bottom: 50px;">글쓰기</button></a>
		
		</div>
	</div>	
<!-- //버튼 영역v2 -->


</div><!-- //container -->


</body>
</html>