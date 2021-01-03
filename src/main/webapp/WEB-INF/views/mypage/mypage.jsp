<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<%-- <c:import url="/WEB-INF/views/layout/share.jsp" /> --%>
<!-- <link rel="stylesheet" href="/resources/css/mypage/mypage.css"> -->

<style>
@charset "UTF-8";
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

th{

	background-color: #F5DA81;
}

#container {
	position: relative;
 	z-index: 20; 
	max-width: 954px;
	margin-top: 100px 0 0 ;
}

#content.section_home {
	line-height: 0px;
	padding: 10px 0px 40px;
}

#content {
	positioin: relative;
}

.column {
	float: none;
	width: 100%;
	display: flex;
}

.sh_group .sh_content {
	min-height: 185px;
	padding-top: 9px;
}

.sh_group {
	margin: 16px 8px 0;
	padding: 32px 29px 30px;
	text-align: left;
	border: 1px solid #F5DA81;
	border-radius: 2px;
	background: #fff;
	width: 50%;
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

.box_set{
	top: 10px;
	display: grid;
	font-size: 13px;
	color: #252525;
	right: 20px;
	width: 100px;
	padding-inline-start: 0.75em;
	padding-inline-end: 0.75em;
	padding-block-start: 0.35em;
	padding-block-end: 0.625em;
	min-inline-size: fit-content;
	
}

span{
	padding-left: 125px;
	text-align: right;
	right: -5px;
}
.tit_set{
	width: 50%;
	padding-top: 5px;
}

.txt_set{
	padding-bottom: 15px;
	height: 10px;
}

.c_header{
	padding-bottom: -10px;
	line-height: 19px;
	padding-top: -19px;
	letter-spacing: 3px;
	color: #666;
}

#myinfo{
	hieght: 50%;
	
}
#mypic{
	text-align: left;

}
#info_detail{
	display: inline-block;
	margin-left: 0px;
	padding-top: 10px;
	padding-left: 25px;
}

#pof_pic{
	width: 120px;
	height:120px; 
	border-radius:100px; 
	margin-bottom: 85px;
	margin-rigt: 25px;
	margin-left: 10px;
}

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
<script>

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
                     <c:set value="${userinfo.USER_PROFILEORIGIN }" var="origin" />
                     <c:set value="${userinfo.USER_PROFILESTORED }" var="stored" />

                     <!-- null일겨우 기본이미지 -->
                     <c:if test="${origin eq null && stored eq null }">
                        <img id="pof_pic" src="/resources/img/기본이미지.jpg" alt="유저프로필사진" class="img-thumbnail"/>
                     </c:if>

                     <!-- sns로그인 시 프로필사진 편집 전 -->
                     <c:if test="${stored ne null && origin eq 'snsLogin'}">
                        <img id="pof_pic" src="${userinfo.USER_PROFILESTORED }" alt="유저프로필사진" class="img-thumbnail"/>
                     </c:if>
                     
                     <!-- 프로필사진 편집 시 (sns동일) -->
                     <c:if test="${stored ne null && origin ne null && origin ne 'snsLogin'}">
                        <img id="pof_pic" src="/resources/upload/${userinfo.USER_PROFILESTORED }" alt="유저프로필사진" class="img-thumbnail"/>
                     </c:if>
<%-- 				<img src="/resources/upload/${userinfo.USER_PROFILESTORED }" id="pof_pic" class="img-thumbnail"> --%>
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
						<h3 style="text-align: center; color: #005398; padding-top: 75px;">결제 정보가 없습니다</h3>
					</c:if>				
				</h2>
<!-- 				<a href="/mypage/mypay" class="btn btn-default pull-right btn-sm" role="button">결제하기</a> -->
			</div><hr>
			
			<div class="content">
			<c:choose>
				<c:when test="${empty payList}">									
					<h3 style="text-align: center; color: #005398; padding-top: 75px;">결제 정보가 없습니다</h3>							
				</c:when>
				<c:otherwise>
					<table class="table table-condensed table-hover">
						<tr>
							<th style="width: 15%">회원등급</th>
							<th style="width: 25%">결제 가격</th>
							<th style="width: 30%">결제일</th>
							<th style="width: 30%">만료일</th>
						</tr>

						<tr>
							<td>${payList.GRADE_NAME }</td>
							<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${payList.PRICE }"></fmt:formatNumber></td>
							<td><fmt:formatDate value="${payList.PAY_DATE }" pattern="YYYY/MM/dd"/></td>
							<td>${payList.EXPIRE_DATE }</td>
