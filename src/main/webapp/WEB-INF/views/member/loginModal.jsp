<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

    <%-- <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script> --%>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    <!-- css 링크 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/loginModal.css" />

    <div class="container">
       
       <c:if test="${ !empty member }">
       
       <!-- 내 정보 Modal -->
       <div class="modal modal-center fade" id="loginModal" role="dialog" data-backdrop="static" data-keyboard="false">
          <div class="modal-dialog"> 
          
            <!-- Modal 컨텐츠 시작 -->
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                
                <c:if test="${ member.login_type == 1 }">
                <h4 id="modal-title">${ member.brand_name }</h4> 
                </c:if>
                
                <c:if test="${ member.login_type == 2 }">
                <h4 id="modal-title">${ member.member_name }</h4> 
                </c:if>
                
                <!-- Modal 내 ID/PW 입력 및 로그인/ 가입 버튼 시작 -->
                <div class="modal-body" style="padding:40px 50px;">
                    <div class="join-btn-group">
                        <button type="button" id="join-btn" class="btn btn-link" onclick="goMyPage()">MYPAGE</button>
                            | 
				    	<button type="button" id="logout-btn" class="btn btn-link" onclick="logout()" style="color: black; font-size: 20px;">LOGOUT</button>
					</div>
                </div> 
                <!-- 내 정보 모달 끝 -->

            </div> 
            <!-- Modal 컨텐츠 끝 -->

         </div>
        </div> 
       
       </c:if>
       
      <c:if test="${ empty member }">
        <!-- 로그인 Modal -->
        <div class="modal modal-center fade" id="loginModal" role="dialog" data-backdrop="static" data-keyboard="false">
          <div class="modal-dialog">
          
            <!-- Modal 컨텐츠 시작 -->
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 id="modal-title">LOGIN</h4>
                
                <!-- Modal 내 ID/PW 입력 및 로그인/ 가입 버튼 시작 -->
                <div class="modal-body" style="padding:40px 50px;">
                    <form role="form" action="member/memberLogin.do" method="post">
                        <div class="form-group">
                            <label for="usrname"> ID</label>
                            <input type="text" class="form-control" id="member_id" name="member_id" placeholder="Enter ID">
                        </div>
                        <div class="form-group">
                            <label for="psw"> Password</label>
                            <input type="password" class="form-control" id="member_pw" name="member_pw"placeholder="Enter password">
                        </div>

                        <div class="join-btn-group">
                            <button type="button" id="join-btn" class="btn btn-link" onclick="goJoinPage()">JOIN</button>
                            |
                            <button type="submit" id="login-btn" class="btn btn-link" >LOGIN</button>
                        </div>
                    </form>
                </div>
                <!-- Modal 내 ID/PW 입력 및 로그인/ 가입 버튼 끝 -->
        

              <!-- 모달 내 메신저 ID 로그인 디자인 시작 -->
              <div id = "login-service">
              	<div id="kakao-box">
                    <img id="icon-img" src="https://t1.daumcdn.net/cfile/tistory/992DA6415B743DB62B">
                    <p id="kakao_text">로그인</p>
                </div>
                <!-- <div id="google-box">
                    <img id="icon-img" src="https://t1.daumcdn.net/cfile/tistory/99D8AF415B743DB636">
                    구글로 로그인  -->
                    <div class="g-signin2" data-onsuccess="onSignIn"></div>
                <!-- </div> -->
                <%-- <div id="kakao-box">
                    <!-- <img id="icon-img" src="https://t1.daumcdn.net/cfile/tistory/992DA6415B743DB62B"> -->
                    <img id="icon-img kakao" src="${pageContext.request.contextPath }/resources/images/kakao_login_medium_narrow.png" alt="" />
                </div>
                <div id="google-box">
                	<img id="icon-img google" src="${pageContext.request.contextPath }/resources/images/btn_google_signin_light_normal_web.png" alt="" />
                    <!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->
                </div> --%>
            </div>
            <!-- 메신저 ID 로그인 디자인 끝 -->

            <!-- modal의 footer 시작 -->
            <div class="modal-footer">
                <div class="modal-footer-child">
                    Forgot<button type="button" id="forgot-id" class="btn btn-link" data-toggle="modal" data-target="#findIdModal">ID?</button>
                    Forgot<button type="button" id="forgot-pw" class="btn btn-link" data-toggle="modal" data-target="#findPwModal">Password?</button>
                </div>
            </div>
            <!-- modal의 footer 끝 -->

            </div>
            <!-- Modal 컨텐츠 끝 -->

          </div>
        </div> 
        
        </c:if>
        
      </div>

      <!-- 아이디 찾기 Modal -->
      <div class="modal modal-center fade" id="findIdModal" role="dialog">
        <div class="modal-dialog">
      
            <!-- Modal content-->
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3>아이디 찾기</h3>

                <div class="modal-body" style="padding:40px 50px;">
                    <form role="form" action="member/sendIdMail.do" method="post">
                    	
                    	<label for="brand" style="margin-top:5%">
                    		<input type="checkbox" name="login_type" value="1" checked="true">업체 &nbsp;
                    	</label>
            			<input type="checkbox" name="login_type" value="2">개인
                    	<br /><br />
                        <label for="username">이름 / 브랜드 이름</label>
                        <div class="input-group">
                            <input type="text" name="member_name" class="form-control" id="usrname" placeholder="Enter name">
                        </div>

                        <label for="psw" style="margin-top:5%">이메일</label>
                        <div class="input-group">
                            <input type="text" name="email" class="form-control" id="psw" placeholder="Enter email">
                        </div>
                        <button type="submit" class="btn btn-secondary btn-lg btn-block" style="margin-top: 25%;">아이디 찾기</button>
                    </form>
                </div>
            </div>
        </div>
    </div> 
    
    

      <!-- 비밀번호 찾기 Modal -->
      <div class="modal modal-center fade" id="findPwModal" role="dialog">
        <div class="modal-dialog">
      
            <!-- Modal content-->
            <div class="modal-content">

                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3>비밀번호 찾기</h3>

                <div class="modal-body" style="padding:40px 50px;">
                    <form role="form" action="member/sendPwMail.do" method="post">
                    	
                    	
                    	<label for="brand" style="margin-top:5%">
                    		<input type="checkbox" name="login_type" value="1" checked="true">업체 &nbsp;
                    	</label>
            			<input type="checkbox" name="login_type" value="2">개인
                    	<br /><br />
                        
                        <label for="username">아이디</label>
                        <div class="input-group">
                            <input type="text" name="member_id" class="form-control" id="usrname" placeholder="Enter ID">
                        </div>

                        <label for="username" style="margin-top:5%">이름 / 브랜드 이름</label>
                        <div class="input-group">
                            <input type="text" name="member_name" class="form-control" id="usrname" placeholder="Enter name">
                        </div>

                        <label for="psw" style="margin-top:5%">이메일</label>
                        <div class="input-group">
                            <input type="text" name="email" class="form-control" id="psw" placeholder="Enter email">
                        </div>
                        <button type="submit" class="btn btn-secondary btn-lg btn-block" style="margin-top: 10%;">비밀번호 찾기</button>
                    </form>
                </div>
            </div>
        </div>
    </div> 
    <script>
        /* 버튼 클릭 시, 모달 pop-up */
        $("#loginBtn").click(function(){
                $("#loginModal").modal();
          });

        /* 모달 밖의 영역 클릭 시, 모달이 닫히는 것을 방지 */
   		//   $('#loginModal').modal({backdrop: 'static', keyboard: false}) ;

        /* 모달 내 JOIN 버튼 클릭 시, 회원가입 페이지로 이동 */
        function goJoinPage() {
        	location.href='${pageContext.request.contextPath}/member/joinAccept.do';
        }
        
        function goMyPage() {
        	location.href="${pageContext.request.contextPath}/member/goMyPage.do"
        }
        
        function logout() {
        	location.href="${pageContext.request.contextPath}/member/logout.do"
        }

        
        /* componentDidMount() {
        	Kakao.init('1da952139d172c0ac2c48f4a3ba9ca34');
        } */
        
        var code = $('#kakaoCode').val();
        console.log(code);
        var tocken;
        
        $(function() {
        	Kakao.init('1da952139d172c0ac2c48f4a3ba9ca34');
        	// SDK 초기화 여부를 판단합니다.
            console.log(Kakao.isInitialized());
        	
        });
        
        $('#kakao-box').on('click', function() {
        	loginWithKakao();
        	
        });
        
        $('#google-box').on('click', function() {
        	onSignIn();
        }); 
        
        
        
        //카카오 로그인
        function loginWithKakao() {	
              
        	Kakao.Auth.login({
            	success: function (response) {
            	    Kakao.API.request({
            	        url: '/v2/user/me',
            	        success: function (response) {
            	        	console.log(response)
            	        	console.log(response.id)
            	        	console.log(response['kakao_account']['profile']['nickname'])
            	        	  
            	        	var id = response.id;
            	        	var name = response['kakao_account']['profile']['nickname'];
            	            var email = response['kakao_account']['email'];
            	        	  
            	            kakaoLogout();
            	        	  
            	        	$.ajax({
            	      			type: "POST",
            	      			url: "${pageContext.request.contextPath}/member/emailCheck.do",
            	      			data: { email : email }, 
            	      			success: function(data){
            	      				console.log(data);
            	      				console.log("Kakao email 검사 성공")
            	      				
            	      				
            	      				
            	      				if ( data == "" ) {
	      								location.href = '${pageContext.request.contextPath}/member/snsMemberJoin.do?member_id='+id+'&email='+email+'&name='+name;
	      							} else {
	      								
	      								if ( data == id ) {
	      									location.href = '${pageContext.request.contextPath}/member/snsLogin.do?member_id='+id;
	      								} else {
	      									alert("이미 해당 이메일로 가입되어 있는 계정이 존재합니다. 아이디 찾기를 이용해 내일의 옷 계정으로 로그인해주세요.");
	      								}
	      					
	      				}
            	      				
            	      			},
            	      			
            	      			error: function(){
            	      				alert('Kakao email 검사 실패');
            	      			}
            	      			
            	      		});
            	          },
            	          
            	          fail: function (error) {
            	            console.log(error)
            	          },
            	        })
            	      },
            	      fail: function (error) {
            	        console.log(error)
            	      },
            	    })
            	  
          }
        
        function kakaoLogout() {
            if (Kakao.Auth.getAccessToken()) {
              Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (response) {
                	console.log(response)
                },
                fail: function (error) {
                  console.log(error)
                },
              })
              Kakao.Auth.setAccessToken(undefined)
            }
          }  

      // google login 처음 실행하는 함수
          function init() {
        	gapi.load('auth2', function() { 
        		gapi.auth2.init();
        		options = new gapi.auth2.SigninOptionsBuilder();
        		options.setPrompt('select_account');
                // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
        		options.setScope('email profile openid https://www.googleapis.com/auth/userinfo.profile');
                // 인스턴스의 함수 호출 - element에 로그인 기능 추가
                // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
        		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
        	})
        } 

       
        // 구글구글구글구글
        function onSignIn(googleUser) {
        	 var profile = googleUser.getBasicProfile();
        	 console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
        	 console.log('Name: ' + profile.getName());
        	 console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
        	 var id = profile.getId();
        	 var name = profile.getName();
        	 var email = profile.getEmail();
        	 
        	 signOut();
        	 
        	 $.ajax({
       			type: "POST",
       			url: "${pageContext.request.contextPath}/member/emailCheck.do",
       			data: { email : email }, 
       			success: function(data){
       				console.log(data);
       				console.log("Google email 검사 성공");
       				
       				if ( data == "" ) {
       					location.href = '${pageContext.request.contextPath}/member/snsMemberJoin.do?member_id='+id+'&email='+email+'&name='+name;
       				} else {
       					if ( data == id ) {
       						location.href = '${pageContext.request.contextPath}/member/snsLogin.do?member_id='+id;
       						
       					} else {
       						alert("이미 해당 이메일로 가입되어 있는 계정이 존재합니다. 아이디 찾기를 이용해 내일의 옷 계정으로 로그인해주세요.");
       					}
       					
       				}
       				
       			},
       			
       			error: function(){
       				alert('Google email 검사 실패');
       			}
       			
       		});
        	 
        }
      
        
        function signOut() {
            var auth2 = gapi.auth2.getAuthInstance();
            auth2.signOut().then(function () {
              console.log('User signed out.');
            });
          }
        
        function onSignInFailure(t){		
        	console.log(t);
        }
        	
        
        
    </script>
