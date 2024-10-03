import 'package:get/get.dart';

class SignUpController extends GetxController {
  
  RxString name = ''.obs;
  Rx<DateTime?> date = Rx<DateTime?>(null);
  RxInt currentPage = 0.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxBool isValidEmail = false.obs;
  RxBool isValidPassword = false.obs;
  RxBool displayPassword = true.obs;

  void setName (String enteredName) {
    name.value = enteredName;
  }

  void setDate(DateTime? pickedDate) {
    if(pickedDate != null){
      date.value = pickedDate;
    }
  }

  void increment(){
    currentPage.value++;
  }

  void decrement(){
    currentPage.value--;
  }


  void setEmail (String enteredEmail) {
    email.value = enteredEmail;
  }

  void setValidEmail(bool isValidEnteredEmail){
    isValidEmail.value = isValidEnteredEmail;
  }

  void setPassword (String enteredPassword) {
    password.value = enteredPassword;
  }

   void setValidPassword(bool isValidEnteredPassword){
    isValidPassword.value = isValidEnteredPassword;
  }

  void setDisplayPassword() {
    displayPassword.value = !displayPassword.value;
  }
}