class Ads {
  late String id;
  late String name;
  late String price;
  late String description;
  late String image;

  Ads.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    price = data['price'];
    description = data['description'];
    image = data['image'];
  }
}
