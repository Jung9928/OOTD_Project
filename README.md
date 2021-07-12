# OOTD (브랜드&중고 의류 거래 서비스)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

### 프로젝트 목적
----
> 개인 간 중고 의류를 거래하는 것 뿐 아니라 브랜드 의류 상품 또한 거래하도록 하여 
브랜드와 개인 판매 의류 상품을 제공함으로써 구매자들에게 더 많은 종류의 의류를 거래할 수 있도록 하는 서비스 개발이 목적.


### 개발 일정
| 기간 | 진행 작업 |
| ------ | ------ |
| 2021.05.24 ~ 2021.05.28 | 프로젝트 기획 회의 |
| 2021.05.31 ~ 2021.06.04 | UI 시나리오 설계 |
| 2021.06.07 ~ 2021.06.11 | ERD 설계 및 DB 구축 |
| 2021.06.12 ~ 2021.06.22 | 프로젝트 구현 및 테스트 |


### 전체 기능
---------------------------------------
- 가입 기능 (회원가입&SNS회원가입 / 로그인&SNS로그인 / 로그아웃 / 새 비밀번호 설정 / 회원 정보 변경)
- 마이페이지 (회원 정보 수정 / 회원 탈퇴 / 찜한 목록 / 나의 구매 기록 / 주문&배송 현황 / 장바구니 / 등록한 상품 조회, 수정, 삭제)
- 브랜드 상품 판매 (브랜드 상품 CRUD / 가격 or 색상 or 상품명 별 정렬 / 카테고리 분류 기능)
- 중고 상품 판매 (중고 상품 CRUD / 가격 or 색상 or 상품명 별 정렬 / 카테고리 분류 기능)
- 제품 상세 보기 (마우스 hover 시, 상품 이미지 확대)
- 리뷰 작성
- 상품 검색
- 상품 주문 및 결제 (결제 API 사용)
- 다크모드 

### 수행 업무
-----
- 가입 기능 구현
- 상품 데이터 CRUD 기능 구현
- 회원 및 상품 관련 DB 설계

### 사용 기술
--------
<img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white"> <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"> <img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
<img src="https://img.shields.io/badge/apache maven-4FC08D?style=for-the-badge&logo=apachemaven&logoColor=white">

### 개발 환경 및 도구
----
- Windows OS x64
- Spring Framework 3.1
- Apache Tomcat 9.0
- Java 11.0.8
- Oracle DB 11g Express Edition 11.2.0.2.0 (64bit)
- sts-3.9.16.RELEASE
- BootStrap 4.6.0
- jQuery 3.6.0
- Maven

### 외부 라이브러리(Maven)
-----
| Library |  |
| ------ | ------ |
| json 20210307 | gson 2.8.6 |
| commons-dbcp 1.4 | myBatis 3.5.6 |
| mybatis-spring 2.0.6 | ojdbc6 11.2.0.4 |
| lombok 1.18.18 | spring-security-core 5.3.6 RELEASE |
| jackson-databind 2.11.4 | commons-fileupload 1.4 |
| javax.mail 1.5.6 | httpclient 4.5.13 |

