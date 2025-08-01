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

class Location {
  String title;
  String category;
  String address;

  Location({
    required this.title,
    required this.category,
    required this.address,
  });

  Location.fromJson(Map<String, dynamic> map)
      : this(
          title: map['title'],
          category: map['category'],
          address: map['address'],
        );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'address': address,
    };
  }
}
