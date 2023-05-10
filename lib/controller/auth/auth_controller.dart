import 'package:flutter_ecommerce/model/user.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<User> user = Rxn<User>();

  @override
  void onInit() async {
    super.onInit();
  }

  void signUp({required String fullName,required String email,required String password}) async {
   try{

   } finally {
    
   }
  }

}
