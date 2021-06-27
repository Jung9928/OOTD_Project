<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width" initial-scale=1.0>
    <title>가입 동의</title>

    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

    <!-- css 링크 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/joinAccept.css" />
</head>
<body>
    <form action="memberJoin.do" id="joinForm">
        <ul class="join_box">
            <li class="checkBox check01">
                <ul class="clearfix">
                    <li>이용약관, 개인정보 수집 및 이용,
                        위치정보 이용약관(선택), 프로모션 안내
                        메일 수신(선택)에 모두 동의합니다.</li>
                    <li class="checkAllBtn">
                        <input type="checkbox" name="chkAll" id="chkAll" class="chkAll">
                    </li>
                </ul>
            </li>
            <li class="checkBox check02">
                <ul class="clearfix">
                    <li>이용약관 동의(필수)</li>
                    <li class="checkBtn">
                        <input type="checkbox" name="chk1"> 
                    </li>
                </ul>
                <textarea name="" id="">여러분을 환영합니다.
OOTD 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 OOTD 서비스의 이용과 관련하여 OOTD 서비스를 제공하는 OOTD 주식회사(이하 ‘OOTD’)와 이를 이용하는 OOTD 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 OOTD 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
            </li>
            <li class="checkBox check03">
                <ul class="clearfix">
                    <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                    <li class="checkBtn">
                        <input type="checkbox" name="chk2">
                    </li>
                </ul>

                <textarea name="" id="">여러분을 환영합니다.
OOTD 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 OOTD 서비스의 이용과 관련하여 OOTD 서비스를 제공하는 OOTD 주식회사(이하 ‘OOTD’)와 이를 이용하는 OOTD 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 OOTD 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
            </li>
            <li class="checkBox check03">
                <ul class="clearfix">
                    <li>위치정보 이용약관 동의(선택)</li>
                    <li class="checkBtn">
                        <input type="checkbox" name="chk3">
                    </li>
                </ul>

                <textarea name="" id="">여러분을 환영합니다.
OOTD 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 OOTD 서비스의 이용과 관련하여 OOTD 서비스를 제공하는 OOTD 주식회사(이하 ‘OOTD’)와 이를 이용하는 OOTD 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 OOTD 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
            </li>
            <li class="checkBox check04">
                <ul class="clearfix">
                    <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                    <li class="checkBtn">
                        <input type="checkbox" name="chk4">
                    </li>
                </ul>

            </li>
        </ul>
        <ul class="footBtwrap clearfix">
            <li><button type="button" class="fpmgBt1">비동의</button></li>
            <li><button type="button" class="fpmgBt2" onclick="goJoinPage();">동의</button></li>
        </ul>
    </form>

    <script>
        // 동의 버튼 클릭 시, 체크 항목에 따른 기능 수행.
        function goJoinPage() {

            // 필수 버튼 모두 클릭 시, 가입 페이지로 이동
            if($("input:checkbox[name=chk1]").is(":checked") == true && $("input:checkbox[name=chk2]").is(":checked") == true) {
            	location.href='${pageContext.request.contextPath}/member/memberJoin.do';
            }
            // 아닐 시, 경고창 팝업
            else 
                alert('필수 항목에 체크하셔야 합니다.')
        }

        // 전체 체크 코드
        $('#chkAll').click(function() {
            var checked = $('#chkAll').is(':checked');

            // 체크할 시, 전체 체크
            if(checked)
                $('input:checkbox').prop('checked', true);
            // 체크 해제 시, 전체 체크 해제
            else
                $('input:checkbox').prop('checked', false);
        });

    </script>
</body>
</html>