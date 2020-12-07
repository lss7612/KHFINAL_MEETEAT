

$(document).ready(function () {
  $('#btn_submit').click(function () {
	putOnRealTextArea()
	console.log($('#form_article_content').val())
    validateAndSubmit()
  });
});

function validateAndSubmit() {
	if (validationAll()) if (confirm('작성내용을 게시하시겠습니까?')) 
	$('form').submit()
}

//**********[모든 폼 빈칸 검사]**********//
function validationAll() {
  //console.log('validating');

  //제목검사
  if(!validationEach($('#form_article_title'))) return false
  
  //날짜검사
  if(!validationEach($('#form_meet_time'))) return false
  
  //시간대검사
  if(!validationEach($('#form_time_area'))) return false
  
  //시간검사
  if(!validationEach($('#form_time_time'))) return false
  
  //분검사
  if(!validationEach($('#form_time_minute'))) return false
  
  //지역검사
  if(!validationEach($('#form_party_location'))) return false
  
  //내용검사
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

//**********[text에 스마트에디터 값 적용하기]**********//
function putOnRealTextArea(){
	oEditors.getById["form_article_content"].exec("UPDATE_CONTENTS_FIELD", [])
}