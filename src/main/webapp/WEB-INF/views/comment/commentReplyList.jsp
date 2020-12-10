<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/recruitboard/view.css">
<link rel="stylesheet" href="/resources/css/recruitboard/comment_ajax.css">

<div id="commentReply">
<hr>


<c:forEach items="${list }" var="list" >
<div class="border comment_lump" style="margin:5px;">

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
				<span comment_no="${list.COMMENT_NO }" id="" class="cursorPointer updateReply">수정</span>
				<span comment_no="${list.COMMENT_NO }" id="" class="cursorPointer deleteReply">삭제</span>
			</c:if>
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
		
	</div>
	
	<%-- 대댓글입력란 --%>
	<div id="replyOrUpdateFormforReply${list.COMMENT_NO }" style="width:90%; margin: 0 auto;">
	</div>
	
	
</div>
</c:forEach>
</div>


<script type="text/javascript">
$(document).ready(function(){
	
	//코멘트영역으로 들어오면 시간과 답글수정삭제을 바까준다
	$('#commentList').mouseenter(function(){
		$('span.toggle_invisible').toggleClass('invisible')
		$('span.toggle_invisible').toggleClass('none_width')
	})
	$('#commentList').mouseleave(function(){
		$('span.toggle_invisible').toggleClass('invisible')
		$('span.toggle_invisible').toggleClass('none_width')
	})
	
	
	//코멘트수정을 클릭했을 때
	$('.updateReply').click(function(){
		console.log($(this).attr('comment_no'))
		openUpdateForm($(this).attr('comment_no'))
	})
	
	//코멘트삭제을 클릭했을 때
	$('.deleteReply').click(function(){
		if(confirm('삭제하시겠습니까?'))
			deleteComment($(this).attr('comment_no'))
		
	})
	
	//코멘트답글을 클릭했을 때
	$('.commentReply').click(function(){
		console.log($(this).attr('comment_no'))
		openReplyForm($(this).attr('comment_no'), $(this).attr('article_no'), $(this).attr('board_no'))
	})
	
	
	
	
})



function deleteComment(commentNo) {
	$.ajax({
		type: "get"
		, async: true
		, url: "/comment/delete"
		, data:{comment_no : commentNo}
		, dataType:"json" //응답받은 데이터의 형식
		, success: function( res ){
			if(res) alert('삭제에 성공했습니다.');
			$('#refrash_comment_botton').trigger('click')
			setTimeout(() => {
				$('#refrash_comment_botton').trigger('click')
			}, 1000);
		}
		, error: function(){
			console.log('실패')
		}
	})
}

function openUpdateForm(commentNo) {
	let id = 'replyOrUpdateFormforReply'+commentNo
	console.log(id)
	
	$.ajax({
		type: "get"
		, async: true		
		, url: "/comment/openupdateform"
		, data:{comment_no : commentNo}
		, dataType:"html" //응답받은 데이터의 형식
		, success: function( res ){
			console.log('성공')
			$('#'+id).html(res)
		}
		, error: function(){
			console.log('실패')
		}
	})
	
}

function openReplyForm(commentNo, articleNo, boardNo) {
	let id = 'replyOrUpdateForm'+commentNo
	console.log(id)
	console.log('boardNo : '+ boardNo)
	$.ajax({
		type: "get"
		, url: "/comment/openReplyForm"
		, async: true
		, data:{comment_no : commentNo, article_no : articleNo, board_no : boardNo}
		, dataType:"html" //응답받은 데이터의 형식
		, success: function( res ){
			
			$('#'+id).html(res)
		}
		, error: function(){
			console.log('실패')
		}
	})
	
}

function openReplyList(commentOriginNo){
	
	let id = 'replysForOriginno' + commentOriginNo
	
		$.ajax({
		type: "get"
		, async: true
		, url: "/comment/openReplyList"
		, data:{comment_originno : commentOriginNo}
		, dataType:"html" //응답받은 데이터의 형식
		, success: function( res ){
			$('#'+id).html(
				'<div style="text-align:center;"><img style="margin:0 auto;" alt="" src="/resources/img/loading.gif"></div>'
			)
			setTimeout(() => {
				$('#'+id).html(res)
			}, 1000);
		}
		, error: function(){
			console.log('실패')
		}
	})
	
}
function closeReplyList(commentOriginNo){
	let id = 'replysForOriginno' + commentOriginNo
	
	$('#'+id).html('')
}

</script>