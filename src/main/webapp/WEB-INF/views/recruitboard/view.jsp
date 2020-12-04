<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/forTest/header.jsp"/>
<link rel="stylesheet" href="/resources/css/recruitboard/view.css">
<script type="text/javascript" src="/resources/js/recruitboard/view.js"></script>

<div id="view_wrapper">
<h2 class=""><a href="/recruitboard/list">모집게시판</a></h2>
<hr>


<div id="view_title_bar" class="border">
	<!-- 제목부분 -->
	<div class="light_padding color_base bold_bar_height">
		<h4 style="font-weight:bold;" class="">${result.ARTICLE_TITLE }</h4>
	</div>
	
	
	<!-- 닉네임 조회수 덧글 시간 -->
	<div class="light_padding light_bar_height color-light">
		<div  class="pull-left title_left" >
			<span>${result.USER_NICK }</span>
		</div>
		<div class="pull-right title_right" style="text-align:right;" >
			<span>조회수: ${result.ARTICLE_HIT }</span><span>덧글: ${result.CNT_COMMENT }</span>
			<span>작성: <fmt:formatDate value="${result.CREATE_DATE }" pattern="yy/MM/dd hh:mm" /></span>
		</div>
	</div>

<!-- 내용영역 -->
	<div id="view_content_bar" class="light_margin bold_padding vertical_bold_margin"style="padding:5px;">
	${result.ARTICLE_CONTENT }
	</div>
</div>

<hr>
<!-- 코멘트영역 -->
<div id="view_comment" style="width:95%; margin:0 auto;">

<!-- 코멘트작성 -->
<c:if test="${isLogin }">
	<div class="border" style="width:100%; margin:0 auto;">
	<form action="" method="POST"></form>
	
		<!-- 안보이는 form태그부분 -->
		<div style="height:0;">
			<input type="text" class="invisible"  name="user_no" value="${user_no }" readonly="readonly"><br>
		</div>
		<div style="height:0;">
			<input type="text" class="invisible"  name="article_no" value="${result.ARTICLE_NO }" readonly="readonly"><br>
		</div>
		<div style="height:0;">
			<input type="text" class="invisible"  name="board_no" value="3" readonly="readonly"><br>
		</div>
		<!-- 안보이는 form태그부분 끝 -->
		
		
		<div class="light_padding color_base light_bar_height">
			댓글달기
		</div>
		<div style="width:100%; margin:0 auto" class="vertical_light_padding" >
			<textarea style="width: 60%"id="form_comment_content" ></textarea>
		</div>
	</div>
	<div class="light_bar_height" style="width:100%; margin:0 auto">
		<button type="button" id="commentSumitBtn" class="btn btn-primary pull-right">댓글쓰기</button>							
	</div>
</c:if>
<div>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "form_comment_content", //에디터가 적용될 <textarea>의 id
	sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
	fCreator: "createSEditor2"
})


oEditors.getById["ir1"].exec("RESIZE_EDITING_AREA_BY", [0, 100]); 

$('iframe').css('height','100px');

</script>


</div>

<!-- 댓글내용 -->
<div class="border vertical_base_margin" >
	<div class="light_padding color_base light_bar_height">
		<div class=".col-md-4 pull-left">
			<span>닉네임</span>
		</div>
		<div class=".col-md-4 pull-right" style="text-align:center;">
			<span class="horizontal_light_margin">2020-12-04 09:25:30</span>
		</div>
	</div>
	<div class='clearfix'></div>
	<div class="base_padding">
		댓글내용이 이렇습니다 ㅎㅎ;
	</div>
</div>
</div>


</div>

</body>
</html>