<%-- 							<td><fmt:formatDate value="${payList.EXPIRE_DATE s}" pattern="yy/MM/dd HH:mm"/></td> --%>
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
					<h3 style="text-align: center; color: #005398; padding-top: 40px;">등록하신 글이 없습니다</h3>
				</c:when>
				<c:otherwise>
					<table class="table table-condensed table-hover">
						<tr>
							<th style="width: 30%">게시판 이름</th>
							<th style="width: 50%">글 제목</th>
							<th style="width: 20%">작성일</th>
						</tr>
							<c:forEach items="${pList}" var="b" varStatus="status" begin="0" end="4">
							<tr>
								<td>${b.BOARD_NAME}</td>
								<td>
						      		<c:choose>
						      			<c:when test="${b.BOARD_NO eq 1 }"> <!-- 공지사항 게시판 -->   	
						      				<a href="/notice/view?board_no=1&article_no=${b.ARTICLE_NO}">${b.ARTICLE_TITLE}</a>    		
						      			</c:when>
						      			<c:when test="${b.BOARD_NO eq 2 }"> <!-- 메이트찾기 게시판 -->   	
						      				<a href="/matefind/view?article_no=${b.ARTICLE_NO}">${b.ARTICLE_TITLE}</a>    		
						      			</c:when>
							      		<c:when test="${b.BOARD_NO eq 3 }"> <!-- 파티모집 -->	
							      			<a href="/recruitboard/view?board_no=3&article_no=${b.ARTICLE_NO}">${b.ARTICLE_TITLE}</a>     	
							      		</c:when>
							      		<c:when test="${b.BOARD_NO eq 4 }"> <!-- 후기게시판 -->
							      			<a href="/review/view?article_no=${b.ARTICLE_NO}">${b.ARTICLE_TITLE}</a> 
							      		</c:when>
							      		<c:when test="${b.BOARD_NO eq 5 }"> <!-- 문의게시판 -->
							      			<a href="/inquiry/view?board_no=5&article_no=${b.ARTICLE_NO}">${b.ARTICLE_TITLE}</a> 
						      			</c:when>
							      		<c:when test="${b.BOARD_NO eq 6 }"> <!-- 이벤트게시판 -->
							      			<a href="/eventboard/view?board_no=6&article_no=${b.ARTICLE_NO}">${b.ARTICLE_TITLE}</a> 
						      			</c:when>
						     		 </c:choose>
						        </td>
								<td><fmt:formatDate value="${b.CREATE_DATE}" pattern="yy/MM/dd"/></td>
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
				<h2 >내가 작성한 댓글<a href="/mypage/mycmmt" class="btn btn-default pull-right btn-sm" role="button">더 보기</a></h2>
			</div><hr>
			
			<div class="sh_content">
			<c:choose>
				<c:when test="${empty cList }">
					<h3 style="text-align: center; color: #005398; padding-top: 40px;">등록하신 댓글이 없습니다</h3>
				</c:when>
				<c:otherwise>
					<table class="table table-condensed table-hover">
						<tr>
							<th style="width: 30%">게시판 이름</th>
							<th style="width: 50%">댓글 내용</th>
							<th style="width: 20%">작성일</th>
						</tr>
							<c:forEach items="${cList}" var="c" varStatus="status" begin="0" end="4">
							<tr>
								<td>${c.BOARD_NAME}</td>
									<c:if test="${c.IS_POSTDELETE==0}">
									<td>
										<c:choose>
										    <c:when test="${c.BOARD_NO eq 1 }"> <!-- 공지사항 게시판 -->   	
										      	<a href="/notice/view?board_no=1&article_no=${c.ARTICLE_NO}">${c.COMMENT_CONTENT}</a>    		
										     </c:when>
										    <c:when test="${c.BOARD_NO eq 2 }"> <!-- 메이트찾기 게시판 -->   	
										      	<a href="/matefind/view?article_no=${c.ARTICLE_NO}">${c.COMMENT_CONTENT}</a>    		
										     </c:when>
											 <c:when test="${c.BOARD_NO eq 3 }"> <!-- 파티모집 -->	
											     <a href="/recruitboard/view?board_no=3&article_no=${c.ARTICLE_NO}">${c.COMMENT_CONTENT}</a>     	
											 </c:when>
											 <c:when test="${c.BOARD_NO eq 4 }"> <!-- 후기게시판 -->
											     <a href="/review/view?article_no=${c.ARTICLE_NO}">${c.COMMENT_CONTENT}</a> 
											 </c:when>
											 <c:when test="${c.BOARD_NO eq 5 }"> <!-- 문의게시판 -->
											    <a href="/inquiry/view?board_no=5&article_no=${c.ARTICLE_NO}">${c.COMMENT_CONTENT}</a> 
										     </c:when>
											 <c:when test="${c.BOARD_NO eq 6 }"> <!-- 이벤트 게시판 -->
											    <a href="/eventboard/view?board_no=6&article_no=${c.ARTICLE_NO}">${c.COMMENT_CONTENT}</a> 
										     </c:when>
									     </c:choose>
									</td>
									</c:if>
									<c:if test="${c.IS_POSTDELETE==1}">
										<td>게시글이 삭제되었습니다.</td>
									</c:if>
								<td><fmt:formatDate value="${c.CREATE_DATE}" pattern="yy/MM/dd"/></td>
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
