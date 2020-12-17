<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>지도 유형 설정하기</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=el0h9yyc4x"></script>
</head>
<body>

<!-- @category Map -->

<style type="text/css">
    #wrap .buttons { position:absolute;top:0;left:0;z-index:1000;padding:5px; }
    #wrap .buttons .control-btn { margin:0 5px 5px 0; }
</style>
<div id="wrap" class="section">
    <h2>지도 유형 설정하기</h2>
    <p>지도의 유형을 설정하는 예제입니다. 이 예제는 jQuery 구문을 포함하고 있습니다.</p>
    <div id="map" style="width:100%;height:600px;">
        <div class="buttons">
            <input id="NORMAL" type="button" value="일반지도" class="control-btn control-on" />
            <input id="TERRAIN" type="button" value="지형도" class="control-btn" />
            <input id="SATELLITE" type="button" value="위성지도" class="control-btn" />
            <input id="HYBRID" type="button" value="겹쳐보기" class="control-btn" />
        </div>
    </div>
    <code id="snippet" class="snippet"></code>
</div>
<script id="code">
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 15
});

var btns = $(".buttons > input");
btns.on("click", function(e) {
    e.preventDefault();

    var mapTypeId = this.id;

    if (map.getMapTypeId() !== naver.maps.MapTypeId[mapTypeId]) {
        map.setMapTypeId(naver.maps.MapTypeId[mapTypeId]); // 지도 유형 변경하기

        btns.removeClass("control-on");
        $(this).addClass("control-on");
    }
});
</script>

</body>
</html>
