$(document).ready(function(){
	
	/*지역 선택 시 해당 지역으로 검색한다.*/
	$('#location table tr td span').click(function(){
		console.log('clicked')
		console.log($(this).text())
		$('#searchKeyword').val('')
		if($(this).text()!='전체') $('#searchLocation').val($(this).text())
		if($(this).text()=='전체') $('#searchLocation').val('')
		$('form').submit();
	})
	
	/*검색한 카테고리에 따라 선택되어있는 카테고리를 바꿔준다*/
	changeChecked()
	
	$('openCommentPopUp').click(function(){
		
		popUpComment()
		
	})
	
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
		search()
	})
	
	$('#searchKeyword').keydown(function(key){
		if(key.keyCode==13){
			search()
		}
	})
	
	
})

/*보이는 카테고리의 글씨와 체크되어있는 radio버튼을 일치시킨다.*/
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

/*검색카테고리 선택에 따라 보이는 카테고리 글씨를 바까줌*/
function changeCategoryName(changeText){
	
	$('#categorySelectBtn').html(changeText)
	
}


/*보이는애는 안보이게, 안보이는애는 보이게하는 펑션*/
function toggleVisible(tag){
	if(tag.hasClass('invisible') && tag.hasClass('none-height')){
		tag.removeClass('invisible')
		tag.removeClass('none-height')
	} else {
		tag.addClass('invisible')
		tag.addClass('none-height')
	}
}

/*search버튼을 눌렀을 때*/
function search(){
	console.log('clicked')
	if (searchValidationAll()){ /*search폼 밸리데이팅*/
		toggleVisible($('#loading')) /*로딩창띄우기*/
		$('form').submit();
	}
}

//**********[모든 폼 빈칸 검사]**********//
function searchValidationAll() {
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

/*키워드있는애 굵게하고 색깔주기
function findSearchKeyword(){
	
	var keyword =$('searchParam.searchKeyword').val()
	
	if(
		keyword==''
		||keyword=='&nbsp'
		||keyword==null
		||keyword==undefined){
		return
	}
	
	if(tag.hasClass('invisible') && tag.hasClass('none-height')){
		tag.removeClass('invisible')
		tag.removeClass('none-height')
	} else {
		tag.addClass('invisible')
		tag.addClass('none-height')
	}
}
*/




