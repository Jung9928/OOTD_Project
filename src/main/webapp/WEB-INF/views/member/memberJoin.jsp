<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width" initial-scale=1.0>
    <title>개인 회원가입</title>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <!-- 다음 주소 api -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

    <!-- css 링크 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/brandJoin.css" />

</head>
<body>
<c:if test="${ ! empty member_id }">
	<script>
		$(function() {
			alert("해당 계정으로 내일의 옷에 가입해주세요. 가입 후엔 카카오 or 구글 계정으로 생성한 아이디를 로그인하실 수 있습니다.");
		});
	</script>
</c:if>

  <form id="memberJoinFrm" action="memberJoinEnd.do" method="post">
    <!-- wrapper -->
    <div id="wrapper">
        <h1 style="text-align: center;">JOIN(개인)</h1>
        
        <c:if test="${ empty member_id }">
        <!-- 브랜드 / 일반회원 가입 버튼 -->
        <div style="text-align: center; margin-top: 10px; margin-bottom: 15px;">
            <button type="button" id="moveBrand" class="btn btn-secondary" onclick="moveBrandJoinPage()">브랜드 가입</button>
            <button type="button" id="moveMember" class="btn btn-secondary" onclick="moveMemberJoinPage()">일반회원 가입</button>
        </div>
		</c:if>
		
        <!-- content-->
        <div id="content">
            <input type="checkbox" id="brand" style="display:none;" name="login_type" value="1" onclick="return false;">
            <input type="checkbox" id="member" style="display:none;" name="login_type" value="2" checked="checked">
            <span style="float:right;">Required</span><span style="color: red; float:right;">*</span>
			
			<c:if test="${ ! empty member_id }">
			
            <input type="hidden" id="id" name="member_id" value="${ member_id }">
               
            <!-- NAME -->
            <div>
                <h3 class="join_title">
                  <span style="color: red;">*</span><label for="name">이름</label>
                </h3>
                <span class="box int_name">
                    <input type="text" id="name" name="member_name"class="int" maxlength="20" value="${ name }">
                </span>
                <span class="error_next_box"></span>
            </div>
            
            <!-- PW1 -->
            <input type="hidden" id="pswd1" name="member_pw" value="${ pass }">
            <input type="hidden" id="pswd2" value="${ pass }">
                
			</c:if>
			
			<c:if test="${ empty member_id }">
            <!-- ID -->
            <div>
                <h3 class="join_title">
                  <span style="color: red;">*</span><label for="id">아이디</label>
                </h3>
                <span class="box int_id">
                    <input type="text" id="id" name="member_id" class="int" maxlength="20" placeholder="아이디 입력">
                </span>
                <button type="button" class="btn btn-secondary btn-sm" id="checkIdDuplicate" value="0">중복 확인</button>
                <span class="error_next_box"></span>
            </div>
            
            <!-- NAME -->
            <div>
                <h3 class="join_title">
                  <span style="color: red;">*</span><label for="name">이름</label>
                </h3>
                <span class="box int_name">
                    <input type="text" id="name" name="member_name"class="int" maxlength="20" placeholder="이름">
                </span>
                <span class="error_next_box"></span>
            </div>
            
			
			
			
            <!-- PW1 -->
            <div>
                <h3 class="join_title">
                  <span style="color: red;">*</span><label for="pswd1">비밀번호</label>
                </h3>
                <span class="box int_pass">
                    <input type="password" id="pswd1" name="member_pw" class="int" maxlength="25" placeholder="비밀번호 8자 이상">
                    <span id="alertTxt">사용불가</span>
                    <img src="${pageContext.request.contextPath }/resources/images/m_icon_pass.png" id="pswd1_img1" class="pswdImg">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- PW2 -->
            <div>
                <h3 class="join_title">
                  <span style="color: red;">*</span><label for="pswd2">비밀번호 확인</label>
                </h3>
                <span class="box int_pass_check">
                    <input type="password" id="pswd2" class="int" maxlength="25" placeholder="비밀번호 확인">
                    <img src="${pageContext.request.contextPath }/resources/images/m_icon_check_disable.png" id="pswd2_img1" class="pswdImg">
                </span>
                <span class="error_next_box"></span>
            </div>
			</c:if>
			
            <!-- Nickname -->
            <div>
                <h3 class="join_title">
                  <span style="color: red;">*</span><label for="nickname">닉네임</label>
                </h3>
                <span class="box int_nickName">
                    <input type="text" id="nick" name="member_nickname" class="int" maxlength="20" placeholder="닉네임 입력">
                </span>
                <span class="error_next_box"></span>
            </div>
			
			<c:if test="${ ! empty member_id }">
			<div>
                <h3 class="join_title">
                  <span style="color: red;">*</span><label for="email">이메일</label>
                </h3>
                <span class="box int_email">
                    <input type="text" id="email" name="email"class="int" maxlength="100" value="${ email }">
                </span>
                <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
            </div>
			</c:if>
			
			<c:if test="${ empty member_id }">
            <!-- EMAIL -->
            <div>
                <h3 class="join_title">
                  <span style="color: red;">*</span><label for="email">이메일</label>
                </h3>
                <span class="box int_email">
                    <input type="text" id="email" name="email"class="int" maxlength="100" placeholder="user@example.com">
                </span>
                <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
            </div>
			</c:if>
            <!-- PHONE -->
            <div>
                <h3 class="join_title">
                  <span style="color: red;">*</span><label for="phoneNo">전화번호</label>
                </h3>
                <span class="box int_mobile">
                    <input type="tel" id="mobile" name="phone"class="int" maxlength="16" placeholder="숫자만 입력">
                </span>

                <span class="error_next_box"></span>    
            </div>

            <!-- ADDRESS -->
            <div>
                <h3 class="join_title">
                  <span style="color: red;">*</span><label for="address">주소</label>
                </h3>
                <span class="box int_addr1">
                    <input type="text" id="address1" name="address" class="int" placeholder="주소 검색 버튼을 이용해 주세요." readonly>
                </span>

                <span class="error_next_box"></span>    
                <button type="button" class="btn btn-secondary btn-sm" onclick="addrSearch();">주소 검색</button>
            </div>

            <!-- ADDRESS detail -->
            <div>
                <h3 class="join_title">
                  <span style="color: red;">*</span><label for="addressDetail">상세 주소</label>
                </h3>
                <span class="box int_addr2">
                    <input type="text" id="address2" name="address" class="int" placeholder="상세 주소 입력">
                </span>

                <span class="error_next_box"></span>    
            </div>

            <!-- 계좌 번호 -->
            <div>
                <h3 class="account">
                  <label for="account">계좌번호</label>
                </h3>

                <div id="account_wrap">
                    <!-- 계좌 선택 -->
                    <div id="account_bank">
                        <span class="box">
                            <select id="bank" class="sel" name="bank_code">
                                <option selected value="">은행선택</option>
                                <option value="NH">농협</option>
                                <option value="KB">KB</option>
                                <option value="SH">신한</option>
                                <option value="UR">우리</option>
                                <option value="CH">축협</option>
                                <option value="SH">수협</option>
                                <option value="IBK">IBK</option>
                            </select>
                        </span>
                    </div>

                    <!-- 계좌 번호 입력 -->
                    <div id="account_number">
                        <span class="box">
                            <input type="text" id="acNumber" name="account_number" class="int" placeholder="000-000-000000">
                        </span>
                    </div>

                </div>
                <span class="error_next_box"></span>    
            </div>

            <!-- JOIN BTN-->
            <div class="joinOrCancel">
                <button type="button" id="joinBtn" class="btn btn-secondary btn-sm" onclick="check_form();">가입하기</button>
                <button type="button" id="cancelBtn" class="btn btn-secondary btn-sm">작성 취소</button>
            </div>
            
            <br />
            

        </div> 
        <!-- content-->

    </div> 
    <!-- wrapper -->
  </form>
  
  <br /><br />
  
    <script>
        /*변수 선언*/
        var id = document.querySelector('#id');
		var nick = document.querySelector('#nick');
        var pw1 = document.querySelector('#pswd1');
        var pwMsg = document.querySelector('#alertTxt');
        var pwImg1 = document.querySelector('#pswd1_img1');
        var pw2 = document.querySelector('#pswd2');
        var pwImg2 = document.querySelector('#pswd2_img1');
        var pwMsgArea = document.querySelector('.int_pass');
        var userName = document.querySelector('#name');
        //var yy = document.querySelector('#yy');
        //var mm = document.querySelector('#mm');
        //var dd = document.querySelector('#dd');
        //var gender = document.querySelector('#gender');
        var email = document.querySelector('#email');
        var mobile = document.querySelector('#mobile');
        var addr1 = document.querySelector('#address1');
        var addr2 = document.querySelector('#address2');
        var account = document.querySelector('#account_number');
        var error = document.querySelectorAll('.error_next_box');
        
        /*이벤트 핸들러 연결*/
        id.addEventListener("focusout", checkId);
        nick.addEventListener("focusout", checkNickname);
        pw1.addEventListener("focusout", checkPw);
        pw2.addEventListener("focusout", comparePw);
        userName.addEventListener("focusout", checkName);
        //yy.addEventListener("focusout", isBirthCompleted);
        //mm.addEventListener("focusout", isBirthCompleted);
        //dd.addEventListener("focusout", isBirthCompleted);
        /*
        gender.addEventListener("focusout", function() {
            if(gender.value === "성별") {
                error[5].style.display = "block";
            } else {
                error[5].style.display = "none";
            }
        })
        */
        email.addEventListener("focusout", isEmailCorrect);
        mobile.addEventListener("focusout", checkPhoneNum);
        addr1.addEventListener("focusout", checkAddr1);
        addr2.addEventListener("focusout", checkAddr2);
        account.addEventListener("focusout", checkAccount);
        function checkId() {
            var idPattern = /[a-zA-Z0-9_-]{5,20}/;
            if(id.value === "") {
                error[0].innerHTML = "필수 정보입니다.";
                error[0].style.color = "#ff0000";
                error[0].style.display = "block";
            } else if(!idPattern.test(id.value)) {
                error[0].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
                error[0].style.color = "#ff0000";
                error[0].style.display = "block";
            } else {
                error[0].innerHTML = "사용 가능한 아이디 형식입니다.";
                error[0].style.color = "#08A600";
                error[0].style.display = "block";
            }
        }
        function checkName() {
            var namePattern = /[a-zA-Z가-힣]/;
            if(userName.value === "") {
                error[1].innerHTML = "필수 정보입니다.";
                error[1].style.color = "#ff0000";
                error[1].style.display = "block";
            } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
                error[1].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
                error[1].style.color = "#ff0000";
                error[1].style.display = "block";
            } else {
            	error[1].style.display = "none";
            	}
        }
            
        function checkNickname() {
            var idPattern = /[a-zA-Z0-9_-]{5,20}/;
            if(nick.value === "") {
                error[4].innerHTML = "필수 정보입니다.";
                error[4].style.color = "#ff0000";
                error[4].style.display = "block";
            } else if(!idPattern.test(nick.value)) {
                error[4].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
                error[4].style.color = "#ff0000";
                error[4].style.display = "block";
            } else {
                error[4].innerHTML = "사용 가능한 닉네임 형식입니다.";
                error[4].style.color = "#08A600";
                error[4].style.display = "block";
            }
        }
        
        function checkPw() {
            var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
            if(pw1.value === "") {
                error[2].innerHTML = "필수 정보입니다.";
                error[2].style.color = "#ff0000";
                error[2].style.display = "block";
            } else if(!pwPattern.test(pw1.value)) {
                error[2].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
                pwMsg.innerHTML = "사용불가";
                pwMsg.style.color = "#ff0000";
                pwMsgArea.style.paddingRight = "93px";
                error[2].style.display = "block";
                
                pwMsg.style.display = "block";
                pwImg1.src = "${pageContext.request.contextPath }/resources/images/m_icon_not_use.png";
            } else {
                error[2].style.display = "none";
                pwMsg.innerHTML = "안전";
                pwMsg.style.display = "block";
                pwMsg.style.color = "#03c75a";
                pwImg1.src = "${pageContext.request.contextPath }/resources/images/m_icon_safe.png";
            }
        }
        function comparePw() {
            if(pw2.value === pw1.value && pw2.value != "") {
                pwImg2.src = "${pageContext.request.contextPath }/resources/images/m_icon_check_enable.png";
                error[3].style.display = "none";
            } else if(pw2.value !== pw1.value) {
                pwImg2.src = "${pageContext.request.contextPath }/resources/images/m_icon_check_disable.png";
                error[3].innerHTML = "비밀번호가 일치하지 않습니다.";
                error[3].style.color = "#ff0000";
                error[3].style.display = "block";
            } 
            if(pw2.value === "") {
                error[3].innerHTML = "필수 정보입니다.";
                error[3].style.color = "#ff0000";
                error[3].style.display = "block";
            }
        }

        /*
        function isBirthCompleted() {
            var yearPattern = /[0-9]{4}/;
            if(!yearPattern.test(yy.value)) {
                error[4].innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
                error[4].style.display = "block";
            } else {
                isMonthSelected();
            }
            function isMonthSelected() {
                if(mm.value === "월") {
                    error[4].innerHTML = "태어난 월을 선택하세요.";
                } else {
                    isDateCompleted();
                }
            }
            function isDateCompleted() {
                if(dd.value === "") {
                    error[4].innerHTML = "태어난 일(날짜) 2자리를 정확하게 입력하세요.";
                } else {
                    isBirthRight();
                }
            }
        }
        */
        function isEmailCorrect() {
            var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;
            if(email.value === ""){ 
                error[5].style.display = "none"; 
            } else if(!emailPattern.test(email.value)) {
                error[5].style.display = "block";
            } else {
                error[5].style.display = "none"; 
            }
        }
        function checkPhoneNum() {
            var isPhoneNum = /([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})/;
            if(mobile.value === "") {
                error[6].innerHTML = "필수 정보입니다.";
                error[6].style.color = "#ff0000";
                error[6].style.display = "block";
            } else if(!isPhoneNum.test(mobile.value)) {
                error[6].innerHTML = "형식에 맞지 않는 번호입니다.";
                error[6].style.color = "#ff0000";
                error[6].style.display = "block";
            } else {
                error[6].style.display = "none";
            }
        }
        function checkAddr1() {
            if(address1.value === "") {
                error[7].innerHTML = "필수 정보입니다.";
                error[7].style.color = "#ff0000";
                error[7].style.display = "block";
            } else {
                error[7].style.display = "none";
            }
        }
        function checkAddr2() {
            var namePattern = /[a-zA-Z가-힣]/;
            if(address2.value === "") {
                error[8].innerHTML = "필수 정보입니다.";
                error[8].style.color = "#ff0000";
                error[8].style.display = "block";
            } else {
                error[8].style.display = "none";
            }
        }
        function checkAccount() {
            if(account.value === "") {
                error[9].innerHTML = "필수 정보입니다.";
                error[9].style.color = "#ff0000";
                error[9].style.display = "block";
            } else {
                error[9].style.display = "none";
            }
        }
          
        function moveBrandJoinPage() {
        	location.href='${pageContext.request.contextPath}/member/brandJoin.do';
        }
        
        function moveMemberJoinPage() {
        	location.href='${pageContext.request.contextPath}/member/memberJoin.do';
        }
        /* 주소 입력 */
        // 참조 API : http://postcode.map.daum.net/guide
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
                    $('#zipCode').val(data.zonecode); //5자리 새우편번호 사용
                    
                    $('#address1').val(fullAddr);
                    // 커서를 상세주소 필드로 이동한다.
                    $('#address2').focus();
                }
            }).open();
        };
        
        // 아이디 중복 확인
        $('#checkIdDuplicate').on('click', function() {
        	$.ajax({
            	url : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
            	data : {id : $('#id').val()},
            	type : 'post',
            	success: function(data) {
            		console.log(data);
            		
            		if(data == "true") {	
            			alert("사용 가능한 아이디입니다.");
				    	var check = confirm("현재 아이디로 사용하시겠습니까?");
				    	
				    	// 확인버튼 클릭 시, input창 잠김
						if(check == true)
							document.getElementById('id').readOnly = true;
						else {
							// 취소버튼 클릭 시, input창 잠기고 해당 input태그에 입력한 데이터 삭제
							document.getElementById('id').readOnly = false;
							$('#id').val('');
						}
				    	
            		} else {
            			alert("이미 사용 중인 아이디입니다.");
						$('#id').val('');
            		}
            	}, error : function() {
            		console.log("전송 실패!");
            	}
            });
        });
        
        // form 데이터 유효성 검사 (form 데이터 모두 입력되었는지 확인)
        function check_form() {
        	var id = document.getElementById("id");
        	var nick = document.getElementById("nick");
        	var pwd1 = document.getElementById("pswd1");
        	var pwd2 = document.getElementById("pswd2");
        	var name = document.getElementById("name");
        	var email = document.getElementById("email");
        	var phone = document.getElementById("mobile");
        	var address1 = document.getElementById("address1");
        	var address2 = document.getElementById("address2");
        	
        	if(id.value=="") {
        		alert("아이디가 입력되었는지 확인해주세요.");
        		id.focus();
            	return false;
        	}		
        	if(nick.value=="") {
        			
        		alert("닉네임이 입력되었는지 확인해주세요.");
        		nick.focus();
            	return false;
        	}		
        	if(pwd1.value=="") {
        			
        		alert("비밀번호란이 입력되었는지 확인해주세요.");
        		pwd1.focus();
            	return false;
        	}		
        	if(pwd2.value=="") {
        			
        		alert("비밀번호 확인란이 입력되었는지 확인해주세요.");
        		pwd2.focus();
            	return false;
        	}		
        	if(name.value=="") {
        			
        		alert("이름이 입력되었는지 확인해주세요.");
        		name.focus();
            	return false;
        	}		
        	if(email.value=="") {
        			
        		alert("이메일이 입력되었는지 확인해주세요.");
        		email.focus();
            	return false;
        	}		
        	if(phone.value=="") {
        			
        		alert("휴대폰 번호가 입력되었는지 확인해주세요.");
        		phone.focus();
            	return false;
        	}		
        	if(address1.value==""){
        			
        		alert("주소가 입력되었는지 확인해주세요.");
        		address1.focus();
            	return false;
        			
        	} 
        	if(address2.value=="") {
        		alert("상세주소가 입력되었는지 확인해주세요.");
    			address2.focus();
        		return false;
        	}
        	document.getElementById("memberJoinFrm").submit();
        }
        
        
    </script>
</body>
</html>