$(document).ready(function(){

	$('#form_query').focus();
	
	$('#form_query').on('keydown',function(e){
		if(e.keyCode==13) $('#searchButton').click()
	})
	
	$('#searchButton').click(function(){
		
		let query = $('input[name=query]').val()
		let sort = $('select[name=sort]').val()
 		search(query, sort) 
	})
	
	$('.restorantInfoBox .map a').click(function(){
		
		console.log('clicked')
		
		let mapX = $(this).attr('mapx')
		let mapY = $(this).attr('mapy')
		
		$('.restorantInfoBox').css('background','');
		$(this).parent().parent().css('background','#ccc');
		
		console.log(mapX)
		console.log(mapY)
		getRestorantLocation(mapX,mapY)
	})
	
	
	
})

function search(Query, Sort){
	
	if(Query!=''){
		$.ajax({
			type: "POST"
			, url: "/restorantfind/find"
			, data: { query : Query, sort : Sort }
			, dataType:"json" //응답받은 데이터의 형식
			, success: function( res ){
				listup(res)
				$('#beforeSearch').addClass('invisible')
				$('#beforeSearch').addClass('none_height')
				$('.restorantInfoBox').css('background','');
				$('#resultList > div:nth-child(1)').css('background','#ccc');
				$('#resultList > div:nth-child(1) > .map > a').click();
			}
			, error: function(){
				console.log('실패')
			}
		}) 
		return;
	} 

	alert('검색어를 입력하세요');
	
	
}

function listup(res){
	
	for(let i=0; i<res.total; i++){
		
		let id = 'restorant'+(i+1)
		
		$('#'+id+' h3').html(res.items[i].title)
		$('#'+id+' .category').text(res.items[i].category)
		$('#'+id+' .address').text(res.items[i].roadAddress)
		
		if(res.items[i].mapx!=''&&res.items[i].mapy!=''){
			$('#'+id+' .map a').html('<i style="font-size:20px;" class="fas fa-map-marked-alt"></i>')
			$('#'+id+' .map a').attr('mapx',res.items[i].mapx)
			$('#'+id+' .map a').attr('mapy',res.items[i].mapy)
		}
		
		
		if(res.items[i].link!='') {
			$('#'+id+' .homepage a').html('<i style="font-size:20px;" class="fas fa-home"></i>')
			$('#'+id+' .homepage a').attr('href',res.items[i].link)
			$('#'+id+' .homepage a').attr('target','blank')
		}
		
	}
	
}

function getRestorantLocation(mapX,mapY){
	
	$.ajax({
		type: "POST"
		, url: "/restorantfind/map_ajax_view"
		, data: { mapx : mapX, mapy : mapY}
		, dataType:"html" //응답받은 데이터의 형식
		, success: function( res ){
			$('#resultDetail').html(res)
		}
		, error: function(){
			console.log('실패')
		}
	}) 
	
}
