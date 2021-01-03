let arr_numbers = [0,1,2,3,4,5,6,7,8,9]

$(document).ready(function(){
	
	//메인이미지 변경 페이지로 이동
	$('#goToImgChange').click(function(){
		location.href="/admin/main/imgchange"
	})
	
	
	//왼쪽 숫자 박스 움직이기
	for(let i =0; i<$('#userNumberBox1').attr('boxCnt');i++){
		
		let id = '#userNumberBox'
		setTimeout(() => {
			removeOpacity($(id+i))
			moveNumberBox($(id+i))
		}, 200);
		
		//changeNumbers(originObject,finalNo,startNo,endNo,time, endTime)
		changeNumbers($(id+i),$(id+i).text(),i,9,0,i/2)
	}
	
	
	//오른쪽 숫자박스 움직이기
	setTimeout(() => {
		
		for(let i =0; i<$('#appointmentNumberBox0').attr('boxCnt');i++){
			
			let id = '#appointmentNumberBox'
				setTimeout(() => {
					removeOpacity($(id+i))
					moveNumberBox($(id+i))
				}, 200);
			
			//changeNumbers(originObject,finalNo,startNo,endNo,time, endTime)
			changeNumbers($(id+i),$(id+i).text(),i,9,0,i/2)
		}
		
	}, 1500);
	
	
	
	
})

function removeOpacity(originObject){
	originObject.animate({
		opacity:'100%'
	})
}

function moveNumberBox(originObject){
	originObject.animate({
		margin:'0'
	})
}

//originObject 숫자 바꿀 JQuery돔객체를 보내준다
//finalNo 결과값 숫자를 입력한다
//startNo 숫자가 바뀔때 몇을 초기 값으 설정할지 입력한다
//endNo 숫자가 바뀔 때 몇을 마지막값으로 설정할지 입력한다 (1~9로 바뀌게 하려면 startNo 1 endNo 9)
//endTime 몇초가 되었을때 끝낼지 설정한다.
//time 0이 아닌 값을 입력하면 해당 값부터 시간을 카운트한다.
function changeNumbers(originObject,finalNo,startNo,endNo,time, endTime){
	
	let originStartNo = startNo
	
	if(startNo>endNo) startNo=0;
	originObject.text(startNo)
	
	time += 0.05
	if(time>=endTime+1){
		originObject.text(finalNo)
		return;
	} 
	
	
	
	
	setTimeout(() => {
		startNo += 1
		changeNumbers(originObject,finalNo,startNo,endNo,time, endTime)
	},50);
	
}