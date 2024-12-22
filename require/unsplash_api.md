# 기본 인증 방법
client_id=YOUR_ACCESS_KEY 는 발급 받은 API Key를 적습니다.
https://api.unsplash.com/photos/?client_id=YOUR_ACCESS_KEY



# 랜덤 이미지 불러오는 법
GET /photos/random
GET 방식을 통해 주소를 불러옵니다.
기존의 request에 /random 을 붙이면 됩니다.
https://api.unsplash.com/photos/random?client_id=YOUR_ACCESS_KEY



# 파라미터

### Parameters Description

All parameters are optional and can be combined to narrow the pool of photos from which a random one will be chosen:

- **collections**: Filter the selection by public collection ID(s). If there are multiple IDs, separate them with commas.
- **topics**: Filter the selection by public topic ID(s). If there are multiple IDs, separate them with commas.
- **username**: Limit the selection to photos from a single user.
- **query**: Limit the selection to photos that match a specific search term.
- **orientation**: Filter by photo orientation. Valid values are `landscape`, `portrait`, or `squarish`.
- **content_filter**: Limit results based on content safety. The default value is `low`, and valid options are `low` or `high`.
- **count**: Specify the number of photos to return. The default is 1, and the maximum is 30.

### Notes
1. The `collections` and `topics` parameters cannot be used with the `query` parameter in the same request.
2. When using the `count` parameter, the response will always be an array of photos, even if the `count` value is 1.


# **Response 예시**

{
  "id": "pXhwzz1JtQU",
  "updated_at": "2016-07-10T11:00:01-05:00",
  "username": "jimmyexample",
  "first_name": "James",
  "last_name": "Example",
  "twitter_username": "jimmy",
  "portfolio_url": null,
  "bio": "The user's bio",
  "location": "Montreal, Qc",
  "total_likes": 20,
  "total_photos": 10,
  "total_collections": 5,
  "followed_by_user": false,
  "downloads": 4321,
  "uploads_remaining": 4,
  "instagram_username": "james-example",
  "location": null,
  "email": "jim@example.com",
  "links": {
    "self": "https://api.unsplash.com/users/jimmyexample",
    "html": "https://unsplash.com/jimmyexample",
    "photos": "https://api.unsplash.com/users/jimmyexample/photos",
    "likes": "https://api.unsplash.com/users/jimmyexample/likes",
    "portfolio": "https://api.unsplash.com/users/jimmyexample/portfolio"
  }
}