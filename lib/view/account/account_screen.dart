import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
        Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage("assets"),
            )
          ],
        ),
        ],
      ),
    );
  }
}
