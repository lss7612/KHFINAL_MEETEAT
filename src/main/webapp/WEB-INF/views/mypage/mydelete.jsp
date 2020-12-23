<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script>

document.getElementById('submit').onclick = function() {
    var ID = document.getElementById('user_id').value;
    var pass = document.getElementById('user_pw').value;
    if (ID === "${user_no}" && pass === "${user_pw}") {
        alert("로그인 성공!");
    }
    else {
        alert("로그인 실패!");
    }
}

</script>
<style>
.clearfix() {
  &:before,
  &:after {
    content: " ";
    display: table;
  }
  &:after {
    clear: both;
  }
}

.change_info{
    overflow: inherit;
    position: relative;
    top: 210px;
/*     left: 440px;  */
    height: 100px;
/*      background-position: -250px -80px;  */

}

.user_id .user_nick {
 	text-align: pull-left; 
}


.tit_set {
	font-weight: bold; 
}

.txt_set{
 	float: right;  
 	color: #5066aa; 
 	margin-bottom : 10px;
}

.box_set{
 	display: flow-root; 
 	position: 10px 25px 10px 0; 
 	border-bottom: 1px solid #ebebeb; 
 	font-size: 12px; 
 	color: #252525;  
 	font-weight: normal; 
 	padding-inline-start: 2.75em;
	padding-inline-end: 2.75em;
	padding-block-start: 1.35em;
	min-inline-size: min-content;

}

.box_manage{
	margin-top: 48px;
	text-align: left;
	max-width: 530px;
	margin-left: 280px;
		
}

#alert-success, #alert-fail{
	display:none;
	
}

#container{
	position: relative;
	z-index: 20;
	max-width:954px;
	margin: 0 auto;
}
#content{
	position: relative;
	padding: 32px 51px 95px;
}
div{
	displayy: block;
}

.c_header{
	padding-bottom: 0px;
	color: #666;
	padding-left: 30px;
}

.c_header .contxt{
	line-height: 19px;
	padding-top: 10px;
	letter-spacing: -1px;
}

.contxt{
	padding-left: 10px;
	
}

p{
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	margin: 0;
	padding: 0;
}

strong{
	font-weight: bold;
}

form{
	display: block;
}

.fs{
	padding: 30px;
}

.tbl_model{
	position: relative;
	width: 100%;
	table-layout: fixed;
	border-spacing: 0;
	border-collapse: collapse;
	word-break: keep-all;
	border: 0;
	border-bottom: 1px solid #e5e5e5;
}

input, textarea, button{
	font-size: 12px
}

.border{
	border: 1px solid #F5DA81;s
}

</style>
<div id="divpage">
<div class="c_header">
	<h1>비밀 번호 확인</h1>
	<p class="contxt">
	<Strong style="font-size: 25px; color: #F5DA81;"> ${u.USER_ID  }</Strong>
		님, 회원탈퇴를 진행하면 정보를 되돌릴 수 없습니다.
	</p>
</div>


<h3>아이디와 비밀번호를 입력해주세요</h3>
<form action="/mypage/mydelete" method="POST">
<input type="hidden" name="user_no" value="${u.USER_NO}">

ID: <input type="text" name="user_id" id="user_id"><br>
PW: <input type="password" name="user_pw" id="user_pw"><br>

<button id="submit" name="submit">탈퇴하기</button><br>
</form>
<button><a href="/mypage/mypage">마이페이지로 돌아가기</button>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />