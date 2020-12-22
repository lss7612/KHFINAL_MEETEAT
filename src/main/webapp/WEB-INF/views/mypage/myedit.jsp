<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>  

<script type="text/javascript">

$(document).ready(function() {
	 $("input").keyup(function(){
	      var pw1 = $("#userpw").val();
	      var pw2 = $("#checkpw").val();
	   
	      if(pw1 != "" || pw2 != "") {
	          if(pw1 == pw2){ 
	             $('#alert-success').show();
	             $('#alert-fail').hide();       
	          } else{
	             $('#alert-success').hide();
	             $('#alert-fail').show();
	          }
	       }
	})
})

</script>


<style>

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
	padding-bottom: 43px;
}

.c_header .contxt{
	line-height: 19px;
	padding-top: 10px;
	letter-spacing: -1px;
	color: #666;
}

.contxt{
	padding-left: 10px;
}

p, table, th, td{
	margin: 0;
	padding: 0;
}

p{
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

strong{
	font-weight: bold;
}

form{
	display: block;
}

fieldset{
	display: block;
	margin-inline-start: 2px;
	margin-inline-end: 2px;
	padding-block-start: 0.35em;
	padding-inline-start: 0.75em;
	padding-inline-end: 0.75em;
	padding-block-end: 0.625em;
	min-inline-size: min-content;
}

table{
	text-indent: initial;
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

tbody{
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

input, table, textarea, button{
	font-size: 12px
}

.tbl_model td, .tbl_model th{
	line-height: 14px;
	text-align: left;
	vertical-align: top;
	letter-spacing: -1px;
	border: 0;
	border-top: 1px solid #e5e5e5;
}

th{
	display: table-cell;
	font-weight: bold;
}

td{
	text-align: right;
}

tr{
	padding-top: 10px;
	padding-bottom: 10px;
}

</style>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<div id="divpage">
<div id="container">
	<div id="content">
		<div class="c_header">
			<h1>회원 정보 수정</h1>
			<p class="contxt">
				<Strong style="font-size: 25px;">${user_id }</Strong>
				   님의 회원 상세정보 입니다.
			</p>
		</div>
		
		<form action="/mypage/myedit" method="POST" enctype="multipart/form-data" autocomplete="off">
			<input type="hidden" name="user_no" value="${user_no} ">
			<fieldset>
				<table class="tbl_model">
					<tbody>
						<tr>
							<th scope="row">
								<div class="thcell">회원 <br><span class="word_br">프로필 사진</span></div>	
							</th>
							<td>
								<div class="tdcell"><input type="file" name="file" id="file" required accept="image/*"/></div>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<div class="thcell">회원 <br><span class="word_br">아이디</span></div>	
							</th>
							<td>
								<div class="tdcell">${userinfo.USER_ID }</div>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<div class="thcell">회원 <br><span class="word_br">등급</span></div>	
							</th>
							<td>
								<div class="tdcell">${userinfo.GRADE_NAME }</div>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<div class="thcell">회원 <br><span class="word_br">나이</span></div>	
							</th>
							<td>
								<div class="tdcell">${userinfo.USER_AGE }</div>
							</td>
						</tr>				
						<tr>
							<th scope="row">
								<div class="thcell">회원 <br><span class="word_br">닉네임</span></div>	
							</th>
							<td>
								<div class="tdcell"><input type="text" name="user_nick" value="${userinfo.USER_NICK }"/></div>
							</td>
						</tr>		
						<tr>
							<th scope="row">
								<div class="thcell">회원 <br><span class="word_br" >이메일</span></div>	
							</th>
							<td>
								<div class="tdcell"><input type="text" name="user_email" value="${userinfo.USER_EMAIL }"/></div>
							</td>
						</tr>		
						<tr>
							<th scope="row">
								<div class="thcell">회원 <br><span class="word_br">비밀번호</span></div>	
							</th>
							<td>
								<div class="tdcell"><input type="password" name="user_pw" id = "userpw" value="${userinfo.USER_PW }"/></div>
							</td>
						</tr>		
						<tr>
							<th scope="row">
								<div class="thcell">회원 <br><span class="word_br">비밀번호 확인</span></div>	
							</th>
							<td>
								<div class="tdcell"><input type="password" name="checkpw" id = "checkpw" autocomplete="off"/></div>
										<div id = "alert-success"><p style = "color: blue">비밀번호가 일치합니다.</p></div>
										<div id = "alert-fail"><p style = "color: red">비밀번호가 일치하지 않습니다.</p></div>
							</td>
						</tr>		
					</tbody>
				</table><br>
				
				<button class="btn btn-success btn-sm pull-right">수정 완료</button>
				<button class="btn btn-danger btn-sm pull-right" onclick="location.href='/mypage/mydelete'">회원 탈퇴</button>
				<button onclick="location.href='/mypage/mypage'" class="btn btn-warning btn-sm pull-left">돌아가기</button><br>
			</fieldset>
		</form>
		
	</div>
</div>




</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />