<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>지도 영역 제한하기</title>
  <script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=el0h9yyc4x"></script>
</head>
<body>

<!-- @category Map -->

<div id="wrap" class="section">
    <h2>minZoom, maxBounds 설정하기</h2>
    <p>minZoom과 maxBounds를 이용하여 지도 영역을 독도로 설정하는 예제입니다. 이 예제는 jQuery 구문을 포함하고 있습니다.</p>
    <div id="map" style="width:100%;height:600px;">
        <div id="_panel" style="display: inline-block; position: relative; z-index: 1;margin: 20px 0 0 20px;font-size: 12px;">
            <div style="display: inline-block;border: 1px solid #b4b4b4;border-radius: 4px;padding: 10px;overflow: hidden;margin-top: 10px;max-height: 300px;background: #fff;">
                <div id="logger" ></div>
            </div>
        </div>
    </div>
    <code id="snippet" class="snippet"></code>
</div>
<script id="code">

var dokdo = new naver.maps.LatLngBounds(
    new naver.maps.LatLng(37.2380651, 131.8562652),
    new naver.maps.LatLng(37.2444436, 131.8786475));

var map = new naver.maps.Map("map", {
    minZoom: 14, // 읍면동 레벨
    maxBounds: dokdo,
});

var sw = new naver.maps.Marker({
    map: map,
    position: dokdo.getSW()
});

var ne = new naver.maps.Marker({
    map: map,
    position: dokdo.getNE()
});

var rect = new naver.maps.Rectangle({
    strokeOpacity: 0,
    strokeWeight: 0,
    fillOpacity: 0.2,
    fillColor: "#f00",
    bounds: dokdo,
    map: map
});

var logger = $('#logger');

naver.maps.Event.addListener(map, 'zoom_changed', function() {
    logZoom(map.getZoom());
});

logZoom(map.getZoom());

function logZoom(zoom) {
    logger.html('zoom:' + zoom);
}

</script>

</body>
</html>



