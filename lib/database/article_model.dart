class Article {
  int id;
  String title;
  String detail;
  int year;
  String date;
  int fav;
  Article({
    required this.id,
    required this.title,
    required this.detail,
    required this.date,
    required this.fav,
    required this.year
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'detail': detail,
      'date': date,
      'fav': fav,
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
      fav: map['fav']?.toInt() ?? 0,
    );
  }
}
