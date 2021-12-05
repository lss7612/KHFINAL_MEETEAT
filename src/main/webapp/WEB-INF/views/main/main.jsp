<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="/WEB-INF/views/layout/headerForMain.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<script>
	const contextPath = `${pageContext.request.contextPath}`;
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>

<div id="backgroundImg">
<img style="min-width:1750px;width:100%" src="${pageContext.request.contextPath}/resources/img/main/Main.jpg">
</div>
<div id="mainWrapper">
	<div id="mainTextBox" class="TextBox1">
	
		<div class="bigText">
			<b style="font-size:1.5em;">MEETEAT</b><br>
			새로운 사람과 함께 먹는 즐거움
		</div>
		
		<div class="smallText">
			저희 MEETEAT은 혼자먹는 것이 외로운 당신에게<br>
			유쾌한 사람과 따뜻한 식탁에 둘러앉아<br>
			즐거운 식사자리를 만들 수 있도록 도와드리려고 해요
			
		</div>
		
		<div id="goToSignUp" class="mainBtn longBtn" >가입하고 함께할래요</div>
		<div id="goToSignIn" class="mainBtn longBtn" >이미 회원이신가요?</div>
		
		
	</div>

<div class="TextBox2">

	<div style="margin:0 auto; padding:0 20%;">
		<div style="width:33%;" class="pull-left">
			<div style="margin:0 auto;" class="veiled border_circle">
				<img style="width:200px;" src="${pageContext.request.contextPath}/resources/img/main/first.jpg">
			</div>
		</div>
		
		<div style="width:33%;" class="pull-left">
			<div style="margin:0 auto;" class="veiled border_circle">
				<img style="width:220px;" src="${pageContext.request.contextPath}/resources/img/main/second.jpg">
			</div>
		</div>
		
		<div style="width:33%;" class="pull-right">
			<div style="margin:0 auto;" class="veiled border_circle">
				<img style="width:200px;" src="${pageContext.request.contextPath}/resources/img/main/third.jpg">
			</div>
		</div>
		
		<div class="clearfix"></div>
		
		<div id="clickImgText" style="padding-top:20px;"class="smallText">
		<b>혼자먹기 심심하세요?<br> 혼자서는 양이 너무 많은가요?<br>그럼 우리를 클릭해서 모이게 해주세요!</b>
		</div>
		
	</div>

</div>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>





