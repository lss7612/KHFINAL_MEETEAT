<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 



<!DOCTYPE html>
<html>
<head>

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

</style>

</head>
<body>

<div class="container">

<h1>MateFind List</h1>


<hr>

	<div class="filter">
	<h4>필터</h4>
	
	<form action="/matefind/search" method="post">
		<div class="input-group mb-3">
		  <label class="input-group-text" for="inputGroupSelect01">지역</label>
		  <select class="form-select" id="inputGroupSelect01">
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
	
		  <label class="input-group-text" for="inputGroupSelect01">시간</label>
		  <select class="form-select" id="inputGroupSelect01">
		    <option selected>시간</option>
		    <option value="1">아침</option>
		    <option value="2">점심</option>
		    <option value="3">저녁</option>
		  </select>
	
		  <span style="width: 50px;"></span>
	
		  <label class="input-group-text" for="inputGroupSelect01">종류</label>
		  <select class="form-select" id="inputGroupSelect01">
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
						<img style="width: 50px; height: 50px;" src="https://i.pinimg.com/474x/7d/56/56/7d5656879b5d6ed45779f89c4e89c91a.jpg" alt="유저프로필사진">
					</span>
					
					<span class="user-right" style="float: right; height: 50px;">
						host <br>
<!-- 						nick -->
						${list.user_nick }
					</span>
				</p>
			
			</div>
		</div>
		
	
	</c:forEach>


<!-- 버튼 영역v2 -->
	<div class="row">
		<div class="col">
		
			<a href="/matefind/write"><button class="btn btn-primary" style="float: right; margin-bottom: 50px;">글쓰기</button></a>
		
		</div>
	</div>	
<!-- //버튼 영역v2 -->

<%-- <jsp:include page="./paging.jsp" /> --%>

</div><!-- //container -->


</body>
</html>