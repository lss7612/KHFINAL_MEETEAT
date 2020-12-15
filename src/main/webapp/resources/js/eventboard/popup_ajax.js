$(document).ready(function(){
	
	const deleteList = new Array();
	
	$('.popupContent').click(function(){

		$(this).toggleClass('willDelete')
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
		console.log('clicked')
		
		let deleteArray = new Array();
		
		$('.eventContent.willDelete').each(function(i){
			deleteArray.push($(this).attr('article_no'))
		})
		
		console.log('deleteArray')
		console.log(deleteArray)
		popupSubmit(0, deleteArray)
	})
	
})

function popupSubmit(isPopup, List){
	
	console.log(isPopup)
	console.log(List)
	
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