<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/resources/css/common/common.css">
<script type="text/javascript" src="/resources/js/recruitboard/comment_ajax.js"></script>

<div id="commentList_ajax">
<hr>


<c:forEach items="${list }" var="list" >
<div class="border vertical_base_margin comment_lump" >

	<div class="light_padding color_base light_bar_height">
	
		<%-- 댓글 정보 --%>
		<div id="" class=".col-md-4 pull-left commendWriter">
		<c:if test="${list.IS_DELETE eq 0 }">
			<c:if test="${user_nick eq list.USER_NICK }">
				<i style="color:blue; "class="fas fa-user-edit"></i>
			</c:if>
			<span>${list.USER_NICK }</span>
			<c:if test="${list.REVISION_DATE ne null}"><span>(수정됨)</span></c:if>
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
		
		
		<div class="" id="replysForOriginno${list.COMMENT_NO }">
		</div>
		
		
		
	</div>
	
	<%-- 대댓글입력란 --%>
	<div id="replyOrUpdateForm${list.COMMENT_NO }" style="width:90%; margin: 0 auto;">
	</div>
	
	
	
</div>
</c:forEach>
</div>

