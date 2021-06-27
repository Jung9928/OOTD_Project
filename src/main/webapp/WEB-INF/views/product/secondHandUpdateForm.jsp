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
	<h1 style="margin-top: 100px; text-align: center;">중고 상품 수정</h1>
  <form name="brandFrm" action="${pageContext.request.contextPath}/product/productUpdate.do" method="post" enctype="multipart/form-data">
  			<input type="hidden" name="product_type" value="2" />
  			<input type="hidden" name="product_no" value="${ product.product_no }" />
    <div class="product_detail sh_detail">
        <div class="package" >
            <div id="insertArea" class="inputBox1">
            	<c:forEach items="${ attachment }" var="a" varStatus="vs">
	                <div id="contentImgArea${vs.count}" class="imgInput">
	                    <img src="${pageContext.request.contextPath }/resources/images/productImgUpload/${a.att_name}"
	                        id="contentImg${vs.count}" style="height: 150px; width: 120px;"/>
	                </div>
                </c:forEach>
                <!-- 만약 기존 사진이 4개 이하라면 추가 -->
                <c:if test="${ attachment.size() < 4  }">
	            	<c:forEach items="${ attachment }" end="${ 4 - attachment.size() }" var="a" varStatus="vs">
	            		<div id="contentImgArea${attachment.size() + vs.count}" class="imgInput">
			                <img src="${pageContext.request.contextPath }/resources/images/imgInput.png" 
			                    id="contentImg${attachment.size() + vs.count}" style="height: 150px; width: 120px;"/>
			            </div>
	            	</c:forEach>
	            </c:if>
            </div>
           
            <div id="imgDetail" class="inputBox2">
                <div class='inputBox2 zoom' id='ex1'>
                    <img src='${pageContext.request.contextPath }/resources/images/productImgUpload/${a.att_name}' id='jack' width='540' height='620' alt=''/>
                </div>
            </div>
            
        </div>
        <div class="package">
        
        	<div class="fileArea" id="fileArea">
		            <!--  첨부 사진 추가 영역 -->
				<c:forEach items="${attachment}" var="a" varStatus="vs">
		            <input type="file" accept="image/*" name="productImg" id="thumbImg${vs.count}" onchange="loadImg(this, ${vs.count});" />
				</c:forEach>
				<!-- 만약 기존 사진이 4개 이하라면 추가 -->
	            <c:if test="${ attachment.size() < 4  }">
	            	<c:forEach items="${ attachment }" end="${ 4 - attachment.size() }" var="a" varStatus="vs">
	            		<input type="file" accept="image/*" name="productImg" id="thumbImg${attachment.size() + vs.count}" onchange="loadImg(this, ${attachment.size() + vs.count});" />
	            	</c:forEach>
	            </c:if>
	        </div>
        
            <div id="prTextInput" class="inputBox3">
                <span><b>second-hand</b></span> <br>
                
                <h4 id="pName">${ product.product_name }</h4>
                <span style="margin-left: 260px; margin-right: 5px;" >￦</span><input type="text" name="product_price" id="ppPrice" value="${ product.product_price }" size="4" style="float: right; margin-right: 20px;"/>  <br><hr>
                

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
                   	 	<textarea name="product_detail" id="" cols="30" rows="4">${ product.product_detail }</textarea>
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
                       <textarea name="product_sizeinfo" id="" cols="30" rows="4">${ product.product_sizeinfo }</textarea>
                    </span> <br></dd>
                    <hr>
                    <dt>
                        <b>Select Size</b>
                        <select name="product_size" id="selectSize" style="width: 130px; float: right; margin-right: 30px;">
                            <option value="">선택안함</option>
				            <option value="S">S</option>
				            <option value="M">M</option>
				            <option value="L">L</option>
                        </select> <br>
                    </dt><hr>
                </dl>
            
                <button class="btn" type="submit">수정 완료</button>
                <button class="btn" id="cancel" type="reset">수정 취소</button>
                
            </div>
        </div>
    </div>
  </form>
</section>

<c:import url="../common/footer.jsp"/>
    

        
	<script>
		
		// 상품 취소 
		$("#cancel").on("click",function(){
			location.href = "${pageContext.request.contextPath}/myPage/myPage_Brand_Product.mp";
		});
	
	
		$(function() {
		    $(document).ready(function(){
		        $('#ex1').zoom();
		      
		    });
		});
    
    
    
        // function goCart() {
        // }
        // function goBuy() {
        // }
        
         /* $(function() {
             if($('.totalPD').text()== "") {
                 console.log("totalPD::" + $('.totalPD').text())
                 $('#won').text('0')
             }
         });  */
        
        $('#pDelete').on('click', function() {
            $(this).parent().remove()
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
            $('.totalPD').text(thousandComma(totalPrice));
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
        	
        	/* if($('#contentImgArea1').onchange) {
        		$('#imgDetail').children().children().attr('src', $('#contentImg1').attr('src'));
        	} else if ($('#contentImgArea2').onchange) {
        		$('#imgDetail').children().children().attr('src', $('#contentImg2').attr('src'));
        	} else if ($('#contentImgArea3').onchange) {
        		$('#imgDetail').children().children().attr('src', $('#contentImg3').attr('src'));
        	} else if ($('#contentImgArea4').onchange) {
        		$('#imgDetail').children().children().attr('src', $('#contentImg4').attr('src'));
        	} */
        	
        	
        	
        	
        });
        $('#contentImgArea1').on('click', function() { 
        	$('#thumbImg1').click();
			$('#imgDetail').children().children().attr('src', $('#contentImg1').attr('src'));
		});
		
		$('#contentImgArea2').on('click', function() {
			$('#thumbImg2').click();
			$('#imgDetail').children().children().attr('src', $('#contentImg2').attr('src'));
		});
		
		$('#contentImgArea3').on('click', function() {
			$('#thumbImg3').click();
			$('#imgDetail').children().children().attr('src', $('#contentImg3').attr('src'));
		});
		
		$('#contentImgArea4').on('click', function() {
			$('#thumbImg4').click();
			$('#imgDetail').children().children().attr('src', $('#contentImg4').attr('src'));
		});
		
		$('#fileArea').hide();

		
		
		
		/* var iii = $('#contentImgArea4').children().attr('src');
		console.log("test console" + iii);
		
		$('#contentImg1').children().attr('src').onchange(function() {
			$('#imgDetail').children().children().attr('src', $('#contentImg4').attr('src'));
		}); */
		
		
		
		
		function loadImg(img, num) {
			if (img.files && img.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					switch (num) {
					case 1: 
						$('#contentImg1').attr('src', e.target.result); 
						$('#bigImg').attr('src', e.target.result);
						break;
					case 2:
						$('#contentImg2').attr('src', e.target.result);
						$('#bigImg').attr('src', e.target.result);
						break;
					case 3:
						$('#contentImg3').attr('src', e.target.result);
						$('#bigImg').attr('src', e.target.result);
						break;
					case 4:
						$('#contentImg4').attr('src', e.target.result);
						$('#bigImg').attr('src', e.target.result);
						break;
					}
				}
				reader.readAsDataURL(img.files[0]);
			}
			

		}
    </script>

</body>
</html>