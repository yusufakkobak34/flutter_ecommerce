import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ecommerce/model/user.dart';
import 'package:flutter_ecommerce/service/local_remote_service/local_auth_service.dart';
import 'package:flutter_ecommerce/service/remote_service/remote_auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<User> user = Rxn<User>();
  final LocalAuthService _localAuthService = LocalAuthService();

  @override
  void onInit() async {
    super.onInit();
  }

  void signUp(
      {required String fullName,
      required String email,
      required String password}) async {
    try {
      EasyLoading.show(
        status: 'Yükleniyor...',
        dismissOnTap: false,
      );
      var result = await RemoteAuthService().signUp(
        email: email,
        password: password,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await RemoteAuthService()
            .createProfile(fullName: fullName, token: token);
        if (userResult.statusCode == 200) {
          EasyLoading.showSuccess("Uygulamaya hoş geldiniz");
          Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError(
              "Yolunda gitmeyen bir şey oldu,lütfen daha sonra tekrar deneyin");
        }
      } else {
        EasyLoading.showError(
            "Yolunda gitmeyen bir şey oldu,lütfen daha sonra tekrar deneyin");
      }
    } finally {
      EasyLoading.dismiss();
    }
  }
}
