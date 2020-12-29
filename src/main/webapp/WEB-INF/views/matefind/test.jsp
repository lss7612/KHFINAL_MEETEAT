<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">


<style type="text/css">
    .menu a{cursor:pointer;}
    .menu .hide{display:none;}
    
    li {
    	list-style: none;
    }
</style>

<script>
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script>



</head>
<body>

<div>
    <ul>
        <li class="menu">
            <a class="btn btn-secondary">필터</a>
            <ul class="hide">
                <li> 
								
					<div class="row">
						<div class="filter col">
						
						<div class="row">
							<div class="input-group mb-3 ">
							  <label class="input-group-text" for="party_location">지역</label>
							  <select class="form-select" id="party_location" name="party_location">
							    <option selected value="">전체</option>
							    <option value="서울특별시">서울특별시</option>
							    <option value="부산광역시">부산광역시</option>
							    <option value="대구광역시">대구광역시</option>
							    <option value="인천광역시">인천광역시</option>
							    <option value="광주광역시">광주광역시</option>
							    <option value="대전광역시">대전광역시</option>
							    <option value="울산광역시">울산광역시</option>
							    <option value="세종특별자치시">세종특별자치시</option>
							    <option value="경기도">경기도</option>
							    <option value="강원도">강원도</option>
							    <option value="충청북도">충청북도</option>
							    <option value="충청남도">충청남도</option>
							    <option value="전라북도">전라북도</option>
							    <option value="전라남도">전라남도</option>
							    <option value="경상북도">경상북도</option>
							    <option value="경상남도">경상남도</option>
							    <option value="제주특별자치도">제주특별자치도</option>
							  </select>
							</div>
						</div>
							  <span style="width: 50px;"></span>
						<div class="row">
							  <label class="input-group-text" for="meet_time">시간</label>
							  <select class="form-select" id="meet_time" name="meet_time">
							    <option value="">전체</option>
							    <option value="아침">아침</option>
							    <option value="점심">점심</option>
							    <option value="저녁">저녁</option>
							    <option value="새벽">새벽</option>
							  </select>
						</div>
						
							  <span style="width: 50px;"></span>
						
						<div class="row">
							  <label class="input-group-text" for="category">종류</label>
							  <select class="form-select" id="category" name="category">
							    <option value="">전체</option>
							    <option value="식사">식사</option>
							    <option value="술">술</option>
							    <option value="카페/디저트">카페/디저트</option>
							  </select>
						</div>
						
						</div><!-- //filter 끝 -->
					</div><!-- row 끝 -->
        </li>
    </ul>
</div>


<div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01">Options</label>
  </div>
  <select class="custom-select" id="inputGroupSelect01">
    <option selected>Choose...</option>
    <option value="1">One</option>
    <option value="2">Two</option>
    <option value="3">Three</option>
  </select>
</div>


</body>
</html>