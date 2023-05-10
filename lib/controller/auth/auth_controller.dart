import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<User> user = Rxn<User>();

  @override
  void onInit() async {
    super.onInit();
  }

}
