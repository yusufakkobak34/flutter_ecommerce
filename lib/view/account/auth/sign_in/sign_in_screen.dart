import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/component/input_outline_button.dart';
import 'package:flutter_ecommerce/component/input_text_button.dart';
import 'package:flutter_ecommerce/component/input_text_field.dart';
import 'package:flutter_ecommerce/controller/controllers.dart';
import 'package:flutter_ecommerce/extention/string_extention.dart';
import 'package:flutter_ecommerce/view/account/auth/sign_up/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text(
                  "Hoş Geldiniz",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Devam etmek için giriş yapın",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),
                ),
                const Spacer(flex: 3),
                InputTextField(
                    title: "E-Mail",
                    textEditingController: emailController,
                    validation: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Bu alan boş bırakılamaz";
                      } else if (!value.isValidEmail) {
                        return "Lütfen geçerli bir e-mail adresi girin";
                      }
                    }),
                const SizedBox(height: 10),
                InputTextField(
                    title: "Şifre",
                    obsecureText: true,
                    textEditingController: passwordController,
                    validation: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Bu alan boş bırakılamaz";
                      }
                      return null;
                    }),
                const SizedBox(height: 10),
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
                const Spacer(),
                InputTextButton(
                  title: "Giriş Yap",
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      authController.signIn(
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  },
                ),
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
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text(
                        "Ben yeni bir kullanıcıyım",
                        style: TextStyle(
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
      ),
    );
  }
}
