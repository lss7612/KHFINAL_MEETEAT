<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/resources/css/recruitboard/view.css">
<link rel="stylesheet" href="/resources/css/recruitboard/comment_ajax.css">
<script type="text/javascript" src="/resources/js/recruitboard/comment_ajax.js"></script>

<div id="commentList_ajax">
<hr>


<c:forEach items="${list }" var="list" >
<div class="border vertical_base_margin comment_lump" >

	<div class="light_padding color_base light_bar_height">
	
		<%-- 댓글 정보 --%>
		<div id="" class=".col-md-4 pull-left commendWriter">
		<c:if test="${list.IS_DELETE eq 0 }">
			<ul class="userMenuList">
				<li class="userMenu">
					<c:if test="${user_nick eq list.USER_NICK }">
						<i style="color:blue; "class="fas fa-user-edit"></i>
					</c:if>
					<span style="cursor:pointer;">${list.USER_NICK }</span>
					<ul class="userHiddenMenu" >
					<!-- model에서 작성자의 회원번호값을 갖고오는 객체를 user_no의 값에 입력해준다. -->
					<li onclick="createChat(this);" user_no="${list.USER_NO }">채팅하기</li>
					</ul>
					<c:if test="${list.REVISION_DATE ne null}"><span>(수정됨)</span></c:if>
				</li>
			</ul>	
		</c:if>
		<c:if test="${list.IS_DELETE ne 0 }">
			<span style="color:white">삭제된 코멘트입니다.</span>
		</c:if>
		</div>
		<div id="" class=".col-md-4 pull-right commendFunction"  style="text-align:center;">
			<c:if test="${list.IS_DELETE eq 0 }">
			<c:if test="${user_nick eq list.USER_NICK }">
				<span comment_no="${list.COMMENT_NO }" id="" class="cursorPointer updateComment">수정</span>
				<span comment_no="${list.COMMENT_NO }" id="" class="cursorPointer deleteComment">삭제</span>
			</c:if>
			<span board_no = ${list.BOARD_NO } article_no="${list.ARTICLE_NO }" comment_no="${list.COMMENT_NO }" class=" cursorPointer commentReply">답글</span>
			</c:if>
			<span class=" ">
			<fmt:formatDate value="${list.CREATE_DATE }" pattern="yy/MM/dd hh:mm" />
			</span>
			|
			<div class="commentReport" style="display : inline-block;" >
				<form method="POST">
					<input type="hidden" name="user_no" value="${list.USER_NO }"/>
					<input type="hidden" name="url" />
					<button class="commentReportBtn" onclick="reportBtn(this)">🚨</button>
				</form>
			</div>
		</div>
		
	</div>
	
	<div class='clearfix'></div>
	
	
	<%-- 댓글 내용 --%>
	<div class="base_padding">
		<c:if test="${list.IS_DELETE eq 0 }">
			<span>${list.COMMENT_CONTENT }</span>
		</c:if>
		<c:if test="${list.IS_DELETE ne 0 }">
			<span style="color:#ccc">삭제된 코멘트입니다.</span>
		</c:if>
		
		
		<c:if test="${list.CNTREPLY > 0 }">
		
		<div id="closeOrOpenCommentList" class="closeOrOpenCommentList">
			<span comment_originno="${list.COMMENT_NO }" class="openReplyList" style="color:blue; cursor:pointer; font-size:0.85em">
				${list.CNTREPLY }<span>개의 답글 보기▼</span> <!-- 이걸 누르면 openReply Class가 closeReply Class로 바뀜 -->
			</span>
		</div>
		
		
		</c:if>
		
		<%-- 대댓글 리스트 불러오는 공간 --%>
		<div class="" id="replysForOriginno${list.COMMENT_NO }">
		</div>
		
		
		
	</div>
	
	<%-- 대댓글입력란 --%>
	<div id="replyOrUpdateForm${list.COMMENT_NO }" class="replyOrUpdateForm" style="width:90%; margin: 0 auto;">
	</div>
	
	
	
</div>
</c:forEach>
</div>

