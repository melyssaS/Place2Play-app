class Event {
  final String title;
  final String description;
  final DateTime start;
  final DateTime end;
  final String? id;
  final double price;
  final UserCategory category;

  const Event(
      {required this.title,
      required this.description,
      required this.start,
      required this.end,
      required this.price,
      this.id,
      required this.category});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'start': start.toString(),
      'end': end.toString(),
      'price': price.toString(),
      'category': category.toString()
    };
  }
}

enum UserCategory { history, created, starred }
