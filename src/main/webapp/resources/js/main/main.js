$(document).ready(function(){
	
	let viewHeight = window.innerHeight;
	console.log(viewHeight)
	
	$('.mainBtn').mouseenter(function(){
		let originObject = $(this)
		
		$(this).animate({
			width:'500px'
		},100)
				
	})
	
	$('.mainBtn').mouseleave(function(){
		$(this).animate({
			width:'400px'
		},100)
	})
	
	$('#goToSignUp').click(function(){
		let originObject = $(this)
		mainAnimate(originObject, '가입하고 먹으러가요','/login/signup')
	})
	
	$('#goToSignIn').click(function(){
		let originObject = $(this)
		mainAnimate(originObject, '로그인하고 먹으러가요','/login/login')
	})
	
	$('.border_circle').click(function(){
		$(this).removeClass('veiled')
		if($('.veiled').length==0){
			mergePhoto()
		}
	})
	
	
})

function mainAnimate(originObject, msg, url){
		
		originObject.animate({
			width:'100%'
		})
	
		$('html').animate({scrollTop:'0'})
		
		setTimeout(() => {
			
			$('#mainTextBox').css('background', '#f5da81')
			
			$('#mainTextBox').animate({
				fontSize:'0'
				,height:'1000px'
			},500)
			
			originObject.siblings().animate({
				opacity:'0'
			},500)
			
			originObject.animate({
				fontSize:'40px'
				,height: '500px'
			})
			originObject.html('환영합니다!<br>'+msg+'<br>'
					+ '<img style="width:300px;" src="/resources/img/logo.png">'
			)
			
			
			setTimeout(() => {
				location.href=url
			}, 1500);
			
		}, 500);
		
		
	}

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
	
