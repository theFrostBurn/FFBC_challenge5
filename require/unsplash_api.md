# Unsplash API 기본 가이드

## 인증 (Authentication)

### 기본 인증
모든 API 요청에는 인증이 필요합니다. 가장 기본적인 인증 방법은 다음과 같습니다:

# 1. Authorization 헤더 사용 (권장)
Authorization: Client-ID YOUR_ACCESS_KEY

# 2. URL 파라미터 사용
https://api.unsplash.com/photos/?client_id=YOUR_ACCESS_KEY

## 랜덤 이미지 API

### 기본 요청
GET /photos/random

### 전체 URL 예시
https://api.unsplash.com/photos/random?client_id=YOUR_ACCESS_KEY

### 주요 파라미터
| 파라미터 | 설명 | 예시 |
|---------|------|------|
| collections | 특정 컬렉션에서만 선택 (콤마로 구분) | `collections=123,456` |
| topics | 특정 토픽에서만 선택 (콤마로 구분) | `topics=nature,water` |
| username | 특정 사용자의 사진만 선택 | `username=johndoe` |
| query | 검색어로 필터링 | `query=coffee` |
| orientation | 사진 방향 필터링 (landscape/portrait/squarish) | `orientation=landscape` |
| content_filter | 콘텐츠 안전도 (low/high) | `content_filter=low` |
| count | 반환할 사진 수 (최대 30) | `count=10` |

### 중요 참고사항
- `collections`와 `topics`는 `query`와 동시에 사용할 수 없습니다
- `count` 파라미터 사용시 항상 배열 형태로 응답이 반환됩니다

## 응답 형식

### 기본 응답 구조
{
  "id": "사진ID",
  "created_at": "생성일자",
  "updated_at": "수정일자",
  "width": 이미지너비,
  "height": 이미지높이,
  "urls": {
    "raw": "원본 이미지 URL",
    "full": "전체 해상도 URL",
    "regular": "일반 해상도 URL (1080px)",
    "small": "작은 해상도 URL (400px)",
    "thumb": "썸네일 URL (200px)"
  },
  "user": {
    "id": "사용자ID",
    "username": "사용자이름",
    "name": "실제이름"
  },
  "links": {
    "self": "API 엔드포인트",
    "html": "웹페이지 URL",
    "download": "다운로드 URL"
  }
}

### 이미지 URL 사용시 주의사항
- 모든 이미지 URL은 동적으로 크기 조절이 가능합니다
- `ixid` 파라미터는 반드시 유지해야 합니다 (통계 추적용)
- 이미지 요청은 API 호출 제한에 포함되지 않습니다

## 에러 처리
- 401: 인증 오류
- 403: 권한 부족
- 404: 리소스 없음
- 429: 요청 한도 초과