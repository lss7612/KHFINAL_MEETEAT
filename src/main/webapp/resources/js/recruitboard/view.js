var isLoadList = 0;
var tried = 0;



$(document).ready(function(){
	
	//페이지 불러왔을 때 코멘트 가져오기
	setTimeout(function() {
		getCommentList()
	}, 1000);
	
	//본문 수정 버튼 눌렀을 때
	$('#article_modify').click(function(){
		console.log('clicked')
		if(!confirm('수정하시겠습니까?')) return 
		$('#deleteOrModify').attr('action','/recruitboard/modify')
		$('#deleteOrModify').submit();
		
	})
	//본문 삭제 버튼 눌렀을 때 
	$('#article_delete').click(function(){
		console.log('clicked')
		if(!confirm('삭제하시면 되돌릴 수 없습니다. 삭제하시겠습니까?')) return;
		$('#deleteOrModify').attr('action','/recruitboard/delete')
		
	})
	
	
	
	
	
	//스크롤을 마지막으로 내렸을 때 펑션을 최대 2번까지만 가능하도록 만들기
	if($(document).height()==$(window).height()){
		console.log('loading')
		isLoadList+=1;
	}
	//코멘트 새로고침 버튼 클릭시 gif 파일을 한번 불러왔다가 코멘트리스트를 출력하기
	$('#refrash_comment_botton').click(function(){
		
		$('#commentList').html(
				'<div style="text-align:center;"><img style="margin:0 auto;" alt="" src="/resources/img/loading.gif"></div>'
		)
		
		setTimeout(function() {
			getCommentList()
		}, 1500);
	})
	
	//코멘트 달기를 클릭했을때
	$('#commentSumitBtn').click(function () {
		putOnRealTextArea()
		console.log($('#form_comment_content').val())
	    validateAndSubmit()
	});
	
	//스크롤 맨 아래로 내렸을때 게시판 불러오는 코드(미구현)
	 $(window).scroll(function(){
	        
		if(isLoadList==2) return;
		
		var scrolltop = $(document).scrollTop()
		var height = $(document).height()
		var height_win = $(window).height()
//		console.log('scrolltop : ' + scrolltop)
//		console.log('height : ' + height)
//		console.log('height_win : ' + height_win)
		
	        
		if (Math.round( $(window).scrollTop()) == $(document).height() - $(window).height()) {
		    
			console.log('loading')	
			isLoadList += 1;
			
		}  
	 })

})


//**********[text에 스마트에디터 값 적용하기]**********//
function putOnRealTextArea(){
	oEditors.getById["form_comment_content"].exec("UPDATE_CONTENTS_FIELD", []);
}


function validateAndSubmit() {
	if (validationAll()) if (confirm('작성내용을 게시하시겠습니까?')) 
		$('form').submit()
}

//**********[모든 폼 빈칸 검사]**********//
function validationAll() {
  //console.log('validating');
	
  //내용검사
  if(!validationEach($('#form_comment_content'))) return false;
  
  return true;
}

//**********[ 각각 폼 빈칸 검사 ]**********//
function validationEach(form){
	if (form.val() == '' 
			|| form.val() == '&nbsp' 
			|| form.val() == '<p>&nbsp;</p>' 
			|| form.val() == null 
			|| form.val() == undefined
			|| form.val() == '<p><br></p>') 
	{
	    alert(form.attr('alertComment')+'을 입력하세요.');
	    form.focus();
	    return false;
	}
	return true;
}

/*댓글 가져오기 function*/
function getCommentList() {
	$.ajax({
		type: "get"
		, url: "/comment/list"
		, data:{ board_no : 3, article_no : $('#article_no').val()}
		, dataType:"html" //응답받은 데이터의 형식
		, success: function( res ){
			$('#commentList').html(res)
			
		}
		, error: function(){
			
			tried += 1
			if(tried<10) getCommentList()
			if(tried>10){
				$('#commentList').html(
				'<div style="text-align:center">'+
				'현재 서버의 응답이 느립니다.<br> 조금 있다가 시도해주세요'+
				'</div>'
				)
			}
			
			
		}
	})
}