import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/component/input_text_button.dart';
import 'package:flutter_ecommerce/component/input_text_field.dart';
import 'package:flutter_ecommerce/view/account/auth/sign_in/sign_in_screen.dart';
import '../../../../component/input_outline_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                "Hesap Oluştur,",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Başlamak için Kaydolun",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                ),
              ),
              const Spacer(flex: 3),
              const InputTextField(title: "Tam Adınız"),
              const SizedBox(height: 10),
              const InputTextField(title: "E-Mail"),
              const SizedBox(height: 10),
              const InputTextField(title: "Şifre", obsecureText: true),
              const SizedBox(height: 10),
              const InputTextField(title: "Şifreyi doğrulayın", obsecureText: true),
              const SizedBox(height: 10),
              const Spacer(),
              InputTextButton(title: "Kaydol", onClick: () {}),
              const SizedBox(height: 10),
              InputOutlineButton(
                  title: "Geri Dön",
                  onClick: () {
                    Navigator.of(context).pop();
                  }),
              const Spacer(flex: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hesabınız var mı ?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()));
                    },
                    child: const Text(
                      "Giriş Yap",
                      style:  TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
