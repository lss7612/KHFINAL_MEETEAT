<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript"src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

	$(document).ready(function() {

		$("#check_module").click(function() {

			var email = "${userinfo.USER_EMAIL}";
			var user_no = "${userinfo.USER_NO}";

			var IMP = window.IMP;
			IMP.init('imp94186351');
			var msg;

			IMP.request_pay({
				pg : 'kakao',
				pay_method : 'card',
				// 		    merchant_uid : 'merchant_'+ new Date().getTime(),
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : 'MEETEAT 결제',
				amount : 1900,
				buyer_email : email,
				buyer_name : user_no
			// 		    buyer_tel : $("#tel").val(),
			// 		    buyer_addr : $("#addr").val(),
			// 		    buyer_postcode : $("#postcode").val(),

			}, function(rsp) {
				if (rsp.success) {
					//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					jQuery.ajax({
						url : "/mypay/mypay", //cross-domain error가 발생하지 않도록 주의해주세요
						type : 'POST',
						dataType : 'json',
						data : {//기타 필요한 데이터가 있으면 추가 전달
							imp_uid : rsp.imp_uid,
							merchant_uid : rsp.merchant_uid,
							//   buyer_email : rsp.buyer_email,
							buyer_name : rsp.buyer_name
						},
						success : function(res) {
							console.log("결제 완료");
							console.log(res);
							console.log(res.data);
							console.log(res.result)

							if (res.result) {

								location.href = "/mypay/paySuccess";
							} else {

// 								msg = '결제에 실패하였습니다.';
// 								msg += '에러내용 : ' + rsp.error_msg;
// 								alert(msg);
								location.href = "/mypage/mypage";

							}
						},
						error : function() {
							console.log("실패")
							msg = '결제에 실패하였습니다.';
							msg += '에러내용 : ' + rsp.error_msg;
							alert(msg);
							location.href = "/mypage/mypage";

						}
					})
				} else {
					//[3] 아직 제대로 결제가 되지 않았습니다.
					//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
					msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
					location.href = "/mypage/mypage";
				}
			}); //

		}) // 체크 모듈 end 

	}); // jquery end
</script>

<style>
.pic{
	width: 70%;
	height: 70%;
	margin-left: 165px;
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
	

p{
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	margin: 0;
	padding: 0;
}

</style>

<div id="divpage">

<div class="c_header">
	<h1>결제 페이지<button id="check_module" type="button" class="btn btn-default pull-right" style="margin-right: 10px;">결제하기</button></h1>
	<hr>
	<p class="contxt">결제를 진행하시면 1,900원이 결제되며 모든 게시판을 이용할 수 있습니다!<br>
					 결제를 진행하시면 환불하실 수 없으니 신중히 결제를 진행해주세요...!</p>
</div><br>

<div class="payinfo">
	<img src="/resources/img/mypay.png" title="결제" class="pic">
</div>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />