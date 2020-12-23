<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
#container {
	position: relative;
/* 	z-index: 20; */
	max-width: 954px;
	margin: 0 auto;
}

#content.section_home {
	line-height: 0px;
	zoom: 1;
	padding: 16px 12px 94px;
}

#content {
	positioin: relative;
}

div {
	display: block;
}

.column {
	float: none;
	width: 100%;
}

.sh_group .sh_content {
	min-height: 185px;
	padding-top: 9px;
}

.sh_group {
	margin: 16px 8px 0;
	padding: 32px 29px 30px;
	text-align: left;
	border: 1px solid #dadada;
	border-radius: 2px;
	background: #fff;
}

.section_home {
	padding: 17px 0 0 1px;
}

.sh_header .btn_update {
	position: absolute;
	top: -4px;
	right: -4px;
	padding: 5px;
}

a {
	text-decoration: none;
}

a: -webkit-any-link {
	color: -webkit-link;
	cursor: pointer;
}

table {
 	table-layout: fixed;  
}

table, th {
	text-align: center;
}

td:nth-child(1) {
	text-align: center;
	
	white-space:nowrap;	
	text-overflow: ellipsis;
	overflow: hidden;
}
td:nth-child(2) {
	text-align: center;
	
	white-space:nowrap;	
	text-overflow: ellipsis;
	overflow: hidden;
}

#myinfo{

	display: inline-block;
	
}

.box_set{
	top: 10px;
	display: grid;
	border-bottom: 1px solid #ebebeb;
	font-size: 15px;
	color: #252525;
	right: 20px;
	width: 420px;
	padding-inline-start: 0.75em;
	padding-inline-end: 0.75em;
	padding-block-start: 0.35em;
	padding-block-end: 0.625em;
	min-inline-size: min-content;
	padding-left: 10px;
	padding-bottom: 10px;

	
}

span{
	padding-left: 165px;
	text-align: right;
	right: -5px;
}
.tit_set{
	margin-top: 5px;
	padding-top: 10px;
}

.txt_set{
	padding-bottom: 10px;
	height: 10px;
}

.c_header{
	padding-bottom: -10px;
	line-height: 19px;
	padding-top: -19px;
	letter-spacing: 3px;
}

</style>



<div id="divpage">

<div id="container">
<div class="c_header">
		<h1>마이페이지</h1>
</div>
		
<div id="content" class="section_home">
	<div class="column">
		<!-- 회원 정보 -->
		<div class="sh_group">
			<div class="sh_header">
				<h2>회원 정보 <a href="/mypage/myedit" class="btn btn-default pull-right btn-sm" role="button">수정</a></h2>
			</div>

			<div id="myinfo">
				<div><img src="/resources/upload/${userinfo.USER_PROFILESTORED }" style="width: 180px; height:180px; border-radius:100px; display: block;"></div>
				<div class="box_set">
					<strong class="tit_set">닉네임</strong> <span class="txt_set">${userinfo.USER_NICK }</span>
				</div>
				<div class="box_set">
					<strong class="tit_set">아이디</strong> <span class="txt_set">${userinfo.USER_ID }</span>
				</div>
				<div class="box_set">
					<strong class="tit_set">유저 등급</strong> <span class="txt_set">${userinfo.GRADE_NAME }</span>
				</div>
				<div class="box_set">
					<strong class="tit_set">이메일</strong> <span class="txt_set">${userinfo.USER_EMAIL }</span>
				</div>
			</div>
		</div><!-- 회원 정보 끝 -->
		
		<!-- 내 결제 정보 -->
		<div class="sh_group">
			<div class="sh_header">
				<h2>결제 정보 <a href="/mypage/mypay" class="btn btn-default pull-right btn-sm" role="button">결제하기</a></h2>
			</div>
			
			<div class="content">
			<c:choose>
				<c:when test="${empty list} ">
					<h3>결제 정보가 없습니다</h3>
					</c:when>
				<c:otherwise>
					<table class="table table-condensed">
						<tr>
							<th style="width: 20%">결제일</th>
							<th style="width: 50%">결제 가격</th>
							<th style="width: 30%">결제</th>
						</tr>

						<tr>
							<td>결제일</td>
							<td>결제 가격</td>
							<td>결제어쩌구</td>
						</tr>
					</table>					
				</c:otherwise>
			</c:choose>
			</div>
		</div><!-- 내 결제 정보 끝 -->

	</div>
			
	<div class="column">
		<!-- 내가 작성한 글  -->
		<div class="sh_group">
			<div class="sh_header">
				<h2>작성글 <a href="/mypage/mypost" class="btn btn-default pull-right btn-sm" role="button">더 보기</a></h2>
			</div>
			
			<div class="sh_content">
			<c:choose>
				<c:when test="${empty pList }">
					<h3>등록하신 글이 없습니다</h3>
				</c:when>
				<c:otherwise>
					<table class="table table-condensed">
						<tr>
							<th style="width: 20%">게시판 이름</th>
							<th style="width: 50%">글 제목</th>
							<th style="width: 30%">작성일</th>
						</tr>

						<c:forEach items="${pList}" var="b" varStatus="status" begin="0" end="4">
						<tr>
							<td>${b.BOARD_NAME}</td>
							<td>${b.ARTICLE_TITLE}</td>
							<td><fmt:formatDate value="${b.CREATE_DATE}" pattern="yy/MM/dd HH:mm"/></td>
						</tr>
						</c:forEach>
					</table>

				</c:otherwise>
			</c:choose>
			</div>
		</div><!-- 내가 작성한 글 끝! -->		
			
		<!-- 내가 작성한 댓글 -->	
		<div class="sh_group">
			<div class="sh_header">
				<h2>작성댓글<a href="/mypage/mycmmt" class="btn btn-default pull-right btn-sm" role="button">더 보기</a></h2>
			</div>
			
			<div class="sh_content">
			<c:choose>
				<c:when test="${empty cList} ">
					<h3>등록하신 글이 없습니다</h3>
				</c:when>
				<c:otherwise>
					<table class="table table-condensed">
						<tr>
							<th style="width: 20%">게시판 이름</th>
							<th style="width: 40%">글 제목</th>
							<th style="width: 40%">댓글 내용</th>
						</tr>

						<c:forEach items="${cList}" var="c" varStatus="status" begin="0" end="4">
						<tr>
							<td>${c.BOARD_NAME}</td>
							<td>${c.ARTICLE_TITLE}</td>
							<td>${c.COMMENT_CONTENT}</td>
						</tr>
						</c:forEach>
					</table>					
				</c:otherwise>
			</c:choose>
			</div>

		</div><!-- 내 댓글 끝 -->
	</div>
	
</div><!-- content end -->
</div><!-- container end -->
</div><!-- divpage end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
