// "items": [
//   {
//     "title": "핫쵸 스타필드 코엑스몰점",
//     "link": "https://www.instagram.com/hotcho.okonomiyaki",
//     "category": "음식점>일식>일식당",
//     "description": "",
//     "telephone": "",
//     "address": "서울특별시 강남구 삼성동 159 코엑스 스타필드 지하 1층",
//     "roadAddress": "서울특별시 강남구 영동대로 513 코엑스 스타필드 지하 1층",
//     "mapx": "1270593479",
//     "mapy": "375120649"
//   },

// 네이버 API에서 받아오는 데이터 모델
class Local {
  String title;
  String category;
  String address;
  String mapX;
  String mapY;

  Local(
      {required this.title,
      required this.category,
      required this.address,
      required this.mapX,
      required this.mapY});

  Local.fromJson(Map<String, dynamic> map)
      : this(
            title: map['title'],
            category: map['category'],
            address: map['address'],
            mapX: map['mapx'],
            mapY: map['mapy']);

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'address': address,
    };
  }
}
