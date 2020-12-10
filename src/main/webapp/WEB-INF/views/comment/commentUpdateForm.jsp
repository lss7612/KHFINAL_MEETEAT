<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<div class="light_padding color_base light_bar_height">
	댓글수정
</div>
<div style="width:100%; margin:0 auto" class="vertical_light_padding" >
	<textarea style="width: 100%"id="form_comment_update" name="comment_update" alertComment="내용" >${comment_content }</textarea>
</div>
<div class="base_bar_height light_padding" style="width:100%; margin:0 auto">
	<button comment_no="${comment_no }" type="button" id="UpdateSumitBtn" class="btn btn-primary pull-right" >수정하기</button>							
</div>

<script type="text/javascript">
var CommentUpdateEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: CommentUpdateEditors,
	elPlaceHolder: "form_comment_update", //에디터가 적용될 <textarea>의 id
	sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
	fCreator: "createSEditor2"
})

/* CommentUpdateEditors[0].exec("LOAD_CONTENTS_FIELD"); */

//코멘트 수정폼의 수정하기를 클릭했을 때
$('#UpdateSumitBtn').click(function(){
	putOnRealUpdateArea()
	if(confirm('수정하시겠습니까?'))
	commentUpdate($(this).attr('comment_no'), $('#form_comment_update').val())
})

function putOnRealUpdateArea(){
	CommentUpdateEditors.getById["form_comment_update"].exec("UPDATE_CONTENTS_FIELD", [])
	
}


function commentUpdate(commentNo, commentContent){
	$.ajax({
		type: "get"
		, url: "/comment/commentupdate"
		, data:{comment_no : commentNo, comment_content : commentContent}
		, dataType:"json" //응답받은 데이터의 형식
		, success: function( res ){
			if(res) alert('수정 성공했습니다.');
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