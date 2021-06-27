<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>OOTD - 마이페이지(개인)</title>
    <script src="${pageContext.request.contextPath }/resources/asset/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/myPage_Info.css">
    
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <c:import url="../common/styler.jsp"/>
</head>

<body>

	<!-- HEADER IMPORT -->
	<c:import url="../common/header.jsp"/>


    <div class="container-myPage">
        <div class="body-title">MY PAGE</div>
        
        <!-- 마이페이지 메뉴 (일반) -->
        <%@ include file="myPage_Menu.jsp" %> 
       
        <section class="main">
            <div class="wrap-section">
                <div class="table-title">회원 정보</div>
                <table class="member-info">
                    <tbody>
                        <tr class="id">
                            <td>아이디</td>
                            <td name="userID">${member.member_id }</td>
                            <td></td>
                            <td></td>
                        </tr>
                        
                        <tr class="password" style>
                            <td>비밀번호</td>
                            <td colspan="2">********</td>
                            <td>
                                <button class="modify-btn" id="update-password">비밀번호 변경</button>
                            </td>
                        </tr>
                        
                        <tr class="update-password" style="display: none">
                            <td colspan="4">
                                <form action="${pageContext.request.contextPath}/myPage/update_Password.do" method="post">
                                    <div class='passowrd-update-area'>
                                        <div class="input">
                                            <label for="password">현재 비밀번호</label>
                                            <input type="password" name="password" id="password">
                                        </div>
                                        <div class="input">
                                            <label for="new-password">새 비밀번호</label>
                                            <input type="password" name="new_password" id="new-password">
                                        </div>
                                        <div class="input">
                                            <label for="new-password-confirm">새 비밀번호 확인</label>
                                            <input type="password" name="confirm_password" id="new-password-confirm">
                                        </div>
                                        <div class="btn-group">
                                            <input type="submit" value="확인">
                                            <input type="reset" id="reset-password" value="취소">
                                        </div>
                                    </div>
                                </form>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>이름</td>
                            <td colspan="3">${ member.member_name }</td>
                        </tr>
                        
                        <tr class='email'>
                            <td>이메일</td>
                            <td colspan="2">${member.email }</td>
                            <td>
                                <button type="button" id="update-email" >이메일 변경</button>
                            </td>
                        </tr>
                        
                        <tr class="update-email" style="display: none">

                            <td colspan="4">
                                <form action="${pageContext.request.contextPath}/myPage/update_Email.do" method="POST">
                                    <div class='email-update-area'>
                                        <div class="input">
                                            <label for="email">변경 이메일 주소</label>
                                            <input type="email" name="update_email" id="email" placeholder="변경 이메일 주소 입력(example@ootd.com)">
                                        </div>

                                        <div class="btn-group">
                                            <input type="submit" value="확인" id="submit_phone">
                                            <input type="reset" id="reset-email" value="취소">
                                        </div>
                                    </div>
                                </form>
                            </td>
                        </tr>
                        
                        <tr class="phone">
                            <td>휴대전화</td>
                            <td colspan="2">${member.phone }</td>
                            <td>
                                <button id="update-phone">휴대전화 변경</button>
                            </td>
                        </tr>
                        
                        <tr class="update-phone" style="display: none">
                            <td colspan="4">
                                <form action="${pageContext.request.contextPath}/myPage/update_Phone.do" method="POST">
                                    <div class='phone-update-area'>
                                        <div class="input">
                                            <label for="phone">휴대전화 번호</label>
                                            <input type="text" name="update_phone" id="phone"
                                                placeholder="휴대전화 번호 입력( ' - ' 포함)">
                                        </div>
                                        <div class="btn-group">
                                            <input type="submit" value="확인">
                                            <input type="reset" id="reset-phone" value="취소">
                                        </div>
                                    </div>
                                </form>
                            </td>
                        </tr>
                        
                        <tr class=address>
                        	<td>배송지</td>
                        	<td colspan="2">
                        		<c:forEach var="address" items="${member.address}">
                        			${address }
                        		</c:forEach>
                        	</td>
                        	<td>
                        		<button id="update-address">배송지 변경</button>
                        	</td>
                        </tr>
                        
                       	<tr class="update-address" style="display: none">
                       		<td colspan="4">
                       			<form action="${pageContext.request.contextPath }/myPage/updateAddress.do" method="POST">
                       				<div class="address-update-area">
                       					<div class="input">
                       						<label for="address">배송지 주소</label>
                       						<span>                       						
	                       						<input type="text" name="update_address" id="address1" placeholder="주소 검색 버튼을 이용해주세요." readonly/>
	                       						&nbsp;
	                       						<button type="button" value="주소검색" onclick="addressSearch();">주소검색</button>
                       						</span>
                       						<br>
                       						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       						<input type="text" name="update_detail_address" id="address2" placeholder="상세주소를 입력해주세요."/>
                       					</div>
                       					<div class="btn-group">
                       						<input type="submit" value="확인"/>
                       						<input type="reset" id="reset-address" value="취소"/>
                       					</div>                       					
                       				</div>
                       			</form>
                       		</td>
                       	</tr>
                        
                        <tr class="account">
                            <td>계좌번호</td>
                            <td id="bank_code">${member.bank_code }</td>
                            <td>${member.account_number }</td>
                            <td>
                                <button id="update-account">계좌번호 변경</button>
                            </td>
                        </tr>
                        
                        <tr class="update-account" style="display: none">

                            <td colspan="4">
                                <form action="${pageContext.request.contextPath }/myPage/updateBank.do" method="POST">
                                    <div class='account-update-area'>
                                        <div class="input">
                                            <label for="account">변경 계좌번호</label>

                                            <select class="select-bank" name="bank_name">
                                                <option value="KB">국민은행</option>
                                                <option value="SH">신한은행</option>
                                                <option value="NH">농협</option>
                                                <option value="WR">우리은행</option>
                                                <option value="CH">축협</option>
                                                <option value="SU">수협</option>
                                                <option value="IBK">IBK</option>
                                            </select>


                                            <input type="text" name="account" id="account"
                                                placeholder="계좌번호 입력( ' - ' 포함)">

                                            <div class="btn-group">
                                                <input type="submit" value="확인">
                                                <input type="reset" id="reset-account" value="취소">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>

        </section>
    </div>
    
    <!-- FOOTER IMPORT -->
   	<%@ include file="../common/footer.jsp" %>
   	


