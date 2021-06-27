<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html>
	<head>
	    <meta charset="UTF-8">
	    <title>OOTD - 마이페이지(브랜드)</title>
	    <script src="${pageContext.request.contextPath }/resources/asset/js/jquery-3.6.0.min.js"></script>
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/myPage_Info.css">
	    <c:import url="../common/styler.jsp"/>
	</head>
<body>

	<!-- HEADER IMPORT -->
	<c:import url="../common/header.jsp"/>

	<div class="container-myPage">
        <div class="body-title">MY PAGE</div>
       
        <!-- 좌측 aside 메뉴 (BRAND)-->
        <%@ include file="myPage_Brand_Menu.jsp" %>
     
        <section class="main">
            <div class="wrap-section">
                <div class="table-title">브랜드 정보</div>
                <table class="member-info">
                    <tbody>
                        <tr class="id">
                            <td>아이디</td>
                            <td>${member.member_id}</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr class="password">
                            <td>비밀번호</td>
                            <td colspan="2"><input type="hidden" value="${member.member_pw}">*********</td>
                            <td>
                                <button class="modify-btn" id="update-password">비밀번호 변경</button>
                            </td>
                        </tr>
                        <tr class="update-password" style="display: none">

                            <td colspan="4">
                                <form action="${pageContext.request.contextPath}/myPage/myPage_Brand_Info_pwUpdate.mp" method="post">
                                    <div class='passowrd-update-area'>
                                        <div class="input">
                                            <label for="password">현재 비밀번호</label>
                                            <input type="password" name="password" id="password">
                                        </div>
                                        <div class="input">
                                            <label for="new-password">새 비밀번호</label>
                                            <input type="password" class="pw" name="new_password" id="new_password">
                                        </div>          
                                        <div class="input">
                                            <label for="new-password-confirm">새 비밀번호 확인</label>
                                            <input type="password" class="pw" name="new_password_confirm" id="new_password_confirm">
                                              <span id="alert-success" style="display: inline-block; color: #6e6e6e;">&nbsp;비밀번호가 일치합니다.</span>
    										  <span id="alert-danger" style="display: inline-block;  color: #FF5A5A;">&nbsp;비밀번호가 일치하지 않습니다.</span>
                                        </div>
                                        <div class="btn-group">
                                            <input type="submit" class="submit1" value="확인">
                                            <input type="reset" id="reset-password" value="취소">
                                        </div>
                                    </div>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td>브랜드명</td>
                            <td>${member.brand_name}</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr class='email'>
                            <td>대표 이메일</td>
                            <td colspan="2">${member.email}</td>
                            <td>
                                <button id="update-email">이메일 변경</button>
                            </td>
                        </tr>
                        <tr class="update-email" style="display: none">

                            <td colspan="4">
                                <form action="${pageContext.request.contextPath}/myPage/myPage_Brand_Info_emUpdate.mp" method="post">
                                    <div class='email-update-area'>
                                        <div class="input">
                                            <label for="email">변경 이메일 주소</label>
                                            <input type="email" name="email" id="email"
                                                placeholder="변경 이메일 주소 입력(example@ootd.com)">
                                        </div>

                                        <div class="btn-group">
                                            <input type="submit" value="확인">
                                            <input type="reset" id="reset-email" value="취소">
                                        </div>
                                    </div>
                                </form>
                            </td>
                        </tr>
                        <tr class="phone">
                            <td>대표전화</td>
                            <td colspan="2">${member.phone}</td>
                            <td>
                                <button id="update-phone">전화번호 변경</button>
                            </td>
                        </tr>
                        <tr class="update-phone" style="display: none">
                            <td colspan="4">
                                <form action="${pageContext.request.contextPath}/myPage/myPage_Brand_Info_phUpdate.mp" method="post">
                                    <div class='phone-update-area'>
                                        <div class="input">
                                            <label for="phone">변경 번호</label>
                                            <input type="text" name="phone" id="phone"
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
                        <tr class="account">
                            <td>계좌번호</td>
                            <td>${member.bank_code}</td>
                            <td>${member.account_number}</td>
                            <td>
                                <button id="update-account">계좌번호 변경</button>
                            </td>
                        </tr>
                        <tr class="update-account" style="display: none">

                            <td colspan="4">
                                <form action="${pageContext.request.contextPath}/myPage/myPage_Brand_Info_accountUpdate.mp" method="post">
                                    <div class='account-update-area'>
                                        <div class="input">
                                            <label for="account">변경 계좌번호</label>

                                            <select class="select-bank" name="bank_code">
                                                 <option value="NH">농협</option>
				                                 <option value="KB">KB</option>
				                                 <option value="SH">신한</option>
				                                 <option value="UR">우리</option>
				                                 <option value="CH">축협</option>
				                                 <option value="SH">수협</option>
				                                 <option value="IBK">IBK</option>
                                            </select>       

                                            <input type="text" name="account_number" id="account"
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

    $('#update-account').on('click', function () {
        $('.update-account').show()
        $('.account').hide()
    })

    $('#reset-account').on('click', function () {
        $('.update-account').hide()
        $('.account').show()
    })
   
   	$(function(){
   		$('#alert-success').hide();
   		$('#alert-danger').hide();
   		$('.pw').keyup(function(){
   			var pwd1 = $('#new_password').val();
   	   		var pwd2 = $('#new_password_confirm').val();
   	   		console.log(pwd1);
   	   		console.log(pwd2);
   			if(pwd1 != "" || pwd2 != ""){
   				if(pwd1 == pwd2){
   					$('#alert-success').show();
   					$('#alert-danger').hide();
   					$('.submit1').removeAttr('disabled');
   				} else {
   					$('#alert-success').hide();
   					$('#alert-danger').show();
   					$('.submit1').attr('disabled', 'disabled');
   				}
   			}
   		});   		
   		
   	});
   	
   		
   	

</script>

</html>