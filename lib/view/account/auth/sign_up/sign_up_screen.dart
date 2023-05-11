import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/component/input_text_button.dart';
import 'package:flutter_ecommerce/component/input_text_field.dart';
import 'package:flutter_ecommerce/controller/controllers.dart';
import 'package:flutter_ecommerce/extention/string_extention.dart';
import 'package:flutter_ecommerce/view/account/auth/sign_in/sign_in_screen.dart';
import '../../../../component/input_outline_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
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
                InputTextField(
                    title: "Tam Adınız",
                    textEditingController: fullNameController,
                    validation: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Bu alan boş bırakılamaz";
                      }
                      return null;
                    }),
                const SizedBox(height: 10),
                InputTextField(
                    title: "E-Mail",
                    textEditingController: emailController,
                    validation: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Bu alan boş bırakılamaz";
                      } else if (!value.isValidEmail) {
                        return "Lütfen geçerli bir e-mail adresi girin";
                      }
                      return null;
                    }),
                const SizedBox(height: 10),
                InputTextField(
                    title: "Şifre",
                    obsecureText: true,
                    textEditingController: passwordController,
                    validation: (String? value) {
                      List<String> _validation = [];
                      if (value == null || value.isEmpty) {
                        return "Bu alan boş bırakılamaz";
                      } else {
                        if (!value.isValidPasswordHasNumber) {
                          _validation.add("Şifreniz bir numara içermeli");
                        }
                        if (!value.isValidPasswordHasCapitalLetter) {
                          _validation.add("Şifreniz bir büyük harf içermeli");
                          if (!value.isValidPasswordHasLowerCaseLetter) {
                            _validation.add("Şifreniz bir küçük harf içermeli");
                          }
                          if (!value.isValidPasswordHasSpecialCharacter) {
                            _validation.add(
                                "Şifreniz bir özel karakter içermeli [! @ = \$ %]");
                          }
                        }
                      }
                      String msg = '';
                      if (_validation.isNotEmpty) {
                        for (var i = 0; i < _validation.length; i++) {
                          msg = (msg + _validation[i]);
                          if ((1 + 1) != _validation.length) {
                            msg = msg + "\n";
                          }
                        }
                      }
                      return msg.isNotEmpty ? msg : null;
                    }),
                const SizedBox(height: 10),
                InputTextField(
                    title: "Şifreyi doğrulayın",
                    obsecureText: true,
                    textEditingController: confirmController,
                    validation: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Bu alan boş bırakılamaz";
                      } else if (passwordController.text != value) {
                        return "Şifreler eşleşmiyor";
                      }
                      return null;
                    }),
                const SizedBox(height: 10),
                const Spacer(),
                InputTextButton(
                  title: "Kaydol",
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      authController.signUp(
                        fullName: fullNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
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
