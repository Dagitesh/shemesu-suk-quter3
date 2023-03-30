class item {
  num id;
  String title;
  num price;
  int counter;
  String description;

  String image;
  int available;

  item({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.counter,
    required this.image,
    required this.available,
  });

  factory item.fromjson(Map<String, dynamic> parsedjson) {
    return item(
      id: parsedjson['id'],
      title: parsedjson['title'],
      price: parsedjson['price'],
      counter: 1,
      available: 0,
      description: parsedjson['description'],
      image: parsedjson['image'],
    );
  }
  factory item.historyfromJson(Map<String, dynamic> parsedJson) {
    return item(
      id: parsedJson['id'],
      title: parsedJson['title'],
      price: parsedJson['price'],
      description: parsedJson['description'],
      counter: parsedJson['counter'],
      image: parsedJson['image'],
      available: parsedJson['available'],
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
    json['available'] = available;
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
    for (var i = 0; i < asbeza.length; i++) {
      asbezas.add(item.historyfromJson(asbeza[i]));
    }
    return asbezas;
  }
}
