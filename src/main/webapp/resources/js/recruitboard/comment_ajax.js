$(document).ready(function(){
	
	$('#commentList').mouseenter(function(){
		$('.comment_lump div div:nth-child(2) span.toggle_invisible').toggleClass('invisible')
		$('.comment_lump div div:nth-child(2) span.toggle_invisible').toggleClass('none_width')
	})
	$('#commentList').mouseleave(function(){
		$('.comment_lump div div:nth-child(2) span.toggle_invisible').toggleClass('invisible')
		$('.comment_lump div div:nth-child(2) span.toggle_invisible').toggleClass('none_width')
	})
	
	$('commentComment')
	
})