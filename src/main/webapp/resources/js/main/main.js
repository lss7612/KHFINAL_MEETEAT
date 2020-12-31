$(document).ready(function(){
	
	let viewHeight = window.innerHeight;
	console.log(viewHeight)
	
	$('#goToSignUp').mouseenter(function(){
		let originObject = $(this)
		
		$(this).animate({
			width:'100%'
		})
				
	})
	
	$('#goToSignUp').mouseleave(function(){
		$(this).animate({
			width:'400px'
		})
	})
	
	$('#goToSignUp').click(function(){
		
		$('html').animate({scrollTop:'0'})
		
		$('#mainTextBox').css('background', '#f5da81')
		
		$('#mainTextBox').animate({
			fontSize:'0'
			,height:'1000px'
			
		})
		
		$(this).animate({
			fontSize:'40px'
			,height: '500px'
		})
		$(this).html('환영합니다!<br>가입하고 먹으러가요<br>'
				+ '<img style="width:300px;" src="/resources/img/logo.png">'
		)
		
		
		setTimeout(() => {
			location.href="/login/signup"
		}, 1500);
		
	})
	
	$('.border_circle').click(function(){
		$(this).removeClass('veiled')
		if($('.veiled').length==0){
			mergePhoto()
		}
	})
	
	
})

function mergePhoto(){
	$('.border_circle').css('height','0')
	$('.border_circle').css('display','none')
	
	$('.TextBox2').css('padding','100px')
	
	$('#clickImgText').animate({
			fontSize:'40px'
			,height: '400px'
		})
	$('#clickImgText').html('대충 모여먹으면 좋다는 글<br>' +
			'<img style="width:500px;"src="/resources/img/main/party.jpg">'
			)
}
	
