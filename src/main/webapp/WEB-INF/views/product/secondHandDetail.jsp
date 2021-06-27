<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <title>second-handDetail</title>
   
    <c:import url="../common/styler.jsp"/>
    <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 얘는 문제없  -->
     <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous"> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
 -->     <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> 얘가 문제네 -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src='${pageContext.request.contextPath }/resources/js/jquery.zoom.js'></script>
    <script src='${pageContext.request.contextPath }/resources/js/jquery.Wheelzoom.js'></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/productDetail.css" />
</head>
<body>
    <c:import url="../common/header.jsp"/>

<section>
    <div class="product_detail sh_detail">
        <div class="package" >
            <div id="insertArea" class="inputBox1">
            	<c:forEach items="${ attachment }" var="a" varStatus="vs">
	                <div id="contentImgArea${vs.count}" class="imgInput">
	                    <img src="${pageContext.request.contextPath }/resources/images/productImgUpload/${a.att_name}"
	                        id="contentImg${vs.count}" style="height: 150px; width: 120px;"/>
	                </div>
                </c:forEach>
            </div>
           
            <div id="imgDetail" class="inputBox2">
                <div class='inputBox2 zoom' id='ex1'>

                    <img src='${pageContext.request.contextPath }/resources/images/productImgUpload/${a.att_name}' id='jack' width='540' height='620' alt=''/>

                </div>
            </div>
            
        </div>
        <div class="package">
            <div id="prTextInput" class="inputBox3">
                <span><b>second-hand</b></span> <br>
                
                <h4 id="pName">${ product.product_name }</h4>
                <span style="margin-left: 240px;" >￦</span><span id="ppPrice">${ product.product_price }</span> <br><hr>
                

                <dl>
                    <dt class="drop"><b>Product Detail</b> 
                        <span class="accIcon" style="float: right; margin-right: 30px;"> 
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                <path d="M8 0a1 1 0 0 1 1 1v6h6a1 1 0 1 1 0 2H9v6a1 1 0 1 1-2 0V9H1a1 1 0 0 1 0-2h6V1a1 1 0 0 1 1-1z"/>
                            </svg>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-lg" viewBox="0 0 16 16">
                                <path d="M0 8a1 1 0 0 1 1-1h14a1 1 0 1 1 0 2H1a1 1 0 0 1-1-1z"/>
                            </svg>
                        </span>
                    </dt> 
                    <dd class="ddd"><span class="pInfoText">
                   	 	${ product.product_detail }
                    </span> <br></dd>
                    <hr>
                    <dt class="drop"><b>Size, Color</b> 
                        <span class="accIcon" style="float: right; margin-right: 30px;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                <path d="M8 0a1 1 0 0 1 1 1v6h6a1 1 0 1 1 0 2H9v6a1 1 0 1 1-2 0V9H1a1 1 0 0 1 0-2h6V1a1 1 0 0 1 1-1z"/>
                            </svg>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-lg" viewBox="0 0 16 16">
                                <path d="M0 8a1 1 0 0 1 1-1h14a1 1 0 1 1 0 2H1a1 1 0 0 1-1-1z"/>
                            </svg>
                        </span>
                    </dt>
                    <dd class="ddd"><span class="pInfoText">
                        ${ product.product_sizeinfo }
                    </span> <br></dd>
                    <hr>
                    <dt>
                        <b>Select Size</b>
                        <select name="" id="selectSize" style="width: 130px; float: right; margin-right: 30px;">

                            <option value="">선택안함</option>
                            <c:if test="${ product.product_stock_s == 0 && product.product_stock_m == 0 && product.product_stock_l == 0}">
                            	<option value="">품절</option>
                           	 </c:if>
                            <c:if test="${ product.product_stock_s != 0 || product.product_stock_m != 0 || product.product_stock_l != 0}">
                            	<option value="${ product.product_size }">${ product.product_size }</option>
                           	 </c:if>

                        </select> <br>
                    </dt><hr>
                    <dt class="pOrigin">
                        <div id="origin" class="selectedPList">
                       		<input type="hidden" class="product_no" value="${product.product_no}"/>
                       		<input type="hidden" class="product_type" value="${product.product_type }"/>
                            <span>${ product.product_name }<b class="selectedSize"></b> </span>
                            <input type="number" class="quantity" id="pQuan" name="pQuan" value="1" min="1" max="1"> <!-- input value 값 ??  -->
                            <img src="${pageContext.request.contextPath }/resources/images/xx.png" alt="" style="width: 15px; height: 15px; margin-right: 5px;" class="pdeleteBtn" >
                            <span>￦</span><span class="pPrice">${ product.product_price }</span>
                            <input type="hidden" class="selSize" />
                        </div>
                    </dt>
                    <dt class="pResult">
                    </dt>

                    <dt><br /><br />
                        <div>   
                            <b>Total :</b> <span id="won">0</span> <span class="totalPD"></span> <span id="totalQ"></span>
                        </div>
                    </dt>
                </dl>

            

                <button class="btn" onclick="addCart();">add to cart</button>
                <button class="btn" onclick="goBuy();">buy now</button>
            </div>
        </div>
    </div>
    

