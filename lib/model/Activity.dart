class Activity {
  String activity;
  String type;
  String participants;
  String price;
  String link;
  String key;
  String accessibility;

  Activity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  factory Activity.fromJson(Map<String, dynamic> parsedJson) {
    return Activity(
      activity: parsedJson['activity'],
      type: parsedJson['type'],
      participants: parsedJson['participants'].toString(),
      price: parsedJson['price'].toString(),
      link: parsedJson['link'],
      key: parsedJson['key'],
      accessibility: parsedJson['accessibility'].toString(),
    );
  }
}
