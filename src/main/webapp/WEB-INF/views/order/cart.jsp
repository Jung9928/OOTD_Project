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
   <title>장바구니</title>
   <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/cart.css"/>
   <c:import url="../common/styler.jsp"/>
</head>

<body>
<c:import url="../common/header.jsp"/>
   <div id="backbody">
      <div id="frame1">
         <div>
            <div id="frame2">
               <span style="font-size:15pt; font-weight: bold;">장바구니</span>
               <span class="home"><b>장바구니</b>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;주문서 작성&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;주문 완료</span>
            </div>
            
            <div>
            	
               <table class="calculation1" style="margin-top:20px;">
	               <thead>
	                  <tr>
	                     <th colspan="10" style="text-align: left; padding-left: 10px; padding-top: 20px;">Cart Product(${fn:length(cart)})</th>
	                  </tr>
	                  
	                  <tr>
	                     <th colspan="10" style="text-align: left; padding-left: 10px; color: gray; padding-top: 30px; border-bottom: solid 1px #e0e0eb;">상품정보</th>
	                  </tr>
	            
	                  <tr>
	                     <th style="width: 50px;">
	                     	<input type="checkbox" name="checkbox" id="check" style="width: 50px;" checked/>
	                     </th>
	                     <th style="width: 100px;"><span>이미지</span></th>
	                     <th style="width: 400px;">상품정보</th>
	                     <th style="width: 130px;">판매가</th>
	                     <th style="width: 130px;">수량</th>
	                     <th style="width: 130px;">주문관리</th>
	                  </tr>
	               </thead>
	      
	               <tbody id="calculation1tbody">
	               <c:forEach items="${cart}" var="a">
	                  <tr class="calculation1_tbody_tr1" style="height: 90px; background-color: #fff;">
	                  
	        			 <input type="hidden" class="cart_no" value="${a.cart_no}" />
	        			 <input type="hidden" class="pType" value=""/>
	        			 <input type="hidden" class="product_no" value="${a.product_no }" />
	        			 <input type="hidden" class="product_type" value="${a.product_type}"/>
	                   
	                     <!-- Check Btn. Area -->
	                     <td style="text-align: left; text-align: center; border-right: none;">
	                        <input type="checkbox" class="chkbox" id="cbtr1" name="checkbox" checked/>
	                     </td>
	                     
	                     <!-- Product Image Area -->
	                     <td style="border-left: none; border-right: none; width: 100px; text-align: center;">
	                     	<img class="img "src="${pageContext.request.contextPath }/resources/images/productImgUpload/${a.att_name}" width="100px">
	                     </td>
	                     
						 <!-- Product Info. Area -->
	                     <td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">
	                     	<span>[${a.brand_name}]</span> <br/><span class="pName">${a.product_name} </span> <br /><br />옵션 : <span>${a.cart_size}</span>
	                     </td>
	                     
	                     <!-- Price Area -->
	                     <td>
	                        <span class="price1" style="padding-left: 10px;"><fmt:formatNumber value="${a.product_price}" pattern="#,###"/></span>&nbsp;<b>￦</b>
	                        <input type="hidden" class="realPrice" value="${a.product_price}"/>
	                     </td>
	                     
	                     <!-- Quantity Area --> 
	                     <td style="width: 100px;">
	                     	<button class="button1 quanBtn" id="button" type ="button"  value='-' >-</button>
	                        <input id="result" class="result" value="${a.cart_quantity}"></input>
	                        <button class="button2 quanBtn" id="button" type="button"  value='+'>+</button>
	                     </td>
	                     
	                     <!-- Delete Btn. Area -->
	                     <td>
	                        <button class="btn default btndelete">삭제</button>
	                    
	                     </td>
	                  </tr>
	                  </c:forEach>
	               </tbody>
               </table>
               
               <div style="margin: 10px 0;">
                  <button  class="btn default btnfloat" id="deleteSel" style="background-color: #B7B8B9; color: #fff;">선택삭제</button>&nbsp;&nbsp;
                  <button  class="btn default btnfloat" id="deleteAll" style="background-color: #B7B8B9; color: #fff;">전체삭제</button>

               </div>
               <br /><br />
               
               <table class="calculation2">
               <tr style="background-color: #fafafa;">
                  <th style="width: 300px;">총 상품금액</th>
                  <th style="width: 300px;">배송비</th>
                  <th style="width: 300px; padding: 22px 0;"><span>총 결제금액</span></th>
               </tr>
               
               <tr style="background-color: #fff;">
                  <td style="padding: 22px 0;"><span class="totalPrice" id="price"></span>원</td>
                  <td><span class="price" id="price"></span>무료</td>
                  <td><span class="totalPrice" id="price"></span>원</td>
               </tr>
            </table>
            <br /><br /><br />
               
            </div>
            
            <div align="center">
               <button type="button" class="btn default orderbtn" id="orderAll">전체상품주문</button>
               <button type="button" class="btn default" id="orderSelected">선택상품주문</button>
               <button type="button" class="btn default footerbtn continueShopping" id="footerbtn" type="button" onclick="location.href='${pageContext.request.contextPath}'" >쇼핑 계속하기</button>
               <span class="clearboth"></span>
            </div>
            <br /><br /><br /><br />
   
            <div class="guideFrame">
               이용안내
            </div>
            <div class="guideDetail">
               <ul>
                  <li class="lifont">구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</li>
                  <li class="lifont">내일의 옷은 기본적으로 전 상품 무료 배송입니다.</li>
                  <li class="lifont">2개 이상 브랜드를 주문하신 경우, 각각 개별 배송됩니다.</li>
                  <li class="lifont">장바구니에 담은 시점과 현재의 판매 가격이 달라질 수 있습니다.</li>
                  <li class="lifont">수량 제한 상품의 경우, 가상계좌를 통한 주문은 최대 2건까지만 가능합니다.(미입금 주문 기준, 기존 주문 합산)</li>
               </ul>
            </div>
         </div>
      </div>
   </div>
   

 <script>
    $(document).ready(function(){
	  // 체크박스 전체 선택, 개별 선택, 선택 해제
      $(".calculation1 thead input:checkbox[id=check]").click(function(){
         var bool = $(this).prop("checked");
         $(".calculation1 tbody input:checkbox[name=checkbox]").prop("checked", bool);
         calcPrice_all()
      });
      
      $(".calculation1 tbody input:checkbox[name=checkbox]").click(function(){
         var flag = false;
         $(".calculation1 tbody input:checkbox[name=checkbox]").each(function(){
            var bool = $(this).prop("checked");  // 각 체크박스의 값이 true 인지 false 인지 구분
           
            if(!bool){
               $(".calculation1 thead input:checkbox[id=check]").prop("checked", false);  // 품목 체크박스가 하나라도 false 라면 전체선택 체크박스를 false로 변경
               flag = true;
               return false;
            }
         });
         
         if(!flag){
            $(".calculation1 thead input:checkbox[id=check]").prop("checked", true);  // 전체가 다 체크되어있으면 전체선택 체크박스도 true로 변경
         }
      });
      
      
      calcPrice_all();
   });
  

  function calcPrice_all(){
	  var _totalPrice = 0;
	  
	$('.chkbox:checked').each(function(){
		_totalPrice += Number($(this).parent().parent().find('.realPrice').val()) * Number($(this).parent().parent().find('.result').val());
	}); 
	
	$('.totalPrice').text(thousandComma(_totalPrice));
  }
  
    
   // checkbox on change
   $('.chkbox').on('change', function(){
	   calcPrice_all();	   
   });
	  
   
   // 천단위 쉼표 함수 선언 
   function thousandComma(x){
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
   
   // 수량 -
   $('.button1').click(function(){
	   var a = parseInt($(this).siblings('.result').val());
	   
	    //  console.log("a2", a);
	      a = a-1;
	      if(a<1){
	         alert("잘못된 수량입니다.") 
	         return false;
	         }
	      $(this).siblings('.result').val(a);
	      
	      calcPrice_all();
   });
   
   // 수량 +
   $('.button2').click(function(){
      var a = parseInt($(this).siblings('.result').val());
     // console.log("a1", a);
      a= a+1;
      $(this).siblings('.result').val(a);
   
      var price = $('.realPrice').val(); // span의 id값을 가져와서 a x price
      
      calcPrice_all();
      
   });
   
   // 수량 변경시 DB 업데이트(CART_QUANTITY) - ajax
   $('.button1, .button2').on('click', function(){
	   var quantity = $(this).siblings('.result').val();
	   var cart_no = $(this).parent().parent().children('.cart_no').val();
	   
	   $.ajax({
			type: "GET",
			url: "${pageContext.request.contextPath}/order/updateQuantity.or",
			data: { "cart_no" : cart_no,
					"quantity" : quantity}, 
					
			success: function(data){
					console.log("수량 업데이트 완료");
				}, error : function(){
					console.log("실패");
				}
			});

	   
   })
   
   
      
   
	// 삭제 버튼 ajax 츄라이 2 --- 성 공!! //
	
	$('.btndelete').click(function(){		

		var cart_no = $(this).parent().parent().children('.cart_no').val();
		console.log(cart_no);
		
		$.ajax({
			type: "GET",
			url: "${pageContext.request.contextPath}/order/deleteCartProduct.or",
			data: { "cart_no" : cart_no }, 
			success: function(data){
					console.log("성공");
					document.location.reload(true);
					// location.href="${pageContext.request.contextPath}/order/cart.or"
				}, error : function(){
					console.log("실패");
				}
			});
	})

   
   /*
   // 선택 품목 삭제  -- Original Ver.
   $("#deleteSel").click(function(){
	   // 선택된 항목 카트번호 담을 배열 선언
	   var selchk = [];
	   
	   $('.chkbox:checked').each(function(){
		   var cart_no = Number($(this).parent().parent().children('.cart_no').val());
		   selchk.push(cart_no);
		   })
	// selchk 배열 확인
	//	console.log(selchk);
	//  console.log(selchk[1]);
	//  console.log(selchk.length);
		
	// 배열 컨트롤러로 전송
	    location.href="${pageContext.request.contextPath}/order/deleteCartProductList.or?selchk="+ selchk;
	    calcPrice_all();
   })*/
  
   // 선택 품목 삭제  -- ajax Ver.
   $("#deleteSel").click(function(){
	   // 선택된 항목 카트번호 담을 배열 선언
	   var selchk = [];
	   
	   $('.chkbox:checked').each(function(){
		   var cart_no = Number($(this).parent().parent().children('.cart_no').val());
		   selchk.push(cart_no);
		   });
		   
		console.log(selchk);	   
		
	// ajax 시작
		$.ajax({
			type: "GET",
			url: "${pageContext.request.contextPath}/order/deleteCartProductList.or",
			data: { "selchk" : selchk }, 
			success: function(data){
					document.location.reload(true);
				}, error : function(){
					console.log("실패");
				}
			});		  
   		})
   
   // 전체 품목 삭제 Original Ver.
      $("#deleteAll").click(function(){
	   	
    	 // cart 테이블에서 회원번호에 해당하는 품목 전부 삭제
    	 location.href ="${pageContext.request.contextPath}/order/deleteCartProductAll.or"
    	 calcPrice_all();
  	  })
 
	 /*
  // 전체 품목 삭제 ajax Ver.  --- 만들긴 했지만 굳이 ajax 쓸 필요가 없다?! 
     $("#deleteAll").click(function(){
   	
   	 // cart 테이블에서 회원번호에 해당하는 품목 전부 삭제
		$.ajax({
			type: "GET",
			url: "${pageContext.request.contextPath}/order/deleteCartProductAll.or",
			data: { }, 
			success: function(data){
					document.location.reload(true);
				}, error : function(){
					console.log("실패");
				}
			});		  
  		})
  		*/
 
   
   // 선택 상품 주문
	$('#orderSelected').click(function(){
		var selectedCart_no = [];
		
		 $('.chkbox:checked').each(function(){
			 var cart_no = Number($(this).parent().parent().children('.cart_no').val());
			 selectedCart_no.push(cart_no);
			   })
		 
		// console.log(selProduct_no);
		 
		 if(selectedCart_no.length > 0){
			 location.href = "${pageContext.request.contextPath}/order/order.or?selectedCart_no="+selectedCart_no;
		 } else {
			 alert("상품이 선택되지 않았습니다.");
		 };
		
	});
   
   
   // 모든 상품 주문
   $('#orderAll').click(function(){
	   var selectedCart_no = [];
		
		 $('.cart_no').each(function(){
			 var cart_no = Number($(this).val());
			 selectedCart_no.push(cart_no);
			   })
		 
		// console.log(selProduct_no);
		
	   if(selectedCart_no.length > 0){
			 location.href = "${pageContext.request.contextPath}/order/order.or?selectedCart_no="+selectedCart_no;
		 } else {
			 alert("상품이 선택되지 않았습니다.");
		 };
   });
   
   
   
   $('.img').on('click', function(){
	   var pNo = $(this).parent().siblings('.product_no').val();
	   var pType = $(this).parent().siblings('.product_type').val();
	   location.href = "${pageContext.request.contextPath}/product/productDetail.do?product_no="+pNo+"&pType="+pType; 
   })
   
   $('.pName').on('click', function(){
	   var pNo = $(this).parent().siblings('.product_no').val();
	   var pType = $(this).parent().siblings('.product_type').val();
  	   location.href = "${pageContext.request.contextPath}/product/productDetail.do?product_no="+pNo+"&pType="+pType; 
   })

</script>

<c:import url="../common/footer.jsp"/>
</body>
</html>