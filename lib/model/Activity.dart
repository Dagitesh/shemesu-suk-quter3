class Activity {
  num id;
  String title;
  num price;
  String description;
  String category;
  String image;

  Activity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Activity.fromJson(Map<String, dynamic> parsedJson) {
    return Activity(
      id: parsedJson['id'],
      title: parsedJson['title'],
      price: parsedJson['price'],
      description: parsedJson['description'],
      category: parsedJson['category'],
      image: parsedJson['image'],
    );
  }
  static List asbezaList(List asbeza) {
    List asbezas = [];
    for (var i = 0; i < asbeza.length; i++) {
      asbezas.add(Activity.fromJson(asbeza[i]));
    }
    return asbezas;
  }
}
