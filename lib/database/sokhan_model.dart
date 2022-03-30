class Sokhan {
  int id;
  String title;
  String detail;
  String date;
  int favorite;
  Sokhan({
    required this.id,
    required this.title,
    required this.detail,
    required this.date,
    required this.favorite,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'detail': detail,
      'date': date,
      'favorite': favorite,
    };
  }

  factory Sokhan.fromMap(Map<String, dynamic> map) {
    return Sokhan(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      detail: map['detail'] ?? '',
      date: map['date'] ?? '',
      favorite: map['favorite']?.toInt() ?? 0,
    );
  }
}
