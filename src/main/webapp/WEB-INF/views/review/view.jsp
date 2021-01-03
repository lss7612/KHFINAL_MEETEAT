<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
/* 회원 아이디 클릭시 나타나는 목록 CSS */
.userMenu{
	display : inline-block;
	width : 100%;
	position : relative;
}

.userNickMenu{
	cursor : pointer;
}

.userHiddenMenu{ 
	list-style:none;
   	display:none;
	position : absolute; 
	z-index : 1;
} 

.userHiddenMenu > li{
	background-color : #F5DA81;
	position : relative;
	cursor : pointer;
	border : solid 0px;
	padding: 5px 10px 5px 10px;
}

.userHiddenMenu > li:hover{
	background-color : #eee;
}
/* 회원 아이디 클릭시 나타나는 목록 CSS 끝*/
</style>

<script type="text/javascript">
//작성자 정보 누르면 채팅메뉴 나타나게 동작하는 스크립트
$(document).ready(function(){
	//userMenu mouseleave event
	$(".userMenu").mouseleave(function(){
		if($(".userHiddenMenu").is(":visible")){
			console.log("hidden menu close")
			$(".userHiddenMenu").slideUp();
		}
	})
	
	$(".userMenu>span").click(function(){
		
		var submenu = $(this).next().next("ul");
		if(submenu.is(":visible")){
			submenu.slideUp();
		} else{
			$(".userMenu > ul").slideUp();
			submenu.slideDown();
			//슬라이드 메뉴 조정할려면 left의 style값을 변경하면 됩니다.
			$(submenu).css({"display" : "inline-block", "left" : "20px"});
		}
	})
	
})
//작성자 정보 누르면 채팅메뉴 나타나게 동작하는 스크립트 끝

//채팅하기 클릭시 동작하는 스크립트
function createChat(e){
	var user_no = $(e).attr("user_no")
	var loginUserNo = $(e).attr("loginUserNo")
	if(loginUserNo == user_no){
		alert("자기 자신과는 대화할 수 없습니다!")
		return false;
	} else {
		window.open("http://localhost:8088/chat/create?user_no="+user_no, "chatCreate"
				, "width = 710px, height = 665px");
	}
}
//채팅하기 클릭시 동작하는 스크립트 끝
</script>

<script type="text/javascript">
//게시글 신고하기버튼 클릭시 동작할 함수
function reportPopup(){
	var frmPop = document.frmPopup;

	//팝업 
	window.open("http://localhost:8088/report/doReport","report"
			, "width=502px,height=506px")
	frmPop.action = "http://localhost:8088/report/doReport";
	frmPop.target = "report";
	//${user_no}에 작성자 번호에 맞는 변수명을 적어주시면 됩니당.
	frmPop.user_no.value = ${view.user_no};
	//현재글 URL정보 전달
	frmPop.url.value = window.location.href
}
// 신고하기 동작 함수 끝

// 댓글 신고하기 버튼 클릭시 동작할 함수
function reportBtn(e){
	
	var target = $(e).prev().prev().val();

	//팝업 
	var frmPop = e.parentElement;
	window.open("http://localhost:8088/report/doReport","report"
			, "width=502px,height=506px")
	frmPop.action = "http://localhost:8088/report/doReport";
	frmPop.target = "report";
	frmPop.user_no.value = target; 
	//현재글 URL정보 전달
	frmPop.url.value = window.location.href;
}
//댓글 신고하기 버튼 클릭시 동작할 함수 종료
</script>

<style type="text/css">
/* 댓글 신고 CSS 시작*/
.commentReport{
	cursor : pointer;
}

.commentReportBtn{
	background-color: #f5da81;
	border: 0px;
	font-size : large;
}
/* 댓글 신고 CSS종료*/

<style type="text/css">
/* td.info { */
/* 	width: 10%; */
/* } */
/* td:not(.info) { */
/* 	width: 20%; */
/* } */

.info {
	width: 100px;
	text-align: center;
}

.cjaqn{
	border: none;
}

.table-condensed>tbody>tr>td, .table-condensed>tbody>tr>th, .table-condensed>tfoot>tr>td, .table-condensed>tfoot>tr>th, .table-condensed>thead>tr>td, .table-condensed>thead>tr>th{
	text-align: center;
}

.table>tbody>tr.info>td, .table>tbody>tr.info>th, .table>tbody>tr>td.info, .table>tbody>tr>th.info, .table>tfoot>tr.info>td, .table>tfoot>tr.info>th, .table>tfoot>tr>td.info, .table>tfoot>tr>th.info, .table>thead>tr.info>td, .table>thead>tr.info>th, .table>thead>tr>td.info, .table>thead>tr>th.info{
	background-color: #F5ECCE;
    width: 200px;
    text-align: center;
}	

</style>

<script type="text/javascript">
$(document).ready(function() {
	
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		
		$form = $("<form>").attr({
			action: "/review/comment/insert",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"article_no",
				value:"${view.article_no }"
			})
		).append(
			$("<textarea>")
				.attr("name", "comment_content")
				.css("display", "none")
				.text($("#comment_content").val())
		);
		$(document.body).append($form);
		$form.submit();
		
	});	
	
})

