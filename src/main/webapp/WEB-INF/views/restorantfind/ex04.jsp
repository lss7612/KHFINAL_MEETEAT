<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>지도의 좌표 경계 확인하기</title>
   <script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=el0h9yyc4x"></script>
</head>
<body>

<!-- @category Map -->

<div id="wrap" class="section">
    <h2>지도의 좌표 경계 확인하기</h2>
    <p>지도의 bounds 객체를 이용하는 예제입니다. 이 예제는 jQuery 구문을 포함하고 있습니다.</p>
    <div id="map" style="width:100%;height:600px;">
        <input id="to-dokdo" type="button" value="독도로 이동하기" class="control-btn" style="position:absolute;top:10px;left:10px;z-index:1000;" />
    </div>
    <code id="snippet" class="snippet"></code>
</div>
<script id="code">
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.5666805, 126.9784147),
    zoom: 10,
    mapTypeId: naver.maps.MapTypeId.NORMAL
});

var rect = new naver.maps.Rectangle({
    strokeOpacity: 0,
    strokeWeight: 0,
    fillOpacity: 0.2,
    fillColor: "#f00",
    bounds: map.getBounds(), // 지도의 bounds와 동일한 크기의 사각형을 그립니다.
    map: map
});

naver.maps.Event.addListener(map, "bounds_changed", function(bounds) {
    window.setTimeout(function() {
        rect.setBounds(bounds);
    }, 500);
});

var dokdo = new naver.maps.LatLngBounds(
                        new naver.maps.LatLng(37.2380651, 131.8562652),
                        new naver.maps.LatLng(37.2444436, 131.8786475));

$("#to-dokdo").on("click", function(e) {
    e.preventDefault();

    map.fitBounds(dokdo); // 독도의 bounds에 맞춰 지도를 이동합니다.
});
</script>

</body>
</html>



