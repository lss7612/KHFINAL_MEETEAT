<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
#container {
	position: relative;
	z-index: 20;
	max-width: 954px;
	margin: 0 auto;
}

#content.section_home {
	line-height: 14px;
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

.blind {
	position: absolute;
	clip: react(0 0 0 0);
	width: 1px;
	height: 1px;
	margin: -1px;
	overflow: hidden;
}
.img_frame{
	position: absolute;
	top: 0;
	left: 0;
	width: 80px;
	height: 80px;
	background-position: 0 0;
}

.spimg{
	line-weight: 999px!important;
	display: inline-block;
	overflow: hidden;
	vertical-align: top;
	background-repeat: no-repeat;
}

.sh_lst .pix_desc {
	position: absolute;
	top: 3px;
	left: 0;
	width: 80px;
}

.sh_lst dd {
	overflow: hidden;
	word-break: keep-all;
}

.sh_lst {
	positioin: relative;
	min-height: 80px;
	margin-top: -1px;
	padding-bottom: 8px;
}

dd {
	display: block;
	margin-inline-start: 40px;
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
</style>



<div id="divpage">

	<div id="container">

		<div id="content" class="section_home">
			<div class="column">
				<div class="sh_group">
					<div class="sh_header">
						<h2>회원 정보</h2>
					</div>
					<div class="sh_content">
						<dl class="sh_lst">
							<dt class="blind">프로필 사진</dt>
							<dd class="pic_desc">
								<img src="/resources/upload/${userinfo.USER_PROFILESTORED }" style="width: 150px; height:150px; border-radius:100px; display: block;">
									<span class="spimg img_frame"></span>
							</dd>
							<dt>별명</dt>
							<dd>${userinfo.USER_NICK }</dd>
							<dt>유저 등급</dt>
							<dd>${userinfo.GRADE_NAME }</dd>
							<dt>이메일</dt>
							<dd>${userinfo.USER_EMAIL }</dd>
						</dl>
					</div>
					<p class="btn_area_btm">
						<a href="/mypage/myedit" class="btn btn-default" role="button">수정</a>
					</p>
				</div>
			<div class="sh_group">
				<div class="sh_header">
					<h2>내 결제 정보</h2>
				</div>
				<div class="content">
				
				
				
				</div>
				
				<p class="btn_area_btm">
					<a href="/mypage/mypost" class="btn btn-default" role="button">더 보기</a>
				</p>
			</div>

			</div>
			
<div class="column">

				<div class="sh_group">
					<div class="sh_header">
						<h2>내가 작성한 글</h2>
					</div>
					<div class="sh_content">
						<c:choose>
							<c:when test="${empty pList }">
								<h3>등록하신 글이 없습니다</h3>
							</c:when>

							<c:otherwise>
								<table class="table table-condensed">
									<tr>
										<th style="width: 10%">게시판 이름</th>
										<th style="width: 20%">글 제목</th>
										<th style="width: 15%">작성일</th>
									</tr>

									<c:forEach items="${pList}" var="b" varStatus="status"
										begin="0" end="4">
										<tr>
											<td>${b.BOARD_NAME}</td>
											<td>${b.ARTICLE_TITLE}</td>
											<td>${b.CREATE_DATE}</td>
										</tr>
									</c:forEach>
								</table>

							</c:otherwise>
						</c:choose>
					</div>
					<p class="btn_area_btm">
						<a href="/mypage/mypost" class="btn btn-default pull-right" role="button">더 보기</a>
					</p>
				</div>			
			
			<div class="sh_group">
				<div class="sh_header">
					<h2>내가 작성한 댓글</h2>
				</div>
				<div class="sh_content">
				
				
				</div>
				<p class="btn_area_btm">
					<a href="/mypage/mypost" class="btn btn-default" role="button">더 보기</a>
				</p>
			</div>
		</div>
	</div>
		<!-- content end -->
</div>
	<!-- container end -->
	<c:import url="/WEB-INF/views/layout/share.jsp" />

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
