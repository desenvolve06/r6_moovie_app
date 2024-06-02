import 'package:flutter/material.dart';

class TextList extends StatelessWidget {
  final List<String> items;

  const TextList(
      {super.key, required this.items, required TextOverflow overflow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var item in items)
            Text(
              item,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}
