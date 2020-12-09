$(document).ready(function(){

	var resultDate = $('#resultDate').val()
	console.log(resultDate)
	var resultClock = $('#resultClock').val()
	console.log(resultClock)
	var resultMin = $('#resultMin').val()
	console.log(resultMin)
	var resultArea = $('#resultArea').val()
	console.log(resultArea)
	var resultLocation = $('#resultLocation').val()
	
	
	$('.over-img').click(function(){
		if(confirm('사진을 수정하면 되돌릴 수 없습니다. \n수정하시겠습니까?')){
			$('.over-img').toggleClass("over-img")
			$('.upload-image').attr('src','/resources/img/upload-image.png')
		}
	})
	
	
	for(var i=0; i<=2; i++){
		if(resultArea == $('#form_time_area').children('option').eq(i).val()){
			$('#form_time_area').children('option').eq(i).attr('selected','selected')
		}
	}
	
	
	for(var i=0; i<=12; i++){
		if(resultClock == $('#form_time_time').children('option').eq(i).val()){
			$('#form_time_time').children('option').eq(i).attr('selected','selected')
		}
	}
	
	for(var i=0; i<=6; i++){
		if(resultMin == $('#form_time_minute').children('option').eq(i).val()){
			$('#form_time_minute').children('option').eq(i).attr('selected','selected')
		}
	}
	
	for(var i=0; i<=8; i++){
		if(resultLocation == $('#form_party_location').children('option').eq(i).val()){
			$('#form_party_location').children('option').eq(i).attr('selected','selected')
		}
	}
	
	
	
})
