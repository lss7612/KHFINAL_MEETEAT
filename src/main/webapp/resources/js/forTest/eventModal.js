$(document).ready(function(){
	
	console.log($(window).height());
	
	let windowHeight = $(window).height()
	
	$('#eventModalWrapper').css('padding-top', windowHeight/5)
	
	$('#modalExitButtonDiv i').click(function(){
		console.log('clicked')
		$('#eventModalWrapper').toggleClass('invisible')
		$('#eventModalWrapper').toggleClass('none_height')
	})
	
	
	
})