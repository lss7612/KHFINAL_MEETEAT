$(document).ready(function(){
	
	let viewHeight = window.innerHeight;
	console.log(viewHeight)
	
	$('.mainBtn').mouseenter(function(){
		let originObject = $(this)
		
		$(this).animate({
			width:'600px'
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
		
		$('#mainWrapper').on('scroll touchmove mousewheel', function(event) {
		  event.preventDefault();
		  event.stopPropagation();
		  return false;
		});
		
	})
	
	$('#goToSignIn').click(function(){
		let originObject = $(this)
		mainAnimate(originObject, '로그인하고 먹으러가요','/login/login')
		
		$('#mainWrapper').on('scroll touchmove mousewheel', function(event) {
			  event.preventDefault();
			  event.stopPropagation();
			  return false;
		});
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
				fontSize:'0.1em'
				,height:'1000px'
			},800)
			
			$('#goToSignUp').siblings().animate({
				opacity:'0'
			},800)
			
			$('#goToSignUp').animate({
				fontSize:'40px'
				,height: '500px'
			})
			$('#goToSignUp').html('환영합니다!<br>'+msg+'<br>'
					+ '<img style="width:300px;" src="/resources/img/logo.png">'
			)
			
			
			setTimeout(() => {
				location.href=url
			}, 2000);
			
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
	$('#clickImgText').html('모여서 즐겁게 먹어요<br>' +
			'<img style="width:450px;"src="/resources/img/main/party.jpg">'
			)
}
	
