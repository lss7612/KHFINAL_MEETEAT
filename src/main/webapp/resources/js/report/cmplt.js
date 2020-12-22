function popupClose(){
	console.log("클릭");
	window.open('','_self').close();

}

var closeTimer = setTimeout(function(){
	window.close();
}, 5000);


var count = 4;
var countdown = setInterval(function(){
	$("#countdown").html("<strong>"+count+"</strong>초 후에 창이 닫힙니다.");
	count--;
}, 1000);