import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/component/input_text_button.dart';
import 'package:flutter_ecommerce/component/input_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                "Hoş Geldiniz",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Devam etmek için giriş yapın",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                ),
              ),
              Spacer(flex: 3),
              InputTextField(title: "E-Mail"),
              SizedBox(height: 10),
              InputTextField(title: "Şifre",obsecureText: true),
              SizedBox(height: 10),
              Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Şifreni mi unuttun ?",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
              ),
              const Spacer(flex: 3),
              InputTextButton(title: "Giriş Yap", onClick: () {}),
              const Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }
}
