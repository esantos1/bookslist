import 'dart:convert';

import 'package:bookslist/models/book.dart';
import 'package:http/http.dart' as http;

class BooksApi {
  static Future<List<Book>> getBooks() async {
    const url =
        'https://raw.githubusercontent.com/benoitvallon/100-best-books/master/books.json';

    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);

    return body.map<Book>(Book.fromJson).toList();
  }
}
