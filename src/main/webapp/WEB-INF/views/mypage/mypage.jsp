<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="/resources/css/mypage/mypage.css">

<style>
td{
	text-align: center;
	
	white-space:nowrap;	
	text-overflow: ellipsis;
	overflow: hidden;
}
td:nth-child(0) {
	text-align: center;
	
	white-space:nowrap;	
	text-overflow: ellipsis;
	overflow: hidden;
}


</style>
<script type="text/javascript">

// $(document).ready(function(){
	
// 	if(confirm('결제회원만 접근 가능합니다.\n 결제하시겠습니까?')){
// 		location.href='/mypay/mypay'
// 	} else {
// 		window.history.back()
// 	}
	
// })

</script>
<div id="divpage">

<div class="c_header">
	<h1>마이페이지</h1>
</div>
		
<div id="content" class="section_home">
	<div class="column">
		<!-- 회원 정보 -->
		<div class="sh_group">
			<div class="sh_header">
				<h2>내 프로필 정보 <a href="/mypage/myedit" class="btn btn-default pull-right btn-sm" role="button">수정하기</a></h2>	
			</div><hr>

			<div id="myinfo">
				<div id="mypic"><img src="/resources/upload/${userinfo.USER_PROFILESTORED }" id="pof_pic">
			<div id="info_detail">
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
			</div>
			</div>
		</div><!-- 회원 정보 끝 -->
		
		<!-- 내 결제 정보 -->
		<div class="sh_group">
			<div class="sh_header">
				<h2>내 결제 정보 
					<c:if test="${userinfo.USER_GRADE eq 2}">
						<a href="/mypay/mypay" class="btn btn-default pull-right btn-sm" role="button">결제하기</a>
					</c:if>
					<c:if test="${userinfo.USER_GRADE eq 1}">
						<a href="/mypay/payCancel" class="btn btn-default pull-right btn-sm" role="button">결제 해지</a>
					</c:if>
					<c:if test="${userinfo.USER_GRADE eq 3}">
						<div>결제 정보가 없습니다</div>
					</c:if>				
				</h2>
<!-- 				<a href="/mypage/mypay" class="btn btn-default pull-right btn-sm" role="button">결제하기</a> -->
			</div><hr>
			
			<div class="content">
			<c:choose>
				<c:when test="${empty payList}">									
					<h3>결제 정보가 없습니다</h3>							
				</c:when>
				<c:otherwise>
					<table class="table table-condensed">
						<tr>
							<th style="width: 15%">회원등급</th>
							<th style="width: 15%">결제 가격</th>
							<th style="width: 35%">결제일</th>
							<th style="width: 35%">만료일</th>
						</tr>

						<tr>
							<td>${payList.GRADE_NAME }</td>
							<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${payList.PRICE }"></fmt:formatNumber></td>
							<td><fmt:formatDate value="${payList.PAY_DATE }" pattern="yy/MM/dd HH:mm"/></td>
							<td><fmt:formatDate value="${payList.PAY_DATE }" pattern="yy/MM/dd HH:mm"/></td>
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
				<h2>내가 작성한 글 <a href="/mypage/mypost" class="btn btn-default pull-right btn-sm" role="button">더 보기</a></h2>
			</div><hr>
			
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
								<c:choose>
									<c:when test="${b.IS_DELETE eq 0 }">
										<td>${b.ARTICLE_TITLE}</td>
									</c:when>
									<c:otherwise>
										<td style="color: red;">삭제된 게시글입니다.</td>
									</c:otherwise>
								</c:choose>
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
				<h2>내가 작성한 댓글<a href="/mypage/mycmmt" class="btn btn-default pull-right btn-sm" role="button">더 보기</a></h2>
			</div><hr>
			
			<div class="sh_content">
			<c:choose>
				<c:when test="${empty cList }">
					<h3>등록하신 글이 없습니다</h3>
				</c:when>
				<c:otherwise>
					<table class="table table-condensed">
						<tr>
							<th style="width: 20%">게시판 이름</th>
							<th style="width: 50%">댓글 제목</th>
							<th style="width: 30%">작성일</th>
						</tr>
							<c:forEach items="${cList}" var="c" varStatus="status" begin="0" end="4">
							<tr>
								<td>${c.BOARD_NAME}</td>
								<c:choose>
									<c:when test="${c.IS_DELETE eq 0 }">
										<td>${c.COMMENT_CONTENT}</td>
									</c:when>
									<c:otherwise>
										<td style="color: red;">삭제된 댓글입니다.</td>
									</c:otherwise>
								</c:choose>
								<td><fmt:formatDate value="${c.CREATE_DATE}" pattern="yy/MM/dd HH:mm"/></td>
							</tr>
							</c:forEach>

					</table>

				</c:otherwise>
			</c:choose>
			</div>

		</div><!-- 내 댓글 끝 -->
	</div>
	
</div><!-- content end -->

</div><!-- divpage end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
