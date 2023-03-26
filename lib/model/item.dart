class item {
  num id;
  String title;
  num price;
  int counter;
  String description;
  String category;
  String image;
  bool available;
  // String rating;
  // num count;

  item({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.counter,
    required this.category,
    required this.image,
    required this.available,
    // required this.rating,
    // required this.count
  });

  factory item.fromjson(Map<String, dynamic> parsedjson) {
    return item(
      id: parsedjson['id'],
      title: parsedjson['title'],
      price: parsedjson['price'],
      counter: 1,
      available: false,
      description: parsedjson['description'],
      category: parsedjson['category'],
      image: parsedjson['image'],
      // rating: parsedjson['rating'],
      // count: parsedjson['count'],
    );
  }

  static List asbezaList(List asbeza) {
    List asbezas = [];
    for (var i = 0; i < asbeza.length; i++) {
      asbezas.add(item.fromjson(asbeza[i]));
    }
    return asbezas;
  }
}
