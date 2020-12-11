<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/forTest/header.jsp"/>
<link rel="stylesheet" href="/resources/css/common/common.css">
<link rel="stylesheet" href="/resources/css/eventboard/view.css">
<script type="text/javascript" src="/resources/js/eventboard/view.js"></script>

<div id="view_wrapper">

<h2 class=""><a href="/eventboard/holding">이벤트</a></h2>
<hr>

<div id="view_title_bar" class="border">
	<div style="height:0;">
		<input class="invisible" value="${result.ARTICLE_NO }" id="article_no"/>
		<input class="invisible" value="${paging.curPage }" id="curPage"/>
		<input class="invisible" value="${searchParam.searchLocation }" id="searchLocation"/>
		<input class="invisible" value="${searchParam.searchCategory}" id="searchCategory"/>
		<input class="invisible" value="${searchParam.searchKeyword}" id="searchKeyword"/>
	</div>
	<%-- 제목부분 --%>
	<div class="light_padding color_base bold_bar_height">
		<h4 class="" style="font-weight:bold;" class="">${result.ARTICLE_TITLE }</h4>
	</div>
	
	
	<%-- 닉네임 조회수 덧글 시간 --%>
	<div class="light_padding light_bar_height color-light">
		<div  class="pull-left title_left" >
			<span>${result.USER_NICK }</span>
		</div>
		<div class="pull-right title_right" style="text-align:right;" >
			<span>조회수: ${result.ARTICLE_HIT }</span><span>덧글: ${result.CNT_COMMENT }</span>
			<span>작성: <fmt:formatDate value="${result.CREATE_DATE }" pattern="yy/MM/dd hh:mm" /></span>
		</div>
	</div>


	<%-- 이미지영역 --%>
	<div id="imgList" style="width:510px; margin:0 auto;">
		<c:set var="imgPath" value="/resources/file/recruitboard/save/"></c:set>
		<c:forEach items="${result.IMGLIST }" var="imglist">
		<div id="imgBox1"class="light_margin imgBox none-image pull-left">
		<a href="${imgPath }${imglist.FILE_STOREDNAME }"><img class="upload-image" alt="" src="${imgPath }${imglist.FILE_STOREDNAME }"></a>
		</div>
		</c:forEach>
	</div>
	<div class="clearfix" style=""></div>
	
	
	<%-- 내용영역 --%>
	
	<div id="view_content_bar" class="light_margin bolder_padding vertical_bold_margin" style="padding:5px; text-align:left;">
	<h4 style="font-weight:bold">이벤트기간: ${result.START_DATE } ~ ${result.TERMINATE_DATE }</h4> 
	<br>	
	${result.ARTICLE_CONTENT }
	
	</div>
</div>

<%-- 삭제, 수정 버튼영역 --%>
<div class="base_bar_height light_padding light_margin pull-left" style="width:30%;">
	<c:set var="QueryString" value="/eventboard/holding?searchBoard_no=3&searchKeyword=${searchParam.searchKeyword }&searchCategory=${searchParam.searchCategory}&searchLocation=${searchParam.searchLocation }" /><%-- 미구현: CurPage 구현해야함 --%>
	<a href=${QueryString }><button type="button" id="back_to_list" class="btn btn-primary pull-left" >목록으로</button></a>
	
</div>
<div class="base_bar_height light_padding light_margin pull-right" style="width:30%;">
	<div class="invisible" style="height:0;">
	<form id="deleteOrModify" action="" method="">
		<input type="text" name="user_nick" value="${result.USER_NICK }" >
		<input type="text" name="board_no" value="6" >
		<input type="text" name="article_no" value="${result.ARTICLE_NO }" >
	</form>
	</div>
<c:if test="${user_grade eq 0 }">
	<button type="button" id="article_delete" class="btn btn-primary pull-right" style="float:center;">삭제</button>
	<button type="button" id="article_modify" class="btn btn-primary pull-right" style="float:center;">수정</button>
</c:if>

	
</div>
<div class="clearfix"></div>


<hr>
<%-- 코멘트영역 --%>
<div id="view_comment" style="width:95%; margin:0 auto;">



</div>
<div style="width:90%; margin:0 auto;">
<div class="col-md-4 pull-right"style="margin:5px 0 0 0; padding:10px 10px 0; font-size:20px;text-align:right;"><i id="refrash_comment_botton"  style="cursor: pointer;" class="fas fa-sync-alt"></i></div>
<div class="col-md-4 pull-left" style="margin:5px 0 0 0; padding:14px 10px 0; font-size:18px;text-align:left;">${result.CNT_COMMENT }개의 덧글</div>
<div class="clearfix"></div>
</div>

<%-- 댓글내용영역 --%>
<div id="commentList" style="width:90%; margin:0 auto;">
</div>

<%-- 코멘트작성 --%>
<c:if test="${isLogin }">
	<div class="border" style="width:90%; margin:0 auto;">
	<form action="/eventboard/comment/write" method="POST">
	
		<%-- 안보이는 form태그부분 --%>
		<div style="height:0;">
			<input type="text" class="invisible"  name="user_no" value="${user_no }" readonly="readonly"><br>
		</div>
		<div style="height:0;">
			<input type="text" class="invisible"  name="article_no" value="${result.ARTICLE_NO }" readonly="readonly"><br>
		</div>
		<div style="height:0;">
			<input type="text" class="invisible"  name="board_no" value="6" readonly="readonly"><br>
		</div>
		<%-- 안보이는 form태그부분 끝 --%>
		
		
		<div class="light_padding color_base light_bar_height">
			댓글달기
		</div>
		<div style="width:100%; margin:0 auto" class="vertical_light_padding" >
			<textarea style="width: 100%"id="form_comment_content" name="comment_content" alertComment="내용" ></textarea>
		</div>
	</form>
	<div class="base_bar_height light_padding" style="width:100%; margin:0 auto">
		<button type="button" id="commentSumitBtn" class="btn btn-primary pull-right" >댓글쓰기</button>							
	</div>
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


$('iframe').css('height','100px');



</script>

<hr>

<%-- 게시판영역 --%>
<%-- 미구현
<div id="viewList">
<div class="bold_margin base_padding bold_bar_height color_base" style="cursor:pointer;text-align:center; font-size:1.5em; font-weight:bold;width:100%; margin:0 auto;" class="base_padding">목록보기</div>
</div>
 --%>

</div>

</div>
</body>
</html>