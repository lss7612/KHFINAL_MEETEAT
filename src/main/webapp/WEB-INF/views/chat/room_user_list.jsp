<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(document).ready(function(){
	//mouseleave
	$(".chatListUserMenu").mouseleave(function(){
		if($(".userHiddenMenu").is(":visible")){
			console.log("hidden menu close")
			$(".chatListUserMenu >td").css({"padding" : "3px 3px 3px 3px"});
			$(".userHiddenMenu").slideUp();
		}
	})
	//채팅목록에서 닉네임 클릭시 나타나는 유저메뉴
	$(".chatListUserMenu >td>span").click(function(){
		console.log("---유저닉네임 클릭 감지---")
		var submenu = $(this).next().next("ul");
		var tbrow = $(this).parent();
		
		if(submenu.is(":visible")){
			submenu.slideUp();
			$(tbrow).css({"padding" : "3px 3px 3px 3px"});
		} else{
			//already open user hidden menu close
			$(".chatListUserMenu >td").css({"padding" : "3px 3px 3px 3px"});
			$(".chatListUserMenu >td>span").next().next("ul").slideUp();
			console.log("already open hidden menu closed")
			
			submenu.slideDown();
			$(submenu).css({"display" : "inline-block", "left" : "40px"});
			$(tbrow).css({"padding" : "5px 3px 5px 3px"});
			console.log("hidden menu open");
		}
	})
})

//회원 목록에서 채팅하기 클릭시 동작할 함수
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
</script> 
<table id="chatUserList">
	 <c:forEach items="${chatUserList }" var="user">
	 <c:choose>
	 	<c:when test="${user_no eq user.USER_NO }">
	 		<c:choose>
	 			<c:when test="${user.USER_GENDER eq 'M' }">
	 				<tr>
						<td>
							<span class="chatListUserNick">🙍‍♂️ ${user.USER_NICK } <span id="checkme">&lt;나&gt;</span></span>
						</td>
					</tr>
	 			</c:when>
	 			<c:otherwise>
					<tr>
						<td>
							<span class="chatListUserNick">🙍‍♀️ ${user.USER_NICK } <span id="checkme">&lt;나&gt;</span></span>
						</td>
					</tr>
	 			</c:otherwise>
	 		</c:choose>
	 	</c:when>
	 	<c:when test="${user_no ne user.USER_NO }">
	 		<c:choose>
	 			<c:when test="${user.USER_GENDER eq 'M' }">
					<tr class="chatListUserMenu">
						<td style="position : relative;">
							<span class="chatListUserNick">🙍‍♂️ ${user.USER_NICK }</span>
							<br>
							<ul class="userHiddenMenu">
								<li onclick="createChat(this);" loginUserNo="${user_no }"  user_no="${user.USER_NO }">채팅하기</li>
							</ul>
						</td>
					</tr>
	 			</c:when>
	 			<c:otherwise>
					<tr class="chatListUserMenu">
						<td style="position : relative;">
							<span class="chatListUserNick">🙍‍♀️ ${user.USER_NICK }</span>
							<br>
							<ul class="userHiddenMenu">
								<li onclick="createChat(this);" loginUserNo="${user_no }"  user_no="${user.USER_NO }">채팅하기</li>
							</ul>
						</td>
					</tr>
	 			
	 			</c:otherwise>
	 		</c:choose>
	 	</c:when>
	 </c:choose>
	 </c:forEach>
	 <!-- Hidden Menu용 여백셀 -->
	 <tr>
	 	<td>&nbsp;</td>
 	</tr>
</table>