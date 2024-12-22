# PRD (Product Requirements Document) 문서

### Project overview (프로젝트 요약)
- FOODIGO는 사용자 친화적인 음식 배달 플랫폼입니다.
- iOS 스타일의 깔끔하고 직관적인 UI/UX를 제공합니다.
- 다양한 음식 카테고리와 맞춤형 추천 시스템을 통해 사용자들에게 최적화된 음식 주문 경험을 제공합니다.

### Core functionalities (핵심 기능)
1. 카테고리 기반 음식점 탐색
   - 한식, 중식, 일식, 양식 등 8가지 주요 카테고리 제공
   - 이모지 아이콘을 활용한 직관적인 카테고리 구분
   - 격자형 레이아웃의 카테고리 메뉴 구성

2. 프로모션 및 이벤트 관리
   - 수평 스크롤 가능한 프로모션 카드 섹션
   - 신규 가입 이벤트, 할인 쿠폰 등 다양한 프로모션 제공
   - 도트 인디케이터를 통한 현재 카드 위치 표시

3. 맞춤형 추천 시스템
   - "이 집 맛있어요!" 섹션을 통한 인기 맛집 추천
   - "방금 옆집에서 시킨 집!" 섹션으로 실시간 주문 트렌드 제공
   - 평점 시스템 (5점 만점)을 통한 신뢰도 있는 맛집 정보 제공

4. 검색 및 필터링
   - 상단 검색바를 통한 음식점/메뉴 검색 기능
   - 카테고리별 필터링 시스템

### Doc (참고 문서)
- UI/UX 가이드라인: Apple HIG (Human Interface Guidelines)
- 디자인 시스템: Cupertino Design System
- API 문서: Unsplash API (음식점 이미지 관련)

### Current file structure (현재 파일 구조)
- lib/
  - main.dart
  - screens/
    - home_screen.dart
    - category_screen.dart
    - detail_screen.dart
    - cart_screen.dart
    - payment_screen.dart
  - widgets/
    - category_grid.dart
    - promotion_card.dart
    - restaurant_card.dart
  - models/
    - restaurant.dart
    - category.dart
    - promotion.dart
