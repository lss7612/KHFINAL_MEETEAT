$(document).ready(function(){

	getPreview()
	
	$('#form_previewImg').change(function(){
		saveTempPreviewImg();
	})
	
	
	$('#changeMain').click(function(){
		if(confirm('정말 적용하실거에요?')){
			location.href="/admin/main/realimgchange"
		}
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
			$('#preview').html(
					'<div style="text-align:center; width:300px; margin:0 auto;" class="bold_padding">'+
					'<img src="/resources/img/loading.gif">'+
					'</div>'
			)
			if(res.isTempUploaded){	
				setTimeout(() => {
					window.location.reload()
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
			$('#previewCover').css('width',$('#preview').css('width'))
		}
		, error: function(){
			console.log('실패')
		}
	})
	
	
}
