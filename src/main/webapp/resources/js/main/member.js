let arr_numbers = [0,1,2,3,4,5,6,7,8,9]

$(document).ready(function(){
	
	
	for(let i =0; i<$('#userNumberBox1').attr('boxCnt');i++){
		
		let id = '#userNumberBox'
		setTimeout(() => {
			console.log(i)
			console.log($(id+i))
			removeOpacity($(id+i))
			moveNumberBox($(id+i))
		}, 200);
		
		changeNumbers($(id+i),$(id+i).text(),0,9,0,i/2)
	}
	
	setTimeout(() => {
		
		for(let i =0; i<$('#appointmentNumberBox0').attr('boxCnt');i++){
			
			let id = '#appointmentNumberBox'
				setTimeout(() => {
					console.log(i)
					console.log($(id+i))
					removeOpacity($(id+i))
					moveNumberBox($(id+i))
				}, 200);
			
			changeNumbers($(id+i),$(id+i).text(),0,9,0,i/2)
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