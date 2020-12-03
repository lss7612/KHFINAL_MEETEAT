$(document).ready(function(){
	
	/*검색한 카테고리에 따라 선택되어있는 카테고리를 바꿔준다*/
	changeChecked()
	
	/*카테고리선택하는버튼을 클릭하면 카테고리div를 펼쳐준다*/
	$('#categorySelectBtn').click(function(){
		
		toggleVisible($('#categories'))
		
	})
	
	/*검색의 카테고리를 바꾸면 선택된 부분의 이름을 바꿔준다.*/
	$('#radio_article_title').click(function(){
		changeCategoryName($(this).attr('changeText'));
	})
	$('#radio_article_content').click(function(){
		changeCategoryName($(this).attr('changeText'));
	})
	$('#radio_user_nick').click(function(){
		changeCategoryName($(this).attr('changeText'));
	})
	
	/*검색버튼클릭*/
	$('#searchFormSubmit').click(function(){
		console.log('clicked')
		if (validationAll()){ 
			toggleVisible($('#loading'))
			$('form').submit();
		}
		
	})
	
})

function changeChecked(){
	
	
	if (($('#categorySelectBtn').html())=='제목▼'){
		$('#radio_article_title').attr('checked','checked')
	}
	if (($('#categorySelectBtn').html())=='내용▼'){
		$('#radio_article_content').attr('checked','checked')
	}
	if (($('#categorySelectBtn').html())=='닉네임▼'){
		$('#radio_user_nick').attr('checked','checked')
	}
	
}


function toggleVisible(tag){
	if(tag.hasClass('invisible') && tag.hasClass('none-height')){
		tag.removeClass('invisible')
		tag.removeClass('none-height')
	} else {
		tag.addClass('invisible')
		tag.addClass('none-height')
	}
}

function changeCategoryName(changeText){
	
	$('#categorySelectBtn').html(changeText)
	
}

//**********[모든 폼 빈칸 검사]**********//
function validationAll() {
  //console.log('validating');
  
  //검색어
  if(!validationEach($('#searchKeyword'))) return false;
  
  return true;
}
//**********[ 각각 폼 빈칸 검사 ]**********//
function validationEach(form){
	if (form.val() == ''
			|| form.val() == '&nbsp'
			|| form.val() == null 
			|| form.val() == undefined) 
	{
	    alert(form.attr('alertComment')+'를 입력하세요.');
	    form.focus();
	    return false;
	}
	return true;
}