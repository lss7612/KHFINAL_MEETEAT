$(document).ready(function(){

	var resultDate = $('#resultDate').val()
	console.log(resultDate)
	var resultClock = $('#resultClock').val()
	console.log(resultClock)
	var resultMin = $('#resultMin').val()
	console.log(resultMin)
	var resultArea = $('#resultArea').val()
	console.log(resultArea)
	
	
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
	
	
	
})
