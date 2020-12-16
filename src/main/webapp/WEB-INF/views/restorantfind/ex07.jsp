<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>전체 화면 지도와 미니 맵 표시하기</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=el0h9yyc4x"></script>
</head>
<body>

<!-- @category Map -->

<style type="text/css">
    html, body { height:100%; }
    #wrap2 { position:absolute;top:0px;left:0px;padding:20px;z-index:1001;width:100%;height:0;overflow:visible;color:#fff;pointer-events:none; }
    #back-link { margin-top:-10px;color:#333;font-weight:bold;color:#fff;pointer-events:auto; }
    #code-folder { margin-top:-10px;color:#333;font-weight:bold;color:#fff;pointer-events:auto; }
    #origin-marker { position:absolute;top:50%;left:50%;z-index:1000;background-color:#f00; width:10px;height:10px;border-radius:5px;pointer-events:none; }
    #snippet { width:700px;height:600px;overflow:hidden;overflow-y:auto;pointer-events:auto; }
    .buttons { position:absolute;top:0;left:100px;padding:5px; }
    .buttons .control-btn { pointer-events:auto; }
</style>

<div id="map" style="width:100%;height:100%;">
    <div id="wrap2">
        <h2>미니 맵 표시하기</h2>
        <a id="code-folder" href="#">코드 펼치기 ▽</a><br />
        <code id="snippet" class="snippet" style="display:none;">sdsdsd</code>
    </div>
</div>

<div id="minimap" style="border-left:solid 5px #333;border-top:solid 5px #333;width:300px;height:300px;"></div>

<script id="code">
// size 옵션이 생략되면 map DOM 요소의 HTML 렌더링 크기로 자동으로 조정됩니다.
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.5666805, 126.9784147),
    zoom: 13,
    minZoom: 6,
    mapTypeId: naver.maps.MapTypeId.HYBRID,
    zoomControl: true,
    zoomControlOptions: {
        position: naver.maps.Position.TOP_RIGHT
    },
    mapDataControl: false,
    logoControlOptions: {
        position: naver.maps.Position.LEFT_BOTTOM
    },
    disableKineticPan: false
});

var semaphore = false;

naver.maps.Event.once(map, 'init_stylemap', function() {
    map.setOptions({
        mapTypeControl: true,
        scaleControl: false,
        logoControl: false
    });

    // 미니 맵이 들어갈 HTML 요소를 controls 객체에 추가합니다. 가장 오른쪽 아래에 위치하도록 다른 옵션들을 잠시 끕니다.
    map.controls[naver.maps.Position.BOTTOM_RIGHT].push($("#minimap")[0]);
    map.setOptions({
        scaleControl: true,
        logoControl: true,
    });

    var minimap = new naver.maps.Map('minimap', { //미니 맵 지도를 생성합니다.
        bounds: map.getBounds(),
        scrollWheel: false,
        scaleControl: false,
        mapDataControl: false,
        logoControl: false
    });

    naver.maps.Event.addListener(map, 'bounds_changed', function(bounds) {
        if (semaphore) return;

        minimap.fitBounds(bounds);
    });
    naver.maps.Event.addListener(map, 'mapTypeId_changed', function(mapTypeId) {
        var toTypes = {
            "normal": "hybrid",
            "terrain": "satellite",
            "satellite": "terrain",
            "hybrid": "normal"
        };

        minimap.setMapTypeId(toTypes[mapTypeId]);
    });
    naver.maps.Event.addListener(minimap, 'drag', function() {
        semaphore = true;
        map.panTo(minimap.getCenter());
        naver.maps.Event.once(map, 'idle', function() {
            semaphore = false;
        });

    });
});
</script>

<script>
var wrap2 = $("#wrap2"),
    snippet = $("#snippet"),
    folder = $("#code-folder");

folder.on("click", function(e) {
    e.preventDefault();

    if (snippet.is(":visible")) {
        snippet.slideUp();
        folder.text("코드 펼치기 ▽");
    } else {
        snippet.slideDown();
        folder.text("코드 접기 △");
    }
});

naver.maps.Event.addListener(map, "mapTypeId_changed", function(mapTypeId) {
    var els = wrap2.add(folder);
    if (mapTypeId === naver.maps.MapTypeId.SATELLITE || mapTypeId === naver.maps.MapTypeId.HYBRID) {
        els.css("color", "#fff");
    } else {
        els.css("color", "#000");
    }
});
</script>

</body>
</html>




