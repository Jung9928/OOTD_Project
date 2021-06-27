<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>brand</title>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/productInput.css" />
    <c:import url="../common/styler.jsp"/>
</head>


<body>
    <c:import url="../common/header.jsp"/>
<div class="container">
	<div class="brandInput-title">
		<span>브랜드 상품 등록</span>
	</div>
	<form name="brandFrm" action="${pageContext.request.contextPath}/product/productInput.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="product_type" value="1" />
			<input type="hidden" name="member_no"value="${ member.member_no }"/>
		<div class="input-area">
		    <div class="input-img-area">
		        <div id="insertArea" class="inputBox1">
		            <div id="contentImgArea1" class="imgInput iip">
		                <img src="${pageContext.request.contextPath }/resources/images/imgInput.png" id="contentImg1" class="addImg"/>
		            </div>
		            <div id="contentImgArea2" class="imgInput iip">
		                <img src="${pageContext.request.contextPath }/resources/images/imgInput.png" id="contentImg2" class="addImg"/>
		            </div>
		            <div id="contentImgArea3" class="imgInput iip">
		                <img src="${pageContext.request.contextPath }/resources/images/imgInput.png" id="contentImg3" class="addImg"/>
		            </div>
		            <div id="contentImgArea4" class="imgInput iip">
		                <img src="${pageContext.request.contextPath }/resources/images/imgInput.png" id="contentImg4" class="addImg"/>
		            </div>
		        </div>
		
		        <div id="imgDetail" class="inputBox2">
		            <div id="imageDetail" class="imgInput">
		                <img src="" alt="" style="height: 640px; width: 390px;" id="bigImg">
		            </div>
		        </div>
		    </div>
		    <div class="package">
		        <div class="fileArea" id="fileArea">
		            <!--  첨부 사진 추가 영역 -->
		            <!-- (input:file#thumbImg$[name=thumbImg$ onchange=loadImg(this,$)])*4  -->
		            <input type="file" accept="image/*" name="productImg" id="thumbImg1" onchange="loadImg(this, 1);" />
		            <input type="file" accept="image/*" name="productImg" id="thumbImg2" onchange="loadImg(this, 2);" />
		            <input type="file" accept="image/*" name="productImg" id="thumbImg3" onchange="loadImg(this, 3);" />
		            <input type="file" accept="image/*" name="productImg" id="thumbImg4" onchange="loadImg(this, 4);" />
		        </div>
		
		        <div id="prTextInput" class="inputBox3">
		            <h4>Brand Name : ${ member.brand_name }</h4>
		            <br>
		            <input type="text" id="productName" class="ininput" placeholder="상품명" name="product_name" required>
		            <br>
		            <input type="number" id="productPrice" class="ininput" placeholder="가격(숫자만 입력)" name="product_price" required>
		            <br><hr>
		            <h5>Product Detail</h5>
		            <textarea id="productDetail" cols="32" rows="8" class="ininput" placeholder="겉감 코튼100%/안감 폴리에스터100%" name="product_detail" required></textarea>
		            <br><hr>
		            <h5>Size, Color</h5>
		            <textarea id="productInfo" cols="32" rows="8" class="ininput" placeholder="- S 어깨 52.5cm 가슴 62cm                      - Color : Black, Brown" name="product_sizeinfo" required></textarea>
		            <br><hr>
		            <h5>Option & Stock</h5>
		            <!-- <input type="text" id="productOption" placeholder="옵션명" class="ininput"> -->
		
					<span> S size : &nbsp;&nbsp; </span>
		            <input type="text" id="quantity1" class="ininput2" placeholder="수량 입력" name="product_stock_s" value="0"><br>
		            <span> M size : &nbsp;&nbsp; </span>
		            <input type="text" id="quantity2" class="ininput2" placeholder="수량 입력" name="product_stock_m" value="0"><br>
		            <span> L size : &nbsp;&nbsp; </span>
		            <input type="text" id="quantity3" class="ininput2" placeholder="수량 입력" name="product_stock_l" value="0"><br>
		            <hr>
		            <h5>Category</h5>
					<select name="product_category" id="selectCategory" style="width: 160px;" required>
			            <option value="">선택안함</option>
			            <option value="1">Top</option>
			            <option value="2">Bottom</option>
			            <option value="3">Shoes</option>
			            <option value="4">Hat</option>
			            <option value="5">Bag</option>
		            </select><hr /><br />
		            
		            <button id="btn" type="submit">등록하기</button>
		        </div>
		    </div>
		
	    </div>
    </form>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    	<c:import url="../common/footer.jsp"/>
</body>

    <script>
        $('#contentImgArea1').on('click', function() { 
			$('#thumbImg1').click();
		});
		
		$('#contentImgArea2').on('click', function() {
			$('#thumbImg2').click();
		});
		
		$('#contentImgArea3').on('click', function() {
			$('#thumbImg3').click();
		});
		
		$('#contentImgArea4').on('click', function() {
			$('#thumbImg4').click();
		});
		
		$('#fileArea').hide();
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
</html>