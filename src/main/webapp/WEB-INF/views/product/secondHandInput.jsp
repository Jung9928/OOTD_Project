<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>second-hand</title>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/productInput.css" />
    <c:import url="../common/styler.jsp"/>
</head>

<body>
    <c:import url="../common/header.jsp"/>
<div class="container">
	<div class="brandInput-title">
		<span>중고 상품 등록</span>
	</div>
	<!-- enctype="multipart/form-data"을 form 속성으로 작성하면 다른 데이터가 vo에 안넘어감... -->
	<form name="secondHandFrm" action="${pageContext.request.contextPath}/product/productInput.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="product_type" value="2" />
			<!-- 방법 1 : 상품 등록 페이지가 로드되면 ajax 또는 함수를 사용해서 현재 로그인된 회원의 번호를 가져오자. -->
			<input type="hidden" name="member_no" value="${ member.member_no }" />
		<div class="input-area">
		    <div class="input-img-area">
        <div id="insertArea" class="inputBox1">
            <div id="contentImgArea1" class="imgInput iip">
                <img src="${pageContext.request.contextPath }/resources/images/imgInput.png" 
                    id="contentImg1" class="addImg"/>
            </div>
            <div id="contentImgArea2" class="imgInput iip">
                <img src="${pageContext.request.contextPath }/resources/images/imgInput.png" 
                    id="contentImg2" class="addImg"/>
            </div>
            <div id="contentImgArea3" class="imgInput iip">
                <img src="${pageContext.request.contextPath }/resources/images/imgInput.png" 
                    id="contentImg3" class="addImg"/>
            </div>
            <div id="contentImgArea4" class="imgInput iip">
                <img src="${pageContext.request.contextPath }/resources/images/imgInput.png" 
                    id="contentImg4" class="addImg"/>
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
            <input type="text" id="productName" class="ininput" placeholder="상품명" name="product_name" required>
            <br>
            <input type="number" id="productPrice" class="ininput" placeholder="가격(숫자만 입력)" name="product_price" required>
            <br><hr>
            
            <h5>Product Detail</h5>
            <textarea id="productDetail" cols="32" rows="10" class="ininput" name="product_detail">
브랜드 :
구매가 :
구매장소 : 
구입시기 : 
착용 횟수 :
상태 : 
특이사항 : 
상품 링크 : 
            </textarea>
            <br><hr>
            <h5>Size, Color</h5>
            <textarea id="productInfo" cols="32" rows="8" class="ininput" placeholder="실측사이즈, 색상정보" name="product_sizeinfo"></textarea>
            <br><hr>
            <span><b>Size Option</b>&nbsp;&nbsp;&nbsp;&nbsp; & &nbsp;&nbsp;&nbsp;&nbsp;<b>CategoryOption</b></span><br /><br />
	            <select name="product_size" id="selectSize" style="width: 160px;" required>
		            <option value="">선택안함</option>
		            <option value="S">S</option>
		            <option value="M">M</option>
		            <option value="L">L</option>
	            </select>
	            <select name="product_category" id="selectCategory" style="width: 160px;" required>
		            <option value="">선택안함</option>
		            <option value="1">Top</option>
		            <option value="2">Bottom</option>
		            <option value="3">Shoes</option>
		            <option value="4">Hat</option>
		            <option value="5">Bag</option>
	            </select>
            <br><hr/><br>
            <button id="btn" style="margin-left: 5px;">등록하기</button>
            <br><br>
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