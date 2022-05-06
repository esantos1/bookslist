class Book {
  String author;
  String country;
  String imageLink;
  String language;
  String link;
  int pages;
  String title;
  int year;

  Book({
    required this.author,
    required this.country,
    required this.imageLink,
    required this.language,
    required this.link,
    required this.pages,
    required this.title,
    required this.year,
  });

  factory Book.fromJson(json) => Book(
        author: json['author'],
        country: json['country'],
        imageLink: json['imageLink'],
        language: json['language'],
        link: json['link'],
        pages: json['pages'].toInt(),
        title: json['title'],
        year: json['year'].toInt(),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['author'] = author;
    data['country'] = country;
    data['imageLink'] = imageLink;
    data['language'] = language;
    data['link'] = link;
    data['pages'] = pages;
    data['title'] = title;
    data['year'] = year;

    return data;
  }
}
