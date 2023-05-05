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
              backgroundColor: Colors.grey,
              radius: 36,
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage("assets/user_image.png"),
              ),
            ),
            const SizedBox(width: 10,),
            Column(
              children: [
                Text("Hesabınıza giriş yapın",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 50),
        buildAccount(),
        ],
      ),
    );
  }

  Container buildAccount() {
    return Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 0.1,
              blurRadius: 7,
            ),
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Profil Bilgisi",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            Icon(Icons.keyboard_arrow_left_outlined)
          ],
        ),
      );
  }
}
