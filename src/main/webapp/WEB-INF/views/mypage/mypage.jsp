<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- SNS 공유용 주소 연결 용 --> 
<script type="text/javascript" async> 
	var url_default_ks = "https://story.kakao.com/share?url="; 
	var url_default_fb = "https://www.facebook.com/sharer/sharer.php?u="; 
	var url_default_tw_txt = "https://twitter.com/intent/tweet?text="; 
	var url_default_tw_url = "&url="; 
	var url_default_band = "http://band.us/plugin/share?body="; 
	var url_route_band = "&route="; 
	var url_default_naver = "http://share.naver.com/web/shareView.nhn?url="; 
	var title_default_naver = "&title="; 
	var url_this_page = location.href; 
	var title_this_page = document.title; 
	var url_combine_ks = url_default_ks + url_this_page; 
	var url_combine_fb = url_default_fb + url_this_page; 
	var url_combine_tw = url_default_tw_txt + document.title + url_default_tw_url + url_this_page; 
	var url_combine_band = url_default_band + encodeURI(url_this_page)+ '%0A' + encodeURI(title_this_page)+'%0A' + '&route=tistory.com'; 
	var url_combine_naver = url_default_naver + encodeURI(url_this_page) + title_default_naver + encodeURI(title_this_page); 
</script>

</head>
<body>
<!-- SNS버튼 시작 -->
<div style="width: 100%; text-align: center; margin-bottom: 64px;"> 
<!-- 페이스북 공유 버튼 --> 
	<a href="" onclick="window.open(url_combine_fb, '', 'scrollbars=no, width=600, height=600'); return false;">
	<img src="/resources/img/facebook_logo1.png" title="페이스북으로 공유하기" class="sharebtn_custom" style="width: 32px;"></a> 
<!-- 트위터 공유 버튼 --> 
	<a href="" onclick="window.open(url_combine_tw, '', 'scrollbars=no, width=600, height=600'); return false;">
	<img src="/resources/img/twitter_log.png" title="트위터로 공유하기" class="sharebtn_custom" style="width: 32px;"></a> 
<!-- 카카오 스토리 공유 버튼 --> 
	<a href="" onclick="window.open(url_combine_ks, '', 'scrollbars=no, width=600, height=600'); return false;">
	<img src="/resources/img/kakaostory_logo.png" title="카카오스토리로 공유하기" class="sharebtn_custom" style="width: 32px;"></a> 
<!-- 네이버 공유 버튼 --> 
	<a href="" onclick="window.open(url_combine_naver, '', 'scrollbars=no, width=600, height=600'); return false;">
	<img src="/resources/img/naver_logo.png" title="네이버로 공유하기" class="sharebtn_custom" style="width: 32px;"></a> 
<!-- 밴드 공유 버튼 --> 
	<a href="" onclick="window.open(url_combine_band, '', 'scrollbars=no, width=584, height=635'); return false;">
	<img src="/resources/img/naverband_logo.png" title="밴드로 공유하기" class="sharebtn_custom" style="width: 32px;"></a> 
<span id="shareAddrCopy" class="shareBtn" title="주소 복사"></span>



<div class="profile_pic">
	<img src="/resources/upload/${userinfo.USER_PROFILESTORED }" style="width: 150px; height:150px; border-radius:100px; display: block;" ><br>
	<button onclick="popup();" class="btn btn-info btn-sm pull-right">프로필 사진 변경</button>
</div>

<div class="box_manage">
<!-- 	<strong class="tit_manage">유저 정보</strong> -->
	<h2 class="tit_manage">회원 정보</h2>
	
	<div class="box_set">
		<strong class="tit_set">닉네임</strong>
		<span class="txt_set">${userinfo.USER_NICK }</span>
	</div>
	<div class="box_set">
		<strong class="tit_set">아이디</strong>
		<span class="txt_set">${userinfo.USER_ID }</span>
	</div>
	<div class="box_set">
		<strong class="tit_set">유저 등급</strong>
		<span class="txt_set">${userinfo.GRADE_NAME }</span>
	</div>
	<div class="box_set">
		<strong class="tit_set">이메일</strong>
		<span class="txt_set">${userinfo.USER_EMAIL }</span>
	</div><br>

	<div>
	<button onclick="location.href='/mypage/myedit'" class="btn btn-info btn-sm pull-right" id="btn1">내 정보 수정</button> 	
	</div>
	
</div><!-- 프로필 div 끝 -->
</div> <!-- SNS버튼 끝 -->
</body>
</html>