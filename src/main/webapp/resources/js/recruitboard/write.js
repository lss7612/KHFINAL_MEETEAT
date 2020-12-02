var vacancy = '';
var nbsp = '&nbsp';
var pnbsp = '<p>&nbsp;</p>'

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

//**********[form validation]**********//
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

  //내용검사
  if(!validationEach($('#form_article_content'))) return false;
  
  return true;
}

function validationEach(form){
	console.log(form.val())
	if (form.val() == vacancy 
			|| form.val() == nbsp 
			|| form.val() ==pnbsp 
			|| form.val() == null 
			|| form.val() == undefined
			|| form.val() == '<p><br></p>') 
	{
	    alert('필수사항을 입력하세요.');
	    form.focus();
	    return false;
	}
	return true;
}

function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

    try {
        elClickedObj.form.submit();
    } catch(e) {}
}
