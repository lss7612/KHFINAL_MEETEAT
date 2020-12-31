$(document).ready(function(){
	
	anyPopupList()
	
	console.log($(window).height());
	
	let windowHeight = $(window).height()
	
	$('#eventModalWrapper').css('padding-top', windowHeight/6)
	
	$('#modalExitButtonDiv i').click(function(){
		console.log('clicked')
		$('#eventModalWrapper').toggleClass('invisible')
		$('#eventModalWrapper').toggleClass('none_height')
	})
	
	$('#deleteTodayButton').click(function(){
		console.log('clicked')
		$('#eventModalWrapper').toggleClass('invisible')
		$('#eventModalWrapper').toggleClass('none_height')
		setCookie();
	})
	
})


function anyPopupList(){
	console.log('popup')
	$.ajax({
		type: "get"
		, url: "/eventboard/anypopuplist"
		, dataType:"json" //응답받은 데이터의 형식
		, success: function( res ){
			console.log(res)
			if(res!=0){
				$('#eventModalWrapper').toggleClass('invisible')
				$('#eventModalWrapper').toggleClass('none_height')
				getPopupEvent()
				
			} 
		}
		, error: function(){
			console.log('실패')
		}
	})
}

function getPopupEvent(){
	
	$.ajax({
		type: "get"
		, url: "/eventboard/mainpopuplist"
		, dataType:"html" //응답받은 데이터의 형식
		, success: function( res ){
			$('#centerDiv').html(res)
		}
		, error: function(){
			console.log('실패')
		}
	})
}

function setCookie(){
	document.cookie = "popup=n; path=/; max-age=180";
}