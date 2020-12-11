$(document).ready(function(){
	
	
	$('.eventContent').click(function(){
		$(this).toggleClass('selected')
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