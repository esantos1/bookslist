import 'package:bookslist/constants.dart';
import 'package:bookslist/models/book.dart';
import 'package:bookslist/widgets/details_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SeeDetails extends StatefulWidget {
  final Book book;

  const SeeDetails(this.book, {Key? key}) : super(key: key);

  @override
  State<SeeDetails> createState() => _SeeDetailsState();
}

class _SeeDetailsState extends State<SeeDetails> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text(widget.book.title), centerTitle: true),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : body(size),
    );
  }

  Widget body(Size size) {
    final year = convertToAC(widget.book.year);

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      width: size.width,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(
            '$imagePath${widget.book.imageLink}',
            height: size.height * 0.4,
          ),
          Container(
            constraints: const BoxConstraints(minHeight: defaultPadding),
          ),
          DetailsText(attributeName: 'Author:', data: widget.book.author),
          const Divider(),
          DetailsText(attributeName: 'Pages:', data: '${widget.book.pages}'),
          const Divider(),
          DetailsText(
            attributeName: 'Released in:',
            data: year,
          ),
          const Divider(),
          DetailsText(
            attributeName: 'Launch country:',
            data: widget.book.country,
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () => launchBook(widget.book.link),
            child: const Text('See more'),
          ),
        ],
      ),
    );
  }

  void launchBook(String url) async {
    final openPage = launch(url);

    openPage.then((value) {
      setState(() => isLoading = true);
    }).onError((error, stackTrace) {
      throw '$error';
    }).whenComplete(() {
      setState(() => isLoading = false);
    });
  }
}
