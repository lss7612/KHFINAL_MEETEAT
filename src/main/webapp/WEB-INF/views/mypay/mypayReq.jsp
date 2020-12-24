<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
$(document).ready(function(){
	
		var IMP = window.IMP; // 생략해도 괜찮습니다.
		IMP.init("imp94186351"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
			 
		IMP.request_pay({ // param
			    pg: "kakaopay",
			    pay_method: "card",
			    merchant_uid: "issue_billingkey_monthly_0007", // 빌링키 발급용 주문번호
			    customer_uid: "gildong_0001_1234", //카드(빌링키)와 1:1로 대응하는 값, 해당속성에 지정한 값으로 반복 결제 시도 - 고유한 고객번호를 지정한다
			    name: "MeetEat 최초정기결제",
			    amount: 0, //0으로 설정하여 빌링키 발급만 진행
			    buyer_email: "${userinfo.USER_EMAIL }",
			    buyer_name: "${userinfo.USER_NAME }",
// 			    buyer_tel: "010-4242-4242",
// 			    buyer_addr: "서울특별시 강남구 신사동",
// 			    buyer_postcode: "01181"
			  }, function (rsp) { // callback
			    if (rsp.success) {
			    	// 빌링키 발급 성공 
			        // jQuery로 HTTP 요청
			        jQuery.ajax({
			        	url: "/mypage/mypay", //서비스 웹서버
			        	method: 'POST',		        	
			        	dataType: 'json',
			        	data:{
			        		customer_uid: "gildong_0001_1234", // 카드(빌링키)와 1:1로 대응하는 값 
							buyer_email: "${userinfo.USER_EMAIL }"
			        	}

			        });
		
			    } else {// 빌링키 발급 실패
			    	alert("결제에 실패하였습니다!" + rsp.error_msg);
			    }
		
		
		});

	
});

</script>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
