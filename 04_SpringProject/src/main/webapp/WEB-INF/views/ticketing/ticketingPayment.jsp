<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Culture Shock</title>
	<script src="../resources/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ticketingPayment.css" />

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>

<body >
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/menubar.jsp"/>

	<section>	
		    <div class="reserve-container">
		        <div class="poster">
		            <div class="reserve-title">포스터</div>			            		            			
		           		<div class="movie-list">
		           			<img src="${art.artImg}">
		           		</div>		           							           		
		        </div>	
		        
		         <div class="payment-check">
		         	<div class="reserve-title">결제 정보</div>	         
		         	
		        	<div class="sort-wrapper">
			        	<div class="sort-rate sort-selected" id="artGenre">장르 : ${art.artGenre}</div>   			                            				           				           		           
			        </div>
			        <hr />		            
			        <div class="sort-wrapper">
			        	<div class="sort-rate sort-selected" id="artTitle">작품명 : ${art.artTitle}</div>               			                 				            
			        </div> 			       
			        <hr />		
			        <div class="sort-wrapper">
			        	<div class="sort-rate sort-selected" id="artPlace">공연 장소 : ${art.artPlace}</div>               			                 		            
			        </div>    
			        <hr />		            
			        <div class="sort-wrapper">
						<div class="sort-rate sort-selected" id="reservDate">관람 날짜 : ${reservDate}</div>   			                				          
			        </div>
			        <hr />		    
			        <div class="sort-wrapper">
			        	<div class="sort-rate sort-selected" id="selectedSeat1">선택 좌석 : ${selectedSeat1}</div>   			           	
			        </div>
			        <hr />		    
			        <div class="sort-wrapper">
			        	<div class="sort-rate sort-selected" id="totalPayment">총 결제 가격 : ${totalPayment}</div>   			           		
			        </div>
			        		   
			        
			        <hr />
			        <div class="sort-wrapper">
			        	<button id="payBtn">결제하기</button> 
			        	&nbsp;&nbsp; 
			        	<button type="button" onclick="location.href='${pageContext.request.contextPath}/search/searchList.do'">돌아가기</button>        
			        </div>		       
		        </div>         
		    </div>    		      
    </section>
	
	<script type="text/javascript"
			src="https://service.iamport.kr/js/iamport.payment-1.1.5.js">
	</script>
		
	<script>
		var IMP = window.IMP; // 생략가능
		var iamportKey = 'imp47241389';

	
		$(function() {
			IMP.init( iamportKey );
		}); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		$('#payBtn').on('click', function(){
			// 문서 로딩될 때 바로 호출
			
				IMP.request_pay({
					pg : 'kakao',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name: '작품명:' + $('#artTitle').text(),
				    amount : $('#totalPayment').text(),				
					buyer_email : 'test@example.com',
					buyer_name : '홍길동',
					buyer_tel : '010-1111-2222',
					buyer_addr : '서울시 강남구 역삼동',
					buyer_postcode : '01234'
				}, function(rsp) {
					console.log(rsp);
					if (rsp.success) {
						//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
						$.ajax({
							url : "/api/orderconfirm.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
							type : 'POST',
							dataType : 'json',
							data : {
								item : 'toy',
								code : 'P0001',	
								quan : $('#quan').val(),
								imp_uid : rsp.imp_uid,
								pay_method : rsp.pay_method,
								price : rsp.paid_amount,
								status : rsp.status,
								title : rsp.name,
								pg_tid : rsp.pg_tid,
								buyer_name : rsp.buyer_name,
								paid_at : rsp.paid_at,
								receipt_url : rsp.receipt_url
							//기타 필요한 데이터가 있으면 추가 전달
							}
						});
						location.href="/api/views/iamport/orderConfirm.jsp?item=toy&pay_method="+rsp.pay_method
						+"&quan=" + $('#quan').val() + "&nick="+rsp.buyer_name + "&price="+ $('#price').text()
						+"&date="+rsp.paid_at+"&price="+rsp.paid_amount;
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '\n에러내용 : ' + rsp.error_msg;
						alert(msg);
					}
				});
		});
	</script>
    
    <c:import url="../common/footer.jsp"/>
</body>

</html>

<!-- 41라인 <input type="hidden" id="reservDate" name="reservDate"/>
     99라인 $('#reservDate').val($(this).find('span').text()); 
     강사님께서 도와주신 것!! 대박!! -->