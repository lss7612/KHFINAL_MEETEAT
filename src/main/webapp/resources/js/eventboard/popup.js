$(document).ready(function(){
	
	getList(0);
	
	$('#addOrDelete').click(function(){
		console.log('clicked')
		let text = $('#addOrDelete').text()
		console.log(text)
		
		if(text=='팝업 등록하러 갈래요') {
			$('#addOrDelete').text('팝업 해제하러 갈래요')
			getList(0);
		}
		if(text=='팝업 해제하러 갈래요'){ 
			$('#addOrDelete').text('팝업 등록하러 갈래요')
			getList(1);
		}
		
	})
	
	$('#delete').click(function(){
		console.log('clicked')
	})
	
	const addList = new Array();
	
	$('.nonePopupContent').click(function(){
		console.log('clicked')
		$(this).toggleClass('willAdd')
		$(this).toggleClass('notSelected')
	})
	$('.popupContent').click(function(){
		console.log('clicked')
		$(this).toggleClass('willDelete')
		$(this).toggleClass('notSelected')
	})
	
	$('.eventContent').mouseenter(function(){
		
		console.log('enter')
		
		$(this).css('font-size','0.8em')
		
		$(this).children('.eventDate').css('font-size','0.8em')
		$(this).children('.eventDate').css('height','10px')
	})
	
	$('.eventContent').mouseleave(function(){
	
		console.log('leave')
		
		$(this).css('font-size','1em')
		
		$(this).children('.eventDate').css('font-size','0')
		$(this).children('.eventDate').css('height','0')
		
	})
		
	
})


function getList(isPopup){//isPopup==0 means notPopup, isPopup==1 means popup.
	$.ajax({
		type: "get"
		, url: "/eventboard/manage/popup_ajax"
		, data:{ is_popup : isPopup }
		, dataType:"html" //응답받은 데이터의 형식
		, success: function( res ){
			
				$('#List').html(
					'<div style="text-align:center;" class="bold_padding">'+
					'<img src="/resources/img/loading.gif">'+
					'</div>'
				)
			
			setTimeout(() => {
				$('#List').html(res)
			}, 1000);	
		}
		, error: function(){
			console.log('실패')
		}
	})
}