</section>

<c:import url="../common/footer.jsp"/>
    

        
	<script>
		$(function() {
		    $(document).ready(function(){
		        $('#ex1').zoom();
		      
		    });
		});
    
    
    
    	// 장바구니에 선택상품 담기
		function addCart() {
      	  if(${empty member}){
				alert("PLEASE LOGIN");
			}else{
        		 var pp = $('.selectedSize').text();
        	   	 var cart_size = $('#selectSize').val();
        		 var order_quantity =  $('.quantity').val();
        		 var product_no = $('.product_no').val();
        		
        		
 				if(pp == ""){
		       		  alert('상품의 사이즈를 선택해 주세요');
		       	  } else {
        		 
        	   		$.ajax({
	       		    method: 'POST',
	       		    url: "${pageContext.request.contextPath}/order/addCartListSecondHand.or",
	       		   	data: {
						"product_size" :  cart_size,
						"order_quantity" : order_quantity,
						"product_no" : product_no
					}, 
					success: function(){
						// 장바구니 이동 확인
			        	 if(confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?") == true){
			        	        location.href="${pageContext.request.contextPath}/order/cart.or"
			        	    } else{
			        	        return ;
			        	    };
						}, error : function(){
							alert("실패");
						}
					});
		       	  }
	    	}
    	}
        
        
		 // 상품 상세페이지에서 바로 구매
        function goBuy() {
      	  if(${empty member}){
				alert("LOGIN FIRST.");
      	}else{
      	  var buyList = [];
      	  
       	  var product_no = $('.product_no').val();
       	  var cart_quantity = $('.quantity').val();
       	  var cart_size = $('#selectSize').val();
       	  var product_name = '<c:out value="${ product.product_name }"/>';
       	  var brand_name = '<c:out value="${ product.brand_name }"/>';
       	  var product_price = '<c:out value="${ product.product_price}"/>';
       	  var att_name = '<c:out value="${ attachment[1].att_name }"/>';
	      
	       	  if(cart_size.length == 0){
	       		  alert('상품의 사이즈를 선택해 주세요');
	       	  } else {
		        	
	       	  var product = {
	       			 'product_no' : product_no,
	       			 'cart_quantity' : cart_quantity,
	       			 'cart_size' : cart_size,
	       			 'product_name' : product_name,
	       			 'brand_name' : brand_name,
	       			 'product_price' : product_price,
	       			 'att_name' : att_name
	    	      	  };
			  buyList.push(product);
			  var data = JSON.stringify(buyList);
	      	  
	       	   $.ajax({
	     		    method: 'POST',
	     		    url: '${pageContext.request.contextPath}/order/buyDirectSecondHand.or',
	     		    traditional: true,
					data: {data}, 
					success: function(data){
							console.log("전송 성공")
							location.href="${pageContext.request.contextPath}/order/order.or?selectedCart_no="+data;
						}, error : function(){
							console.log("실패");
						}
					});      	  
      	  
      	  //JSON을 이용해 String 형식으로 만들어 SessionStorage에 저장
      	  // sessionStorage.setItem("buyList", JSON.stringify(buyList));
       	  		}
		  	}
		 }
		 
		 
        
        $('.pResult img').on('click', function() {
        	console.log('test');
            $(this).parent().remove();
        	totalCalc();
        });
            
        $('#pQuan').on('change', function() {
            var uuu = $(this).val()
            
            // var ggg = $('#ppPrice').text().str.substring(indexStart[2, indexEnd])
            // var ggg = $('#ppPrice').text()
            // console.log(uuu);
            // console.log(ggg);
            // console.log(uuu*hhh);
            $(this).siblings('.pPrice').text(thousandComma(uuu*hhh));
            totalCalc();
        });
        var hhh;
        $(function() {
            hhh = $('#ppPrice').text();
            // console.log(hhh);
            $('#ppPrice').text(thousandComma($('#ppPrice').text()));
            if($("#pQuan").val() < 1) alert("최소 주문수량은 1개 입니다.");
        });
        $('.pOrigin').hide();
        // $('.pResult').hide();
        
        $('#selectSize').on('change', function() {
            $('.pResult').show();
            if($('.frmSize.'+$('#selectSize').val()).length == 0){
                var result = $('#origin').clone(true);
                result.removeClass('#origin');
                result.addClass($('#selectSize').val());
                result.addClass('frmSize');
                result.find('.selectedSize').text("[" + $('#selectSize').val() + "]");
               // result.find('.selSize').val($('#selectSize').val());
                
                $('.pResult').append(result);
                $('.pPrice').each(function(){
                    $(this).text(thousandComma($(this).text()));
                });
            } else {
                var quan = $('.frmSize.'+$('#selectSize').val()).find('[name=pQuan]');
                quan.val(parseInt(quan.val()) + 1);
                var priceTag = quan.siblings('.pPrice');
                priceTag.text(thousandComma(parseInt((priceTag.text()).replace(',','')) * quan.val()));
            }
            
            $('.pResult img').on('click', function() {
            	console.log('test');
                $(this).parent().remove();
            	totalCalc();
            });
            
            totalCalc();
            $('#won').text('￦')
            // $('.pResult').$('#selectedSize').text($('#selectSize').val())
        })
        
        
       function totalCalc(){
            var totalPrice = 0;
            // console.log("totalPrice before :: " + totalPrice);
            
            $('.pResult .pPrice').each(function(){
                // console.log("parse : "+$(this).text());
                // console.log("count = " + Number(($(this).text()).replace(/,/gm,'')))
                totalPrice += Number(($(this).text()).replace(/,/gm,''));
            })
            
            // var totalQuan = 0;
            // $('.pResult #pQuan').each(function() {
            //     totalQuan += Number($('#pQuan').val())
            //     $('#totalQ').text("(" + totalQuan + "개)")
            // })
            if( totalPrice != 0) {
	            $('.totalPD').text(thousandComma(totalPrice));
            } else {
            	$('.totalPD').text(thousandComma(0));
            }
            // console.log("totalPrice after :: " + totalPrice);
       }
        
        
        function thousandComma(x){
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
        $('.drop').on('click', function () {
            // 숨긴 영역 slide down
            $(this).next('.ddd').slideToggle(300);
            // +, - 아이콘 바꾸기
            var plus = $(this).children('span').children('.bi-plus-lg');
            var dash = $(this).children('span').children('.bi-dash-lg');
            if ( dash.css('display') == 'none' ) {
                dash.css('display', 'inline-block');
                plus.css('display', 'none');
            } else {
                plus.css('display', 'inline-block');
                dash.css('display', 'none');
            }
            // if ($(this).hasClass('on')) {
            //     slideUp();
            // } else {
            //     slideUp();
            //     $(this).addClass('on').next().slideDown();
            // }
            // function slideUp() {
            //     $('.drop').removeClass('on').next().slideUp();
            // };
        })
	
        $(function() {
        	$('#imgDetail').children().children().attr('src', $('#contentImg1').attr('src'));
        });
        $('#contentImgArea1').on('click', function() { 
			$('#imgDetail').children().children().attr('src', $('#contentImg1').attr('src'));
		});
		
		$('#contentImgArea2').on('click', function() {
			$('#imgDetail').children().children().attr('src', $('#contentImg2').attr('src'));
		});
		
		$('#contentImgArea3').on('click', function() {
			$('#imgDetail').children().children().attr('src', $('#contentImg3').attr('src'));
		});
		
		$('#contentImgArea4').on('click', function() {
			$('#imgDetail').children().children().attr('src', $('#contentImg4').attr('src'));
		});
    </script>

</body>
</html>