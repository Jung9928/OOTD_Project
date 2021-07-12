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
| Library |
| ------ | ------ |
| json 20210307 | 
| gson 2.8.6 |
| commons-dbcp 1.4 | 
| myBatis 3.5.6 |
| mybatis-spring 2.0.6 |
| ojdbc6 11.2.0.4 |
| lombok 1.18.18 |
| spring-security-core 5.3.6 RELEASE |
| jackson-databind 2.11.4 |
| commons-fileupload 1.4 |
| javax.mail 1.5.6 |
| httpclient 4.5.13 |

### ERD 설계
-----
![image](https://user-images.githubusercontent.com/45419456/125296528-57d76980-e361-11eb-8706-13f40186d62e.png)


### 사이트 맵
-----
![image](https://user-images.githubusercontent.com/45419456/125296574-64f45880-e361-11eb-9b60-e2cea9c822ef.png)

### 구현 이미지
-----
| 1) 로그인 페이지             | 2) 회원 가입 페이지 |
| ------ | ------ |
| <img src="https://user-images.githubusercontent.com/45419456/117924188-4e655d00-b330-11eb-9823-85deb2a71c50.png"/> | <img src="https://user-images.githubusercontent.com/45419456/117924238-62a95a00-b330-11eb-9de2-0d8d0d93fec2.png"/>

| 3) 회원 정보 조회 페이지             | 4) 회원 정보 수정 및 탈퇴 페이지 |
| ------ | ------ |
| <img src="https://user-images.githubusercontent.com/45419456/117924725-1ca0c600-b331-11eb-81e6-0dd9c33f4a5e.png"/> | <img src="https://user-images.githubusercontent.com/45419456/117926616-00eaef00-b334-11eb-8deb-27dc50b7d212.png">

| 5) 회원 승인 요청 페이지             | 6) 회원 권한 회수 페이지 |
| ------ | ------ |
| <img src="https://user-images.githubusercontent.com/45419456/117927677-7f945c00-b335-11eb-8e8f-db39a61d4393.png"> | <img src="https://user-images.githubusercontent.com/45419456/117924919-7acda900-b331-11eb-8452-7d8b8f766a07.png">

| 7) 상품 등록 페이지             | 8) 상품 조회 페이지 |
| ------ | ------ |
| <img src="https://user-images.githubusercontent.com/45419456/117927966-e285f300-b335-11eb-824e-2af2af5cb022.png"> | <img src="https://user-images.githubusercontent.com/45419456/117928073-09442980-b336-11eb-891f-fb8bf4f04f3c.png">

| 9) 판매 등록 페이지             | 10) 판매 조회/수정/삭제 페이지 |
| ------ | ------ |
| <img src="https://user-images.githubusercontent.com/45419456/117928367-6e981a80-b336-11eb-9eb2-9b5e89acfdd4.png"> | <img src="https://user-images.githubusercontent.com/45419456/117929885-48737a00-b338-11eb-8691-11233bfd0188.png">

| 11) 발주 등록 페이지             | 12) 발주 조회/수정/삭제 페이지 |
| ------ | ------ |
| <img src="https://user-images.githubusercontent.com/45419456/117928586-bd45b480-b336-11eb-995f-6dd5bb9e8252.png"> | <img src="https://user-images.githubusercontent.com/45419456/117930073-85d80780-b338-11eb-8df6-4b85b88fa5e8.png">

| 13) 거래처 등록 페이지             | 14) 거래처 조회 페이지 |          15) 거래처 수정/삭제 페이지|
| ------ | ------ | ------ |
| <img src="https://user-images.githubusercontent.com/45419456/117928839-144b8980-b337-11eb-8731-2df649c60dc2.png"> | <img src="https://user-images.githubusercontent.com/45419456/117928920-31805800-b337-11eb-9fbe-0a49e67365e4.png"> | <img src="https://user-images.githubusercontent.com/45419456/117929499-de5ad500-b337-11eb-80a4-38438a0cb9b1.png">

| 16) 재고조회/수정 페이지             | 17) 메인(월/일별 판매량 시각화) 페이지 |
| ------ | ------ |
| <img src="https://user-images.githubusercontent.com/45419456/117929266-90de6800-b337-11eb-92e2-ce4df8ae55db.png"> | <img src="https://user-images.githubusercontent.com/45419456/117929376-b3708100-b337-11eb-9d09-fe2c7b83fad3.png">


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
