class Article {
  int id;
  String title;
  String detail;
  int year;
  String date;
  int favorite;
  Article({
    required this.id,
    required this.title,
    required this.detail,
    required this.date,
    required this.favorite,
    required this.year
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'detail': detail,
      'date': date,
      'favorite': favorite,
      'year': year,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      detail: map['detail'] ?? '',
      year: map['year']?.toInt() ?? 0,
      date: map['date'] ?? '',
      favorite: map['favorite']?.toInt() ?? 0,
    );
  }
}
