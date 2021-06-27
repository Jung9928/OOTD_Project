<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width,initial-scale=1">
   <title>주문 페이지</title>
   <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

   
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/order.css"/>
   <c:import url="../common/styler.jsp"/>
</head>
 
<body>
<c:import url="../common/header.jsp"/>
<div id="backbody order">
   <div id="frame1" style="align: center;">
      <div>
         <div id="frame2">
            <span style="font-size:15pt; font-weight: bold;">주문서 작성</span>
            <span class="home">장바구니&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;<b>주문서 작성&nbsp;&nbsp;&nbsp;</b>>&nbsp;&nbsp;&nbsp;주문 완료</span>
         </div>
       
         <div>
            <table class="calculation1" style="margin-top:20px;">
            <thead>
               <tr>
                  <th colspan="10" style="text-align: left; padding-left: 10px; padding-top: 20px;">주문상품(${fn:length(cart)})</th>
               </tr>
               
               <tr>
                  <th colspan="10" style="text-align: left; padding-left: 10px; color: gray; padding-top: 30px; border-bottom: solid 1px #e0e0eb;">상품정보</th>
               </tr>
         
               <tr class="tHead">
                  <th colspan="2" id="pInfo">item</th>
                  <th id="pPrice">price</th>
                  <th id="pQuan">quantity</th>
               </tr>
            </thead>
   
            <tbody>
            <c:forEach items="${cart}" var="a">
               <tr>
               <input type="hidden" class="cart_no" value="${a.cart_no}" />
               <input type="hidden" class="product_no" value="${a.product_no}" />
                  
               <!-- Product Image Area -->
                  <td id="tdImg">
                  	<img src="${pageContext.request.contextPath }/resources/images/productImgUpload/${a.att_name}">
                  </td>
                  
               <!-- Product Info. Area -->
                   <td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">
                   	<span>[${a.brand_name}]</span> <br/><span>${a.product_name} </span> <br /><br />옵션 : <span>${a.cart_size}</span>
                 	<input type="hidden" class="order_size" value="${a.cart_size}" />
                   </td>
                   
               <!-- Price Area -->
                  <td>
                     <span class="price1" style="padding-left: 10px;"><fmt:formatNumber value="${a.product_price}" pattern="#,###"/> </span>&nbsp;￦
                     <input type="hidden" class="realPrice" value="${a.product_price}"/>
                  </td>
	            <!-- Quantity Area --> 
	                <td style="width: 100px;">                        
                  		 <input id="result" class="result quantityInput order_quantity" value="${a.cart_quantity}" disabled/>
                 	</td>
               </tr>
               </c:forEach>
            </tbody>
         </table>    <br />
         
         
         
         <table class="calculation2">
            <tr style="background-color: #fafafa;">
               <th style="width: 300px;">총 상품금액</th>
               <th style="width: 300px;">총 배송비</th>
               <th style="width: 300px; padding: 22px 0;"><span>총 결제금액</span></th>
            </tr>
            
            <tr style="background-color: #fff;">
               <td style="padding: 22px 0;"><span class="totalPrice price" id="price" ></span>원</td>
               <td><span class="price" id="price"></span>무료</td>
               <td><span class="totalPrice price" id="price "></span>원</td>
            </tr>
         </table>
         <br /><br /><br />
            
         </div>
         
         <table class="delivery">
            <thead>
               <tr>
                  <th colspan="10">배송지 정보</th>
               </tr>
               
               <tr>
                  <td class="deliverytd">주문고객</td>
                  <td>
                     ${m.member_name}
                  </td>
               </tr>
               
               <tr>
                  <td class="deliverytd">수령인&nbsp;<span style="color: red">*</span></td>
                  <td><input class="underline recipient" type="text" value="${m.member_name}" required="required" /></td>
               </tr>
               
               <tr>
                  <td class="deliverytd">주소&nbsp;<span style="color: red">*</span></td>
                  
                  <td>
                    <!--  <input class="underline" type="text" id="postnum1" size="10" maxlength="5" />
                     &nbsp; -->
                     
                     
                     <input class="underline" type="text" id="addr1" size="40" placeholder="주소" required="required" style="margin-bottom: 10px;" value="${m.address[0]}"/>
                     <div class="btn default postSearch" id="postnum2" onclick="addrSearch();">주소 찾기</div>
                     <br />
                     <input class="underline" type="text" id="addr2" size="56" placeholder="상세주소" value="${m.address[1]}"/>
                  </td>
               </tr>
               
               <tr>
                  <td class="deliverytd">휴대전화&nbsp;<span style="color: red">*</span></td>
                  <td><input class="underline phoneNo" type="text" placeholder="010-1234-5678" value="${m.phone}"/></td>
               </tr>
               <tr>
                  <td class="deliverytd">이메일&nbsp;<span style="color: red">*</span></td>
                  <td>
                  <input type="hidden" class="fullEmail" value="${m.email}"/>
                  <input class="underline" id="mailId" type="text" required="required"/> @ <input class="underline" id="domainName" type="text" required="required"/>&nbsp;
                     <select id="emailChoice">
                        <option>이메일 선택</option>
                        <option>daum.net</option>
                        <option>naver.com</option>
                        <option>nate.com</option>
                        <option>gmail.com</option>
                     </select>
                  </td>
               </tr>
               
               <tr>
                  <td class="deliverytd" style="border-bottom: solid 1px #e0e0eb; padding-bottom:30px;">배송메모</td>
                  <td style="border-bottom: solid 1px #e0e0eb; padding-bottom:30px;">                  
                     <select id="memoChoice" style="height: 30px; font-size: 13px;">
                        <option value="test1">배송 시 요청사항을 선택해주세요</option>
                        <option value="test2">부재시 경비실에 맡겨주세요</option>
                        <option value="test3">배송 전 연락바랍니다</option>
                        <option value="test4">직접입력</option>
                     </select>
                     <br />
                     <textarea class="textarea order_memo" cols="80" rows="5"></textarea>
                  </td>
               </tr>
            </thead>
         </table>
    
            
         <div class="payArea">
     
               <div class="paymentSelect">
       			   <p>결제수단선택</p>
	               <div class ="paymentIcon">
	                  <label for="card">
	                  	<img src="${pageContext.request.contextPath }/resources/images/orderImg/card_icon.png"/>
	                  </label>
	                  <label for="samsung">
	                 	 <img src="${pageContext.request.contextPath }/resources/images/orderImg/apple_pay_icon.png"/>
	                  </label>
	                  <label for="phone">
	                 	 <img src="${pageContext.request.contextPath }/resources/images/orderImg/phone_icon.png"/>
	                  </label>
	                </div>
	                <div class ="paymentRadio">
	                  <input type="radio" name="cardradio" id="card" value="card" checked />신용카드
	                  <input type="radio" name="cardradio" id="samsung" value="samsung"/>삼성페이
	                  <input type="radio" name="cardradio" id="phone" value="phone"/>휴대폰 결제
             	    </div>
	              </div>
            	
	            <div class="total">
	               <div>
	               		<p>결제정보</p>
	               </div>
	               <div class="finalPriceArea">
		               <span>주문상품금액</span>
		               <span class="won">&nbsp;원</span> <span class="totalPrice fpa-price"></span>
		               <input type="hidden" class="finalPrice" id="finalPrice" value=""/>
	               </div>
	               <div class="btnArea">
	               		<button type="button" class="btn default payBtn">결제하기</button>
	               </div>
	            </div>
       	 	</div>
        	 </div>
       
     
         
         <div class="guideDetail">
         	<div class="detailTitle">
         		<p> 주문 전 확인하세요!</p>
         	</div>
         	<div class="detailContent">
	            <ul>
	               <li class="lifont">실제 결제 금액에 따라 적립포인트는 변경될 수 있습니다.</li>
	               <li class="lifont">내일의 옷은 기본적으로 전 상품 무료 배송입니다.</li>
	               <li class="lifont">2개 이상 브랜드를 주문하신 경우, 각각 개별 배송됩니다.</li>
	               <li class="lifont">오프라인 매장과 동시 판매되고 있어 결제완료/입고확정 이후에도 품절이나 발송지연이 있을 수 있습니다.</li>
	               <li class="lifont">품절 발생 시 문자로 결제취소 또는 재결제에 대해 추가 안내 드리고, 품절취소 고객보상 기준에 따라 보상해 드립니다.</li>
	            </ul>
            </div>
         </div>
    
   </div>
