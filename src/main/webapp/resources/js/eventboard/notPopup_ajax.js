$(document).ready(function(){

	
	$('.nonePopupContent').click(function(){
		$(this).toggleClass('willAdd')
		$(this).toggleClass('notSelected')
	})
	
	$('.eventContent').mouseenter(function(){
		
		
		$(this).css('font-size','0.8em')
		
		$(this).children('.eventDate').css('font-size','0.8em')
		$(this).children('.eventDate').css('height','10px')
	})
	
	$('.eventContent').mouseleave(function(){
	
		
		$(this).css('font-size','1em')
		
		$(this).children('.eventDate').css('font-size','0')
		$(this).children('.eventDate').css('height','0')
		
	})
	
	$('#popupSubmit').click(function(){
		
		let addArray = new Array();
		
		$('.eventContent.willAdd').each(function(i){
			addArray.push($(this).attr('article_no'))
		})
		
		popupSubmit(1, addArray)
	})
	
})


function popupSubmit(isPopup, List){
	
	if(List.length == 0){
		alert('먼저 이벤트를 선택해주세요')
		return
	}
	
	$.ajax({
		type: "get"
		, url: "/eventboard/manage/updatepopup"
		, data:{ is_popup : isPopup, list : List }
		, dataType:"json" 
		, success: function( res ){
			alert('반영되었습니다.')
			location.reload();
		}
		, error: function(){
			console.log('실패')
		}
	})
}
