<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<script type="text/javascript">
$(document).ready(function() {
	
	//작성자 정보 누르면 채팅메뉴 나타나게 동작하는 스크립트
	
	//userMenu mouseleave event
	$(".attendeeMenu").mouseleave(function(){
		if($(".attendeeHiddenMenu").is(":visible")){
			console.log("hidden menu close")
			$(".attendeeHiddenMenu").slideUp();
		}
	})
	
	$(".attendeeMenu>span").click(function(){
		
		var submenu = $(this).next("ul");
		if(submenu.is(":visible")){
			submenu.slideUp();
		} else{
			$(".attendeeMenu > ul").slideUp();
			submenu.slideDown();
			//슬라이드 메뉴 조정할려면 left의 style값을 변경하면 됩니다.
			$(submenu).css({"display" : "inline-block", "left" : "40px"});
		}
	})
	
	//작성자 정보 누르면 채팅메뉴 나타나게 동작하는 스크립트 끝
	
});

//채팅하기 클릭시 동작하는 스크립트
function createChat(e){
	var user_no = $(e).attr("user_no")
	var loginUserNo = ${user_no}
// 	var loginUserNo = $(e).attr("loginUserNo")
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


<div class="row">
	<div class="col">
		<h3 style="float: left;">참가자 [ ${attendeeCount } / ${attendeeMax } ]</h3>
	</div>
</div>

<c:forEach items="${attendUserList }" var="attendUserList">

	<div class="row attendeeMenu">
		<span class="userNickMenu">
		
			<!-- user_no는 나중에 사진으로 대체 되어야함 -->
			<c:set value="${attendUserList.user.user_profileorigin }" var="origin" />
			<c:set value="${attendUserList.user.user_profilestored }" var="stored" />

			<!-- null일겨우 기본이미지 -->
			<c:if test="${stored eq null && origin eq null }">
				<img id="pof_pic" style="width: 50px; height: 50px;" src="/resources/img/기본이미지.jpg" alt="기본프로필" />
			</c:if>

			<!-- sns로그인 시 프로필사진 편집 전 -->
			<c:if test="${stored ne null && origin eq 'snsLogin' }">
				<img id="pof_pic" style="width: 50px; height: 50px;" src="${attendUserList.user.user_profilestored }" alt="sns프로필" />
			</c:if>
			
			<!-- 프로필사진 편집 시 (sns동일) -->
			<c:if test="${stored ne null && origin ne null && origin ne 'snsLogin'}">
				<img id="pof_pic" style="width: 50px; height: 50px;" src="/resources/upload/${attendUserList.user.user_profilestored }" alt="유저프로필" />
			</c:if>
							
				<h4>${attendUserList.user.user_nick }</h4>
			<c:set value="${attendUserList.user.user_age }" var="ageRange"/>
			<c:set value="${attendUserList.user.user_gender }" var="gender"/>
			
			<c:if test="${gender eq 'M' }">
				<h4>${fn:substring(ageRange,0,1) }0대 🙍‍♂️</h4>
			</c:if>
			<c:if test="${gender eq 'F' }">
				<h4>${fn:substring(ageRange,0,1) }0대 🙍‍♀️</h4>
			</c:if>
		</span>
		<ul class="attendeeHiddenMenu" >
			<li onclick="createChat(this);" loginUserNo="${user_no }"  user_no="${attendUserList.user.user_no }">채팅하기</li>
		</ul>
	</div>

</c:forEach>




