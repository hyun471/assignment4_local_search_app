# assignment 4 - local search app

## 📌 프로젝트 소개
#### 지역을 검색하면 해당 지역의 장소들을 나타낼 수 있으며 디바이스의 현재 위치를 반영하여 근처 장소들을 나타낼 수 있습니다. 
#### 해당 장소들의 리뷰를 작성할 수 있으며, 작성된 리뷰들을 확인이 가능합니다.
#### 또한, 작성한 리뷰의 패스워드를 알고 있다면 삭제도 가능합니다.

## 📆 개발 기간
#### 2025.07.31 ~ 2025.08.05


## 👥 멤버 구성
| 이름 (역할)   | GitHub ID                                      | 담당 업무                                    |
|--------------|-------------------------------------------------|----------------------------------------------|
| 김현수 (팀장) | [hyun471](https://github.com/hyun471)           | 앱 전체 개발                                  |




## 🌐 개발 환경

<p float="left">
  <img width="100" alt="dart" src="https://github.com/user-attachments/assets/922bc8e6-030e-457e-941c-3c38b90c52b1" />
  <img width="100" alt="flutter1" src="https://github.com/user-attachments/assets/f79ac066-5d29-47b2-8ee8-d5a8928ede8f" />
</p>

#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dart&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Flutter


## 📱 주요 기능

<p float="left">
<img width="150" alt="h1" src="https://github.com/user-attachments/assets/63e1d683-c4c7-4373-8509-99fddfc8e07f" />
<img width="150" alt="h2" src="https://github.com/user-attachments/assets/fbaad2d9-caea-4b07-80a5-585dae2499d1" />
<img width="150" alt="h3" src="https://github.com/user-attachments/assets/8d34c4e3-c5df-456a-adef-3491fd4e13d6" />
</p>


- 🔍 홈 페이지 (지역 검색) :
  - 상단에 검색창에서 지역을 검색하면 네이버 검색 API를 통해 해당 지역에 있는 장소를 호출합니다.
  - 호출된 장소 데이터는 박스 위젯에 장소명, 카테고리, 주소를 나타내고 위/아래 스크롤이 가능한 리스트로 표시 됩니다.
  - 해당 장소를 클릭하면 리뷰를 확인할 수 있는 페이지로 이동합니다.


---



<p float="left">
<img width="150" alt="r1" src="https://github.com/user-attachments/assets/13c4021a-469f-414b-8693-d47e579e094b" />
<img width="150" alt="r2" src="https://github.com/user-attachments/assets/e761b678-fa0b-4133-93e4-f464e368bb99" />
<img width="150" alt="r3" src="https://github.com/user-attachments/assets/2f0ff701-c175-40a0-9f49-1990531b07b3" />
<img width="150" alt="r4" src="https://github.com/user-attachments/assets/44888a2e-26ad-4e91-8992-d3a72d0cc57d" />
<img width="150" alt="r5" src="https://github.com/user-attachments/assets/09e72119-deb9-40ee-80d4-088eb0d34345" />
</p>


- 📝 리뷰 페이지 :
  - 서버에 작성된 해당 장소의 리뷰들을 볼 수 있는 페이지 입니다.
  - 하단에 리뷰를 작성할 수 있는 입력창에 리뷰를 입력하면 패스워드를 설정하는 팝업 창이 나옵니다.
  - 패스워드 설정까지 완료되면 리뷰가 작성되어 서버에 저장되고 작성된 리뷰가 표시됩니다.
  - 리뷰들은 작성된 시간순으로 표시됩니다.
  - 만약 작성한 리뷰의 패스워드를 알고 있다면 해당 리뷰의 x표시를 눌러 리뷰를 삭제할 수 있습니다.
  - 리뷰 삭제시 패스워드를 입력하는 팝업창이 나타납니다.
  - 패스워드가 일치한다면 리뷰가 서버에서 삭제되고 해당 리뷰는 리뷰페이지에서 없어집니다.
  - 패스워드가 일치하지 않는다면 패스워드가 올바르지 않다는 팝업창이 나타납니다.

---



<p float="left">
<img width="150" alt="h4" src="https://github.com/user-attachments/assets/1ed79209-0e64-404f-bd49-cd38ece503cf" />
</p>


- 📄 홈 페이지 (현재 위치 검색) :
  - 상단 오른쪽에 GPS 버튼을 누르게 되면 디바이스에 있는 GPS 좌표를 가지고 현재 위치에 있는 지역명을 검색합니다.
  - 홈페이지에는 지역명에 있는 장소 데이터를 받아 박스위젯이 리스트로 UI에 표시됩니다.


---
