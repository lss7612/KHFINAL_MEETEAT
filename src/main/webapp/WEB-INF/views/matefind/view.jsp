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
	$
})
</script>

</head>
<body>

<div class="container">

<br><br>

	<div class="row">
		<div class="col-2">
			<h4>글번호 [ ${view.article_no} ]</h4>
		</div>
		<div class="col-8"></div>
		<div class="col-2">
			<h4>조회수 [ ${view.article_hit} ]</h4>
		</div>
	</div>
	
<hr>

	<div class="row">
		<div class="col">
			<h1 style="float: left;">${view.article_title }</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col">
			<h2 style="float: left;">#${view.party_location } #${view.meet_time } #${view.category }</h2>
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

	<div class="row" style="background-color: #E0E0E0;">
		${view.article_content }
	</div>
	
	
	
<br><br><br><br>
	
	
<!-- 버튼 영역v2 -->
	<div class="row">
	<div class="col">
		<button class="btn btn-secondary" onclick=goList() style="float: left;">목록으로</button>			
		<button class="btn btn-primary" onclick=goList() style="text-align: center">참여하기</button>			
		
		
		<c:set var="writer" value="${view.user_no }" />
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