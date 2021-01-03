$(document).ready(function(){

	getPreview()
	
	$('#refrashPreview').click(function(){
		getPreview()
	})
	
	$('#form_previewImg').change(function(){
		saveTempPreviewImg();
	})
	
	
	$('#changeMain').click(function(){
		if(confirm('정말 적용하실거에요?')){
			isTempFileExist()
		}
	})
	
})

function isTempFileExist(){
	
	$.ajax({
		type: "GET"
		, url: '/main/isTempFileExist'
		, dataType:"json" //응답받은 데이터의 형식
		, contentType: false
		, processData: false
		, success: function( res ){
			if(res.isTempFileExist){
				location.href="/admin/main/realimgchange"
				openLoadingModal()
			}
			if(!res.isTempFileExist)
				alert('먼저 미리보기 이미지를 등록하세요')
		}
		, error: function(){
			console.log('실패')
		}
	})
	
}

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
					window.location.reload(true)
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


function openLoadingModal() {
	$('.modal_img_upload').toggleClass('invisible')
	setTimeout(() => {
		$('.modal_img_upload span').html('메인이미지는 등록까지 1~3분정도 소요될 수 있습니다')
	}, 3000);
	setTimeout(() => {
		$('.modal_img_upload span').html('등록 후 메인이미지가 적용되지 않는다면, 새로고침해주세요')
	}, 10000);
	setTimeout(() => {
		$('.modal_img_upload span').html('다음부턴 용량 작은것만 올리세요...')
	}, 17000);
	setTimeout(() => {
		$('.modal_img_upload span').html('일하고있어요.. 멈춘거 아닙니다.')
	}, 24000);
	setTimeout(() => {
		$('.modal_img_upload span').html('대단한 인내심이군요.. 30초째입니다.')
	}, 31000);
	setTimeout(() => {
		$('.modal_img_upload span').html('여러분의 시간 낭비를 도와드리고있습니다.')
	}, 38000);
	setTimeout(() => {
		$('.modal_img_upload span').html('시간은 금입니다. 그리고 당신은 지금 금을 버리고있죠')
	}, 45000);
	setTimeout(() => {
		$('.modal_img_upload span').html('아 죄송해요 기다리다 깜빡졸았습니다..')
	}, 52000);
	setTimeout(() => {
		$('.modal_img_upload span').html('담배는 몸에 해롭습니다. 그리고 기다리는건 몸에 더 해롭죠')
	}, 59000);
	setTimeout(() => {
		$('.modal_img_upload span').html('아니 도대체 얼마나 용량 큰걸 올리는거죠?')
	}, 66000);
	setTimeout(() => {
		$('.modal_img_upload span').html('앗 아직 안가셨네요?')
	}, 72000);
}

