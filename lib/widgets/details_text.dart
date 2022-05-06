import 'package:flutter/material.dart';

class DetailsText extends StatelessWidget {
  final String attributeName, data;

  const DetailsText({Key? key, required this.attributeName, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            attributeName,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(child: Text(data)),
      ],
    );
  }
}
