$(document).ready(function(){

	getPreview()
	$('#previewCover').css('height',$('#preview').css('height'))
	
	$('#form_previewImg').change(function(){
		saveTempPreviewImg();
	})
	
})

function saveTempPreviewImg(){
	
	let formData = new FormData($('#mainForm')[0])
	
	$.ajax({
		type: "POST"
		, enctype: 'multipart/form-data'
		, url: '/main/savepreviewimg'
		, data: formData
		, dataType:"json" //응답받은 데이터의 형식
		, contentType: false
		, processData: false
		, success: function( res ){
			console.log(res)
			res.isTempUploaded
			alert(res.isTempUploaded)
			alert(res.waitSecond)
			$('#preview').html(
					'<div style="text-align:center;" class="bold_padding">'+
					'<img src="/resources/img/loading.gif">'+
					'</div>'
			)
			if(res.isTempUploaded){	
				setTimeout(() => {
					getPreview(res.isTempUploaded)
				}, res.waitSecond);
			}
			
		}
		, error: function(){
			console.log('실패')
		}
	})
}

function getPreview(isTempUploaded){
	
	let sendData =false
	if(isTempUploaded)
		sendData =true

			
	$.ajax({
		type: "get"
		, url: "/main/memberpreview"
		, data: {isTempUploaded:sendData}
		, dataType:"html" //응답받은 데이터의 형식
		, success: function( res ){
			$('#preview').html(res)
			$('#previewCover').css('height',$('#preview').css('height'))
			$('#previewCover').css('width',$('#preview').css('width'))
		}
		, error: function(){
			console.log('실패')
		}
	})
	
	
}
