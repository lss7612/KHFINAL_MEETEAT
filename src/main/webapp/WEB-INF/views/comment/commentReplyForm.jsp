<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<div class="light_padding color_base light_bar_height">
	답글달기
</div>
<div style="width:100%; margin:0 auto" class="vertical_light_padding" >
	<textarea style="width: 100%"id="form_comment_reply" name="comment_update" alertComment="내용" ></textarea>
</div>
<div class="base_bar_height light_padding" style="width:100%; margin:0 auto">
	<button board_no=${board_no } article_no="${article_no }" comment_no="${comment_no }" type="button" id="ReplySumitBtn" class="btn btn-primary pull-right" >답글달기</button>							
</div>

<script type="text/javascript">
var CommentReplyEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: CommentReplyEditors,
	elPlaceHolder: "form_comment_reply", //에디터가 적용될 <textarea>의 id
	sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
	fCreator: "createSEditor2"
})

//코멘트 수정폼의 수정하기를 클릭했을 때
$('#ReplySumitBtn').click(function(){
	console.log($('#form_comment_reply').val())
	putOnRealReplyArea()
	commentReply($(this).attr('board_no'),$(this).attr('comment_no'),$(this).attr('article_no'), $('#form_comment_reply').val())
})

function putOnRealReplyArea(){
	CommentReplyEditors.getById["form_comment_reply"].exec("UPDATE_CONTENTS_FIELD", [])
}


function commentReply(boardNo,commentNo,articleNo,commentContent){
	$.ajax({
		type: "get"
		, url: "/comment/commentreply"
		, data:{board_no : boardNo, comment_no : commentNo, article_no : articleNo , comment_content : commentContent}
		, dataType:"json" //응답받은 데이터의 형식
		, success: function( res ){
			if(res) alert('등록 성공했습니다.');
			$('#refrash_comment_botton').trigger('click')
			
			setTimeout(() => {
				$('#refrash_comment_botton').trigger('click')
			}, 1000)
		}
		, error: function(){
			console.log('실패')
		}
	})
}

</script>