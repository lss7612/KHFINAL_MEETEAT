
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
	$('.updateComment').click(function(){
		console.log($(this).attr('comment_no'))
		closeOtherForms()
		openUpdateForm($(this).attr('comment_no'))
	})
	
	//코멘트삭제을 클릭했을 때
	$('.deleteComment').click(function(){
		if(confirm('삭제하시겠습니까?'))
			deleteComment($(this).attr('comment_no'))
		
	})
	
	//코멘트답글을 클릭했을 때
	$('.commentReply').click(function(){
		console.log($(this).attr('comment_no'))
		closeOtherForms();
		openReplyForm($(this).attr('comment_no'), $(this).attr('article_no'), $(this).attr('board_no'))
	})
	
	
	
	
	
	//코멘트답글보기 클릭시 
	$('.closeOrOpenCommentList').on('click','.openReplyList',function(){
		console.log('open')
		let comment_originno = $(this).attr('comment_originno')
		let id='replysForOriginno'+comment_originno
		
		$('#closeOrOpenCommentList').toggleClass('closeOrOpenCommentList')
		
		$(this).toggleClass('openReplyList')
		$(this).toggleClass('closeReplyList')
		$('#'+id).toggleClass('light_padding')
		
		
		$(this).children().html('개의 답글 숨기기▲')
		openReplyList(comment_originno)
			
	})
	
	//코멘트답글숨기기 클릭시
	$('.closeOrOpenCommentList').on('click','.closeReplyList',function(){
		console.log('close')
		let comment_originno = $(this).attr('comment_originno')
		let id='replysForOriginno'+comment_originno
		
		$(this).toggleClass('openReplyList')
		$(this).toggleClass('closeReplyList')
		$('#'+id).toggleClass('light_padding')
		
		$(this).children().html('개의 답글 보기▼')
		closeReplyList(comment_originno)
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
	let id = 'replyOrUpdateForm'+commentNo
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

function closeOtherForms(){
	$('.replyOrUpdateForm').html('')
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
			alert('불러오기를 실패했습니다')
		}
	})
	
	return true
	
}
function closeReplyList(commentOriginNo){
	let id = 'replysForOriginno' + commentOriginNo
	
	$('#'+id).html('')
}

function reportBtn(e){
	
	var target = $(e).prev().prev().val();
	//console.log("user_no : "+target);
	//console.log("url : "+window.location.href)

	//팝업 
	var frmPop = e.parentElement;
	//console.log(frmPop);
	window.open("http://localhost:8088/report/doReport","report"
			, "width=502px,height=506px")
	frmPop.action = "http://localhost:8088/report/doReport";
	frmPop.target = "report";
	//${user_no}에 작성자 번호에 맞는 변수명을 적어주시면 됩니당.
	frmPop.user_no.value = target; 
	//console.log(frmPop.user_no.value);
	//현재글 URL정보 전달
	frmPop.url.value = window.location.href;
}