### ERD 설계
-----
![image](https://user-images.githubusercontent.com/45419456/125296528-57d76980-e361-11eb-8706-13f40186d62e.png)


### 사이트 맵
-----
![image](https://user-images.githubusercontent.com/45419456/125296574-64f45880-e361-11eb-9b60-e2cea9c822ef.png)

### 시퀀스 다이어그램
-----
| 중고 상품 구매 시퀀스 다이어그램 | 브랜드 상품 구매 시퀀스 다이어그램 |
| ------ | ------ |
| ![image](https://user-images.githubusercontent.com/45419456/125301414-ef3ebb80-e365-11eb-9a30-f170b91395b5.png) | ![image](https://user-images.githubusercontent.com/45419456/125301461-f960ba00-e365-11eb-9fca-8ab61f8de000.png) |
| 중고상품 등록 시퀀스 다이어그램(일반 회원) | 브랜드 상품 등록 시퀀스 다이어그램(브랜드 회원) |
| ![image](https://user-images.githubusercontent.com/45419456/125301500-02518b80-e366-11eb-9bc5-719dcde07484.png) | ![image](https://user-images.githubusercontent.com/45419456/125301539-0aa9c680-e366-11eb-8bde-272c86846b45.png) |


### 구현 이미지
-----
| 1) 메인 페이지(mouse hover 시)             | 2) 메인 페이지(mouse hover 시) |
| ------ | ------ |
| ![image](https://user-images.githubusercontent.com/45419456/125302207-b226f900-e366-11eb-9d81-4fb6c43ca0cf.png) | ![image](https://user-images.githubusercontent.com/45419456/125302632-177aea00-e367-11eb-8530-38d306407e6e.png)

| 3) 회원 가입 (개인)                        | 4) 회원 가입 (업체) |
| ------ | ------ |
| ![image](https://user-images.githubusercontent.com/45419456/125302267-c0751500-e366-11eb-95bb-35c8245a3e35.png) | ![image](https://user-images.githubusercontent.com/45419456/125302292-c5d25f80-e366-11eb-9ef5-12185ee6f7e1.png)

| 5) 로그인 모달             | 6) 아이디 찾기 모달 |           7) 비밀번호 찾기 모달 |
| ------ | ------ | ------ |
| ![image](https://user-images.githubusercontent.com/45419456/125302342-cf5bc780-e366-11eb-8233-cfa01be8a65f.png) | ![image](https://user-images.githubusercontent.com/45419456/125302377-d7b40280-e366-11eb-8a92-a31d3820ed1f.png) | ![image](https://user-images.githubusercontent.com/45419456/125302398-dda9e380-e366-11eb-97f0-7a0e87ff5397.png)

| 8) 마이 페이지             | 9) 회원 정보 수정 
| ------ | ------ |
| ![image](https://user-images.githubusercontent.com/45419456/125303391-bacbff00-e367-11eb-94e5-177563f6823c.png) | ![image](https://user-images.githubusercontent.com/45419456/125303449-c7505780-e367-11eb-8306-1c20230f57b4.png)

| 10) 상품 리스트 (중고)             | 11) 상품 리스트 (브랜드) |
| ------ | ------ |
| ![image](https://user-images.githubusercontent.com/45419456/125303901-1e562c80-e368-11eb-9d96-e429f76e59ba.png) | !![image](https://user-images.githubusercontent.com/45419456/125303851-126a6a80-e368-11eb-8860-06c3ceb030f4.png)

| 12) 상품 상세 페이지 (중고)             | 13) 상품 상세 페이지 (브랜드) |
| ------ | ------ |
| ![image](https://user-images.githubusercontent.com/45419456/125304162-4fcef800-e368-11eb-9af7-f7ea69c005aa.png) | ![image](https://user-images.githubusercontent.com/45419456/125304096-42b20900-e368-11eb-9267-50081f7b61f4.png)

| 14) 회원 장바구니             | 15) 개인 구매 내역 |          
| ------ | ------ |
| ![image](https://user-images.githubusercontent.com/45419456/125304789-d4217b00-e368-11eb-9355-1d148931ceec.png) | ![image](https://user-images.githubusercontent.com/45419456/125304829-dbe11f80-e368-11eb-8158-db5c744e4358.png)

| 16) 판매 상품 관리 페이지 (중고)             | 17) 판매 상품 관리 페이지 (브랜드) |
| ------ | ------ |
| ![image](https://user-images.githubusercontent.com/45419456/125305051-07640a00-e369-11eb-96d2-bda17565b231.png) | ![image](https://user-images.githubusercontent.com/45419456/125305114-1480f900-e369-11eb-83f7-3a3fde4f9837.png)


| 18) 상품 판매 순위 (브랜드)             | 19) 판매 & 주문받은 내역 (브랜드) |
| ------ | ------ |
| ![image](https://user-images.githubusercontent.com/45419456/125305317-3a0e0280-e369-11eb-9c48-c832e9571b14.png) | ![image](https://user-images.githubusercontent.com/45419456/125305375-42663d80-e369-11eb-9892-5e599bb28adf.png)


| 20) 판매 내역 상세 조회 모달 (브랜드)             | 21) 판매 내역 (중고) |
| ------ | ------ |
| ![image](https://user-images.githubusercontent.com/45419456/125305851-ab4db580-e369-11eb-80e1-91d896a2ad38.png) | ![image](https://user-images.githubusercontent.com/45419456/125305895-b3a5f080-e369-11eb-9a65-f6f45b38cb4f.png)

| 22) 상품 등록 (중고)            | 23) 상품 등록 (브랜드) |
| ------ | ------ |
| ![image](https://user-images.githubusercontent.com/45419456/125306122-e6e87f80-e369-11eb-88d6-1555b400bc99.png) | ![image](https://user-images.githubusercontent.com/45419456/125306077-da642700-e369-11eb-847a-9b880f44730c.png)

| 24) 리뷰&FAQ 페이지          | 25) 리뷰 등록 페이지 |
| ------ | ------ |
| ![image](https://user-images.githubusercontent.com/45419456/125306242-0089c700-e36a-11eb-87ef-02477d57bfe8.png) | ![image](https://user-images.githubusercontent.com/45419456/125306280-08e20200-e36a-11eb-914c-14a9eb6fcdd5.png)

| 26) 결제 페이지          | 27) 결제 완료 페이지 |
| ------ | ------ |
| ![image](https://user-images.githubusercontent.com/45419456/125306521-421a7200-e36a-11eb-8cfe-710c83c554a1.png) | ![image](https://user-images.githubusercontent.com/45419456/125306590-4f376100-e36a-11eb-8b28-24b25330113b.png)

| 26) 다크모드 전환          
| ------ |
| ![image](https://user-images.githubusercontent.com/45419456/125307446-0502af80-e36b-11eb-86d9-03412de280eb.png) | 

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [markdown-it]: <https://github.com/markdown-it/markdown-it>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]: <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
   [PlMe]: <https://github.com/joemccann/dillinger/tree/master/plugins/medium/README.md>
   [PlGa]: <https://github.com/RahulHP/dillinger/blob/master/plugins/googleanalytics/README.md>
