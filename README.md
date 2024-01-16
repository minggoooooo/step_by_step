## 📒 프로젝트 개요
- 이 프로젝트는 자바와 Spring Framework를 활용한 웹 개발자 과정을 진행하면서 만든 팀 프로젝트입니다
- Spring Framework 수업 도중 진행 된 프로젝트라 Spring 활용을 못하고 jsp를 활용 한 프로젝트입니다.
  


## 📘 프로젝트 요약
- 내가 원하는 곳에서, 내가 원하는 사람들과 함께 산책하자! 라는 메세지를 기반으로 만든 모임위주 산책 사이트입니다


## 🕒 개발 기간
-  23.10.16 ~ 23.12.21

## 📕 API
- 다음 주소 api
- 카카오 지도 + 로드뷰 api

## 📙 프로젝트 소개

 ## 코스 소개
![메인](https://github.com/minggoooooo/What_to_eat_today/assets/136559977/33ef7d33-68f2-469f-a6ff-0fe0c031ba57)

- geolocation을 이용해 받아온 초기값 + 초기 설정위치로 현재 나와의 거리가 가까운순으로 리스트 생성
- 설정값을 바꾸면 바꾼 설정값으로 리스트를 가져옴
- 현재 보이는 화면은 리스트 중 코스 하나를 선택 후 로드뷰 기능을 사용 한 것
- 리스트 우측 하트버튼을 누르게되면 추천이 올라가는 기능 구현
- 리스트 상단 돋보기 버튼을 클릭하게되면 다음 주소 api를 불러와 주소변경이 가능하고 해당 주소 위치로 리스트 생성
  <br>
  ![ㅁㄴㅇ](https://github.com/minggoooooo/What_to_eat_today/assets/136559977/177d38fd-67ee-4cdb-8abe-655551ba6bcc)

- 중복 추천 방지
 <br>
 
## 코스 선택
  <br>
  
  ![그림1](https://github.com/minggoooooo/What_to_eat_today/assets/136559977/a996f9f6-2096-4c2a-bbb0-34dc34701dac)
  
  - 일정등록 페이지에서 코스 선택 버튼을 누르게되면 코스 소개에서 좋아요 기능이 구현되어 있는 반면 선택 버튼을 만들어 코스를 선택하게 되면 해당 코스의 이름과 id를 가지고 넘어가게끔 처리함


## 코스 등록

  <br>

  ![그림3](https://github.com/minggoooooo/What_to_eat_today/assets/136559977/9be7433c-df5f-4269-b4d0-8a9d087c3928)

  - 현재는 gpx파일 파싱만 지원하기 때문에 이와같이 등록함 delete와 update도 구현 필요

## 크루페이지

  <br>

  ![그림4](https://github.com/minggoooooo/What_to_eat_today/assets/136559977/7fba4baf-fb46-4ee7-adc1-8528df0798b9)

  - 크루 등록 및 가입페이지 장기크루와 단기크루로 나뉘어져있으며 단기크루는 일정 1회만 진행하고 삭제됨

  - 예정 일정이 도래, 또는 크루 모집 기한이 마감되고 인원이 3명이상이 되지않으면 자동 삭제되게 처리
  
  - 또한, 게시판 사진첩도 구현했으며 게시판의 경우 코스와 달리 중복추천대신 추천 취소기능을 구현함
    
  ![그림5](https://github.com/minggoooooo/What_to_eat_today/assets/136559977/b03f0274-3fb1-4469-a8d8-7dff1f71f876)

## 마이페이지

![그림7](https://github.com/minggoooooo/What_to_eat_today/assets/136559977/057b73e4-b9ca-4dc9-a224-61673627e33f)

- 누적 기록 조회 가능, 나의 크루 활동 한눈에 보기
- 내가 방장인 크루에 가입신청 처리 가능
- 내가 가입 신청한 크루 확인 가능
