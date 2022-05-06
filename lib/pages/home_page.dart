import 'package:bookslist/api/books_api.dart';
import 'package:bookslist/constants.dart';
import 'package:bookslist/models/book.dart';
import 'package:bookslist/pages/see_details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Book>> books;

  @override
  void initState() {
    super.initState();

    books = BooksApi.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true),
      body: FutureBuilder<List<Book>>(
        future: books,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (snapshot.hasData) {
            final books = snapshot.data!;

            return buildBooks(size, books);
          } else {
            return const Text('No books found');
          }
        },
      ),
    );
  }

  Widget buildBooks(Size size, List<Book> books) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];

        return buildItems(book);
      },
    );
  }

  Widget buildItems(Book book) {
    String year = convertToAC(book.year);

    return Card(
      child: ListTile(
        isThreeLine: true,
        leading: Image.network('$imagePath${book.imageLink}'),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(book.title),
        ),
        subtitle: Text('${book.author}\nReleased in $year'),
        trailing: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SeeDetails(book)),
          ),
          icon: const Icon(Icons.info),
        ),
      ),
    );
  }
}
