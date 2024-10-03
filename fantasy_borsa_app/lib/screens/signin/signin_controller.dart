import 'package:get/get.dart';

class SignInController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;


  void setEmail(String enteredEmail) {
    email.value = enteredEmail;
  }

   void setPassword(String enteredPassword) {
    password.value = enteredPassword;
  }
}