function deleteComment(e) {
		console.log(e)
		var comment_no = $(e).attr("comment_no")
		console.log(comment_no)
		var res = confirm("지우시겠습니까?")
		if(res){
			$.ajax({
				type: "post"
				, url: "/review/comment/delete"
				, async: false
				, dataType: "json"
				, data: {comment_no: comment_no }
				, success: function(data){
					if(data.success) {
						console.log("서ㅏㅇㅇ공")
						$("[data-comment_no='"+comment_no+"']").remove();
						location.reload(true);
						
					} else {
						alert("댓글 삭제 실패");
					}
				}
				, error: function() { 
					console.log("error");
				}
			});
		} else {
			return false;
		}
		
}
</script>

<div class="container" id="divpage">

<h3 class="pull-left">파티 후기</h3>
<div class="clearfix"></div>
<hr>

<table class="table table-bordered">
<!-- <tr> -->
<%-- <td class="info">글번호</td><td colspan="3">${view.article_no }</td> --%>
<!-- </tr> -->

<tr>
<%-- <td class="info">아이디</td><td>${view.writerId }</td> --%>
<td class="info">닉네임</td>
<td>
<div class="userMenu">
	<span class="userNickMenu">${view.user_nick }
</span>
	<br>
	<ul class="userHiddenMenu" >
		<!-- model에서 작성자의 회원번호값을 갖고오는 객체를 user_no의 property값에 입력해준다. -->
		<li onclick="createChat(this);" loginUserNo="${user_no }"  user_no="${view.user_no }">채팅하기</li>
	</ul>
</div>
</td>
</tr>

<tr>
<td class="info">조회수</td><td>${view.article_hit }</td>
</tr>
<tr>
<td class="info">작성일</td><td><fmt:formatDate value="${view.create_date }" pattern="yy-MM-dd HH:mm" /></td>
</tr>

<tr>
<td class="info">제목</td><td colspan="3">${view.article_title }</td>
</tr>

<tr>
<td colspan="4">${view.article_content }</td>
</tr>
<c:forEach items="${list }" var="ReviewImg">
<tr>
	<c:if test="${view.article_no eq ReviewImg.article_no }">
	<td class="cjaqn">
	<a href="/review/download?file_no=${ReviewImg.file_no}">${ReviewImg.file_originname }</a>
<%-- 	<a href="/resources/upload/${ReviewImg.file_storedname}">${ReviewImg.file_originname }</a> --%>
	</td>
	</c:if>
</tr>
</c:forEach>

</table>

<div class="text-center" style="padding-bottom: 40px;">
	<a href="/review/list"><button class="btn btn-default">목록</button></a>
	<c:if test="${user_no eq view.user_no }">
		<a href="/review/update?article_no=${view.article_no }"><button class="btn btn-primary">수정</button></a>
		<a href="/review/delete?article_no=${view.article_no }" onclick="return confirm('삭제하시겠습니까?')">
			<button class="btn btn-danger">삭제</button></a>
	</c:if>
	<form name="frmPopup" method="POST" style="display: inline-block;">
		<input type="hidden" name= "user_no">
		<input type="hidden" name= "url" />
	<button onclick="reportPopup();" class="btn btn-danger" >신고</button>
</form>
</div>



<!-- 댓글  -->
<div style="margin-top : 30px;">
<table class="table table-condensed">
<thead>
<tr>
	<th style="width: 10%;">작성자</th>
	<th style="width: 50%;">댓글</th>
	<th style="width: 20%;">작성일</th>
	<th style="width: 5%;"></th>
</tr>
</thead>
<tbody id="commentBody">

<c:forEach items="${commentList }" var="comment">
	<td style="width: 10%;">${comment.user_nick }</td>
	<td style="width: 50%; text-align: left; padding-left: 20px;">${comment.comment_content }</td>
	<td style="width: 20%;"><fmt:formatDate value="${comment.create_date }" pattern="yy-MM-dd HH:mm" /></td>
	<td style="width: 5%;">
<%-- 		<c:if test="${user_no eq comment.user_no }"> --%>
<%-- 			<a href="/review/comment/delete?comment_no=${comment.comment_no }" onclick="return confirm('삭제하시겠습니까?')"> --%>
<!-- 			<button class="btn btn-default btn-xs">삭제</button></a> -->
<%-- 		</c:if> --%>
			<c:if test="${user_no eq comment.user_no }">
				<button comment_no = "${comment.comment_no }" class="btn btn-default btn-xs deleteComment"
					onclick="deleteComment(this);">삭제</button>
			</c:if>
	</td>
	<td style="width: 3%;">
		<div class="commentReport" style="display : inline-block;" >
		<form method="POST">
			<input type="hidden" name="user_no" value="${comment.user_no }"/>
			<input type="hidden" name="url" />
			<button class="commentReportBtn" onclick="reportBtn(this)">🚨</button>
		</form>
		</div>
	</td>
</tr>
</c:forEach> 
</tbody>
</table>
<br>

<c:if test="${not isLogin }">
	<strong>로그인이 필요합니다</strong><br>
</c:if>

<c:if test="${isLogin }">
<div class="form-inline text-center">
	<textarea rows="2" cols="60" class="form-control" id="comment_content" style="width: 800px;"></textarea>
	<button id="btnCommInsert" class="btn">입력</button>
</div>
<br>
</c:if>	
</div>

<br>

</div>	

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