</body>
<script>
    $('#update-password').on('click', function () {
        $('.update-password').show()
        $('.password').hide()
    })

    $('#reset-password').on('click', function () {
        $('.update-password').hide()
        $('.password').show()
    })

    $('#update-email').on('click', function () {
        $('.update-email').show()
        $('.email').hide()
    })

    $('#reset-email').on('click', function () {
        $('.update-email').hide()
        $('.email').show()
    })

    $('#update-phone').on('click', function () {
        $('.update-phone').show()
        $('.phone').hide()
    })

    $('#reset-phone').on('click', function () {
        $('.update-phone').hide()
        $('.phone').show()
    })
    
    $('#update-address').on('click', function() {
    	$('.update-address').show();
    	$('.address').hide();
    })
    
    $('#reset-address').on('click', function(){
    	$('.update-address').hide();
    	$('.address').show();
    })

    $('#update-account').on('click', function () {
        $('.update-account').show()
        $('.account').hide()
    })

    $('#reset-account').on('click', function () {
        $('.update-account').hide()
        $('.account').show()
    })
	
    /* 주소 입력 */
        // 참조 API : http://postcode.map.daum.net/guide
    function addressSearch() {
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
                $('#zipCode').val(data.zonecode); //5자리 새우편번호 사용
                
                $('#address1').val(fullAddr);

                // 커서를 상세주소 필드로 이동한다.
                $('#address2').focus();
            }
        }).open();
    };
    
</script>

</html>