</div>








<script>

function calcPrice(){
	  var sum = 0;
	  $('.realPrice').each(function(){
		 var price = Number($(this).val());
       var quantity = Number($(this).parent().next().children('.result').val());
	         
	       sum += price*quantity;
	  })		  
	  $('#finalPrice').attr('value', sum);
	  var check = $('#finalPrice').val();
	  console.log("함수 내부 작동 확인 : " + check);
	  
	  $('.totalPrice').text(thousandComma(sum));
}
	
   $(function(){

	 calcPrice();
	 console.log("===== cal function : " + $('#finalPrice').val());
	 
	  
	 var totalPrice = $('#finalPrice').val();
	 console.log("실행 확인 : " + totalPrice);
		 
	 // 라디오 값 받아보기 
	 var pay_method = $("[name=cardradio]").val();
	 console.log(pay_method);
	 
   })
   
   
   // 텍스트 에어리어 값 받아보기
   $('#memoChoice').on('change', function(){
	   var order_memo = '없음';
	   if($('#memoChoice option:selected').val() == "test4"){
		   order_memo = $('.textarea').val();
		  } else {
			 order_memo = $('#memoChoice option:selected').text();
		  }
	   })

	 
   
	// ============== 주소 API 시작 ============== // 
   function addrSearch() {
       new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
   
               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullAddr = ''; // 최종 주소 변수
               var extraAddr = ''; // 조합형 주소 변수
   
               // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                   fullAddr = data.roadAddress;
   
               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                   fullAddr = data.jibunAddress;
               }
   
               // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
               if(data.userSelectedType === 'R'){
                   //법정동명이 있을 경우 추가한다.
                   if(data.bname !== ''){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있을 경우 추가한다.
                   if(data.buildingName !== ''){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                   fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
               }
   
               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               $('#postnum1').val(data.zonecode); //5자리 새우편번호 사용
               
               $('#addr1').val(fullAddr);
   
               // 커서를 상세주소 필드로 이동한다.
               $('#addr2').focus();
           }
       }).open();
   };
   // ============== 주소 API 끝 ============== //
 
   $(document).ready(function(){
	  emailSpliter();
	    // 이메일 선택시, 자동으로 값 들어오게 하기
      $("#emailChoice").bind("change", function(){
         $("#domainName").val($(this).val());
      });
   });
   
	// 배송메모 - 직접 입력 선택시에만 textarea 보여주기 
	$('#memoChoice').on('change', function(){
	     var a = $('#memoChoice option:selected').val();
	     if( a == 'test4') {
	        $('textarea').show();
	     } else {
	        $('textarea').hide();
	     }
	});
    
 
	
	// total price calculator 
	function calcPrice(){
		  var sum = 0;
		  $('.realPrice').each(function(){
			 var price = Number($(this).val());
	         var quantity = Number($(this).parent().next().children('.result').val());
		         
		       sum += price*quantity;
		  })		  
		  $('#finalPrice').attr('value', sum);
		  var check = $('#finalPrice').val();
		  console.log("함수 내부 작동 확인 : " + check);
		  
		  $('.totalPrice').text(thousandComma(sum));
	 }


	// 결제 수단 버튼 클릭시 value 변경
	$("[name=cardradio]").click(function(){
		console.log($("[name=cardradio]:checked").val());
	})
	
	


   // 천단위 쉼표 함수 선언 
   function thousandComma(x){
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   }
   

   // 이메일 스플릿(아이디, 도메인 나누기)
   function emailSpliter(){
   		var mailAdd = $('.fullEmail').val();
   		var at = '@';
   		var mAdd = mailAdd.split(at);
   		
   		$('#mailId').val(mAdd[0]);
   		$('#domainName').val(mAdd[1]);
   	 }
  
   // ========= 아임포트 API 구역 ========= //
  
   $('.payBtn').click(function(){
	 
	 // 주문 테이블(O_ORDER)에 담을 데이터 
	 var receiver_name = $('.recipient').val();		// 수령자 이름
	 var order_address = $("#addr1").val()+" "+$("#addr2").val(); // 배송지 주소 설정
	 var order_memo = ''; // 배송 메모
	 	// 메모 설정 조건문
	   if($('#memoChoice option:selected').val() == "test4"){
		   order_memo = $('.textarea').val();
		  } else if($('#memoChoice option:selected').val() == "test1"){
		  } else {
			 order_memo = $('#memoChoice option:selected').text();
		  }
	
   	 var total_price = $('#finalPrice').val();
   	 var member_no = ${m.member_no};
   	
   	 // 주문 리스트 테이블(O_ORDER_LIST)에 담을 데이터
	 // 사이즈 값 배열로 받아보기
   	 var order_size = [];
	 $('.order_size').each(function(){
		 order_size.push($(this).val());
	 })
   	 var order_quantity = [];
	 $('.order_quantity').each(function(){
		 order_quantity.push($(this).val());
	 })
	 var product_no = [];
	 $('.product_no').each(function(){
		product_no.push($(this).val()); 
	 	})
 	 var cart_no = [];
	 $('.cart_no').each(function(){
		cart_no.push($(this).val()); 
	 	})
	 
	 
	 var pay_method = $("[name=cardradio]:checked").val();	 // 결제 수단 변수 설정 
	 var email = $('#mailId').val();	 // 수령자 이메일 설정(아이디)
	 var domainName = $('#domainName').val();	  // 수령자 이메일 설정(도메인)

	 var phone = $('.phoneNo').val();	 // 수령자번호 설정

	 var IMP = window.IMP; // 생략가능
     IMP.init('imp02353224'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

     IMP.request_pay({
  	    pg : 'inicis', // version 1.1.0부터 지원.
  	    pay_method : pay_method,
  	    merchant_uid : 'merchant_' + new Date().getTime(),
  	    name : 'OOTD',
  	    amount : total_price,
  	    buyer_email : email+"@"+domainName,
  	    buyer_name : receiver_name,
  	    buyer_tel : phone,
  	    buyer_addr : order_address,
  		}, function(rsp) { // callback
	  	    if ( rsp.success ) {  // 결제 성공 
	  	        var msg = '결제가 완료되었습니다.';

	  		   $.ajax({
	  					type: "POST",
	  					url: "${pageContext.request.contextPath}/order/paymentSuccess.or",
	  					data: { "receiver_name" : receiver_name,
	  							"order_address" : order_address,
	  							"order_memo" : order_memo,
	  							"total_price" : total_price,
	  							"order_size" : order_size,
	  							"order_quantity" : order_quantity,
	  							"product_no" : product_no,
	  							"cart_no" : cart_no
	  							}, 
	  							
	  					success: function(data){
	  							location.href="${pageContext.request.contextPath}/order/orderResult.or"
	  						}, error : function(){
	  							console.log("실패");
	  						}
	  					});  
	  	    	
	  	    	
  	    } else {
  	        var msg = rsp.error_msg;
  	    }
  	    alert(msg);
  		});
     })
        // ========= 아임포트 API 구역 끝 ========= //
        
    

   
</script>
<c:import url="../common/footer.jsp"/>
</body>
</html>