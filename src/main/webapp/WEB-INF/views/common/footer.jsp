<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css">


	<footer class="footer">
        <div class="wrapper">
            <img src="${pageContext.request.contextPath }/resources/images/footerlogo.png" alt="풋터이미지" id="logo_footer">
        
            <div class="footer_contents">

                <div class="content">
                    <div class="title">
                        <h3>OOTD</h3>
                    </div>
                    
                    <div class="company">
                        <p>
                            주식회사 : OOTD 서울특별시 강남구 테헤란로14길 6 남도빌딩 <br>
                            대표 : 박건형 <br>
                            사업자 등록번호 : 822-14-22931 <br>
                            통신판매업신고 : 2021-서울강남-0023 <br>
                            help@ootd.com <br>
                            copyright &copy; 2021 OOTD Inc
                        </p>
                    </div>
                

                    <div class="customer_center">
                        <h3>CUSTOMER CENTER</h3>
                        <h3>010-4444-5555</h3>
                    </div>

                    <div class="officeHour">
                        <p>
                            평일 오전 9시 - 오후 6시 <br>
                            점심시간 오후 12시 - 14시 <br>
                            주말, 공휴일 휴무
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <script>
    $("#logo_footer").on("click",function(){
		location.href = "${pageContext.request.contextPath}/product/ending.do";
		});
    </script>
    