import 'package:bookslist/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Books List',
      theme: ThemeData(primarySwatch: Colors.red, brightness: Brightness.dark),
      home: const HomePage(title: 'Books List'),
    );
  }
}
