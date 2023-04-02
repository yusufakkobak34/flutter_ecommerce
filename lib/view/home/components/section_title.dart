import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        Text(
          "Daha Fazlası",
          style: TextStyle(
            color: Colors.grey,
          ),
        )
        ],
      ),
    );
  }
}