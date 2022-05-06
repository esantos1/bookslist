const defaultPadding = 16.0;

String imagePath =
    'https://raw.githubusercontent.com/benoitvallon/100-best-books/master/static/';

String convertToAC(int n) {
  if (n < 0) {
    return '$n a.C.'.replaceAll('-', '');
  } else {
    return n.toString();
  }
}
