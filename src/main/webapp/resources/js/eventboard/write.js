$(document).ready(function(){
	
	$('#form_article_title').focus();
	
	let windowHeight = $(window).height() 
	let windowWidth = $(window).width() 
	
	$('.modal_img_upload').css('padding-top',windowHeight/10)

	$('#btn_submit').click(function(){
		putOnRealTextArea()
		validateAndSubmit()
		
	})
	
	/*제목 40글자 제한*/
	$('#form_article_title').focusout(function(){
		if($(this).val().length > 40) alert('제목은 40글자까지만 가능합니다.')
		$(this).val($(this).val().substring(0,39))
	})
	
	/*img박스 누르면 form태그와 연결해줌*/
	$('#bigImgBox').click(function(){
	  console.log('clicked')
	  $('#form_img1').trigger("click")
	})
	/*파일 등록 시*/
	$('#form_img1').change(function(){
	  imgFormSubmit();
	})
	
	
})


function validateAndSubmit() {
	if (validationAll()){ 
		if (confirm('작성내용을 게시하시겠습니까?')){ 
			openLoadingModal()
			$('#articleSubmitForm').submit()
		}
	}
}

//**********[모든 폼 빈칸 검사]**********//
function validationAll() {

  //제목검사
  if(!validationEach($('#form_article_title'))) return false
  
  //날짜검사
  if(!validationEach($('#form_start_date'))) return false
  
  //시간대검사
  if(!validationEach($('#form_terminate_date'))) return false
  
  //시간검사
  if(!validationEach($('#form_article_content'))) return false
  
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
	    alert(form.attr('alertComment')+'을 입력하세요.')
	    form.focus()
	    return false
	}
	return true
}

function putOnRealTextArea(){
	oEditors.getById["form_article_content"].exec("UPDATE_CONTENTS_FIELD", [])
}


function openLoadingModal() {
	$('.modal_img_upload').toggleClass('invisible')
	setTimeout(() => {
		$('.modal_img_upload span').html('이미지 용량이 크네요.. 조금만 더 기다려주세요..')
	}, 3000);
	setTimeout(() => {
		$('.modal_img_upload span').html('다음부턴 용량 작은것만 올리세요...')
	}, 10000);
	setTimeout(() => {
		$('.modal_img_upload span').html('기다려주세요..뒤로가기 하지말고..')
	}, 17000);
	setTimeout(() => {
		$('.modal_img_upload span').html('일하고있어요.. 멈춘거 아닙니다.')
	}, 24000);
	setTimeout(() => {
		$('.modal_img_upload span').html('대단한 인내심이군요.. 30초째입니다.')
	}, 31000);
	setTimeout(() => {
		$('.modal_img_upload span').html('여러분의 시간 낭비를 도와드리고있습니다.')
	}, 38000);
	setTimeout(() => {
		$('.modal_img_upload span').html('시간은 금입니다. 그리고 당신은 지금 금을 버리고있죠')
	}, 45000);
	setTimeout(() => {
		$('.modal_img_upload span').html('아 죄송해요 기다리다 깜빡졸았습니다..')
	}, 52000);
	setTimeout(() => {
		$('.modal_img_upload span').html('담배는 몸에 해롭습니다. 그리고 기다리는건 몸에 더 해롭죠')
	}, 59000);
	setTimeout(() => {
		$('.modal_img_upload span').html('아니 도대체 얼마나 용량 큰걸 올리는거죠?')
	}, 66000);
	setTimeout(() => {
		$('.modal_img_upload span').html('앗 아직 안가셨네요?')
	}, 72000);
}


function imgFormSubmit(){
	

	let form = $('#imgForm')[0];
    let formData = new FormData(form);
	
	console.log(formData)
	$.ajax({
		type: "POST"
		, enctype: 'multipart/form-data'
		, url: "/recruitboard/saveTmpFile_ajax"
		, data: formData
		, contentType: false
		, processData: false
		, dataType:"json" //응답받은 데이터의 형식
		, success: function( res ){
			console.log(res)
			if(res.StoredPath01!=null){
				$('#bigImgBox').html(
					'<img class="big-upload-image" alt="" src="'+ res.StoredPath01 +'">'		
				)
				$('#form_ext01').val(res.ext01)
			}
			
		}
		, error: function(){
			console.log('실패')
		}
	})
}







