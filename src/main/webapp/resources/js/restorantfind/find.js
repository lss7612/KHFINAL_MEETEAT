$(document).ready(function(){

	let blogSearchStartNo = 1
	
	//시작하면 검색창에 커서놓기
	$('#form_query_location').focus();
	
	//엔터누르면 서밋
	$('#form_query_location').on('keydown',function(e){
		if(e.keyCode==13) $('#searchButton').click()
	})
	//엔터누르면 서밋
	$('#form_query_food').on('keydown',function(e){
		if(e.keyCode==13) $('#searchButton').click()
	})
	
	
	//검색버튼을 눌렀을 때
	$('#searchButton').click(function(){
		
		blogSearchStartNo = 1
		
		let query_location = $('input[name=query_location]').val()
		let query_food = $('input[name=query_food]').val()
		let sort = $('select[name=sort]').val()
		
		if(query_location=='' || query_location==null) {
			alert('지역을 입력하세요')
			return
		}
 		search(query_location, query_food, sort) 
	})
	
	
	//지도아이콘을 눌렀을 때
	$('.restorantInfoBox .map a').click(function(){
		
		blogSearchStartNo = 1
		
		console.log('이거 출력')
		
		openMapResultBox()
		
		console.log('clicked')
		
		let mapX = $(this).attr('mapx')
		let mapY = $(this).attr('mapy')
		
		$('.restorantInfoBox').css('background','');
		$(this).parent().parent().css('background','#ccc');
		
		console.log(mapX)
		console.log(mapY)
		getRestorantLocation(mapX,mapY)
	})
	
	//블로그검색결과 출력할 때
	$('#resultList>div>.title>a').click(function(){
		
		blogSearchStartNo = 1
		
		let location = $(this).attr('location')
		let restorantName = $(this).text()
		
		$('.restorantInfoBox').css('background','');
		$(this).parent().parent().css('background','#ccc');
		
		$('#seeMoreBlogResult').attr('location', location)
		$('#seeMoreBlogResult').attr('restorantName', restorantName)
		
		openBlogResultBox()
		getBlogSearchList(location, restorantName, blogSearchStartNo)
	})
	
	//블로그 더보기 눌렀을 때
	$('#seeMoreBlogResult').click(function(){
		blogSearchStartNo ++
		console.log(blogSearchStartNo)
		
		let location = $(this).attr('location')
		let restorantName = $(this).attr('restorantName')
		getBlogSearchList(location, restorantName, blogSearchStartNo)
	})
	
})

function search(Query_location,Query_food, Sort){
	
	$('#blogResult').html('')
	$.ajax({
		type: "POST"
		, url: "/restorantfind/find"
		, data: { query_location : Query_location, query_food : Query_food , sort : Sort }
		, dataType:"json" //응답받은 데이터의 형식
		, success: function( res ){
			//맛집리스트를 만들어주는 함수 호출
			if(res.total==0){
				alert('검색결과가 없습니다.')
			}
			
			if(res.total!=0){
				listup(res)
				$('#beforeSearch').addClass('invisible')
				$('#beforeSearch').addClass('none_height')
				$('.restorantInfoBox').css('background','');
				$('#resultList > div:nth-child(1)').css('background','#ccc');
//				$('#resultList > div:nth-child(1) > .map > a').click();
			}
		}
		, error: function(){
			console.log('실패')
		}
	}) 
	return;
	
}

function listup(res){
	
	for(let i=0; i<res.total; i++){
		
		let id = 'restorant'+(i+1)
		
		$('#'+id+' h3 a').html(res.items[i].title)
		$('#'+id+' h3 a').attr('location',$('#form_query_location').val())
		
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
	$('#resultList > div:nth-child(1) > .map > a').click();
	
}

function getRestorantLocation(mapX,mapY){
	
	$.ajax({
		type: "POST"
		, url: "/restorantfind/map_ajax_view"
		, data: { mapx : mapX, mapy : mapY}
		, dataType:"html" //응답받은 데이터의 형식
		, success: function( res ){
			$('#mapResult').html(res)
		}
		, error: function(){
			console.log('실패')
		}
	}) 
	
}

function openMapResultBox(){
	$('#blogResultList').html('')
	$('#seeMoreBlogResult').addClass('invisible none_height')
	$('#blogResult').addClass('invisible none_height')
	$('#mapResult').removeClass('invisible none_height')
}

function openBlogResultBox(){
	$('#mapResult').html('<h2>블로그 검색 결과</h3>')
	$('#blogResult').removeClass('invisible none_height')
	$('#seeMoreBlogResult').removeClass('invisible none_height')
	$('#blogResult').html(
			'<div id="blogResultList"></div>'
	)
	$('#blogResultList').html('')
}

function getBlogSearchList(Location, RestorantName, blogSearchStartNo){
	$.ajax({
		type: "GET"
		, url: "/restorantfind/blogSearch_ajax_view"
		, data: { location : Location, retorantName : RestorantName, start : blogSearchStartNo}
		, dataType:"json" //응답받은 데이터의 형식
		, success: function( res ){
			console.log(res)
			blogListUp(res)
		}
		, error: function(){
			console.log('실패')
		}
	}) 
}

function blogListUp(res){
	
	for(let i=0; i<res.display;i++){
		$('#blogResultList').append('<div class="blogDetail horizontal_light_padding" style="border-top:1px solid #ccc;">')
		$('#blogResultList').append('<h3 class="blogArticleTitle"><a target="_blank" href="'+res.items[i].link+'">'+res.items[i].title)+'</a></h3>'
		$('#blogResultList').append('<div class="light_padding">'+res.items[i].description+'</div>')
		$('#blogResultList').append('</div>')
	}
	
	
	
}
