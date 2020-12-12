$(document).ready(function(){

	//이부분 CSS로 바까줘야함
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



