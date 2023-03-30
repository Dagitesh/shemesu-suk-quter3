class item {
  num id;
  String title;
  num price;
  int counter;
  String description;
  String category;
  String image;
  bool available;
  

  item({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.counter,
    required this.category,
    required this.image,
    required this.available,
   
  });

  factory item.fromjson(Map<String, dynamic> parsedjson) {
    return item(
      id: parsedjson['id'],
      title: parsedjson['title'],
      price: parsedjson['price'],
      counter: parsedjson['counter'],
      available: parsedjson['itemsadded'],
      description: parsedjson['description'],
      category: parsedjson['category'],
      image: parsedjson['image'],
      
    );
  }
  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['title'] = title;
    json['description'] = description;
    json['price'] = price;
    json['image'] = image;
    json['counter'] = counter;
    json['availabe'] = available;
    return json;
  }

  static List asbezaList(List asbeza) {
    List asbezas = [];
    for (var i = 0; i < asbeza.length; i++) {
      asbezas.add(item.fromjson(asbeza[i]));
    }
    return asbezas;
  }

  static List historyList(List asbeza) {
    List asbezas = [];
    for (var i = 0; i < asbezas.length; i++) {
      asbeza.add(item.fromjson(asbeza[i]));
    }
    return asbezas;
  }
}
