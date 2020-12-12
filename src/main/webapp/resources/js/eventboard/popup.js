$(document).ready(function(){
	
	getList(1);
	getList(0);
	
	
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
			if(isPopup==0) $('#notPopupList').html(res)
			if(isPopup==1) $('#popupList').html(res)
			
		}
		, error: function(){
			console.log('실패')
		}
	})
}





