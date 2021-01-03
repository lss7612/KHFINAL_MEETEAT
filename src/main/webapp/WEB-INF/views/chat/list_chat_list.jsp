<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="now" value="<%=new Date() %>"/>
<fmt:formatDate value="${now }" var="today" pattern="yyMMdd"/>
<fmt:parseNumber value="${today }" integerOnly="true" var="isDate" />

<c:forEach items="${chatList }" var="list">
	<div class="innerList" onclick="submitChatForm(this);">
		<form class="chatSubmitForm" action="/chat/room" method="post">
			<input type="hidden" name="chatting_id" value="${list.CHATTING_ID }"/>
			<c:choose>
				<c:when test="${list.CHATTING_NAME eq null }">
					<c:forEach items="${roomUserInfo}" var="info">
						<c:if test="${info.CHATTING_NO eq list.CHATTING_NO }">
							<span class="roomName"><strong>${info.USER_NICK }님과의 대화</strong><span>&nbsp;&nbsp;👨‍👦‍👦${list.USER_TOTAL }</span></span>
						</c:if>
					</c:forEach>
				</c:when>
				<c:when test="${list.CHATTING_NAME ne null }">
						<span class="roomName"><strong>${list.CHATTING_NAME }</strong><span>&nbsp;&nbsp;👨‍👦‍👦${list.USER_TOTAL }</span></span>
				</c:when>
			</c:choose>
			<br>
			<c:choose>
				<c:when test="${roomUserInfo.size() gt 4 }">
					<c:forEach items="${roomUserInfo }" var="info" begin="0" end="4">
						<c:if test="${info.CHATTING_NO eq list.CHATTING_NO}">
							<c:choose>
								<c:when test="${info.USER_PROFILESTORED eq null }">
									<img class="profileImg" src="/resources/img/기본이미지.jpg"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</c:when>
								<c:otherwise>
									<img class="profileImg" src="/resources/upload/${info.USER_PROFILESTORED }"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
				</c:when>
					<c:otherwise>
						<c:forEach items="${roomUserInfo }" var="info" >
							<c:if test="${info.CHATTING_NO eq list.CHATTING_NO}">
								<c:choose>
									<c:when test="${info.USER_PROFILESTORED eq null }">
										<img class="profileImg" src="/resources/img/기본이미지.jpg"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</c:when>
									<c:otherwise>
										<img class="profileImg" src="/resources/upload/${info.USER_PROFILESTORED }"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
<%-- 			<c:forEach items="${roomUserInfo }" var="info" > --%>
<%-- 				<c:if test="${info.CHATTING_NO eq list.CHATTING_NO}"> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${info.USER_PROFILESTORED eq null }"> --%>
<!-- 							<img class="profileImg" src="/resources/img/기본이미지.jpg"/> -->
<!-- 							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<%-- 							<img class="profileImg" src="/resources/upload/${info.USER_PROFILESTORED }"/> --%>
<!-- 							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:if> --%>
<%-- 			</c:forEach> --%>
			<div class="innerContentArea">
				<c:choose>
					<c:when test="${list.MSG_CONTENT ne null }">
						<span class="innerTime">
						<!-- 날자 비교해서 오늘 / 어제/ 기타로 출력 -->
						<fmt:formatDate value="${list.MSG_DATE }" var="msg_date" pattern="yyMMdd"/>
						<fmt:parseNumber value="${msg_date }" integerOnly="true" var="itDate" />
						<c:choose>
							<c:when test="${today eq msg_date }">
								오늘
								<fmt:formatDate value="${list.MSG_DATE }" type="both" pattern="a"/>
								<fmt:formatDate value="${list.MSG_DATE }" pattern="HH:mm"/>
							</c:when>
							<c:when test="${isDate - itDate eq 1}">
								어제
								<fmt:formatDate value="${list.MSG_DATE }" type="both" pattern="a"/>
								<fmt:formatDate value="${list.MSG_DATE }" pattern="HH:mm"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${list.MSG_DATE }" pattern="yy/MM/dd HH:mm"/>
							</c:otherwise>
						</c:choose>
						</span>
					</c:when>
					<c:otherwise>
						<span class="innerTime">
						</span>
					</c:otherwise>
				</c:choose>
				<span class="innerContent">
					${list.MSG_CONTENT }
				</span>
			</div>
		</form>
	</div>
</c:forEach>