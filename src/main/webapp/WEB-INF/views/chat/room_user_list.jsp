<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
							<span class="chatListUserNick"> 🙍‍♀️ ${user.USER_NICK } <span id="checkme">&lt;나&gt;</span></span>
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