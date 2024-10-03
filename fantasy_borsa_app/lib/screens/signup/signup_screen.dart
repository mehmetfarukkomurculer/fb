import 'package:fantasy_borsa_app/components/custom_image_button.dart';
import 'package:fantasy_borsa_app/components/button.dart';
import 'package:fantasy_borsa_app/screens/signup/signup_authform.dart';
import 'package:fantasy_borsa_app/screens/signup/signup_birthdate.dart';
import 'package:fantasy_borsa_app/screens/signup/signup_controller.dart';
import 'package:fantasy_borsa_app/screens/signup/signup_dot_indicator.dart';
import 'package:fantasy_borsa_app/screens/signup/signup_name.dart';
import 'package:fantasy_borsa_app/utils/colors.dart';
import 'package:fantasy_borsa_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final List<Widget> _pages = [
    SignUpName(),
    SignUpBirthdate(),
    SignUpAuthForm(),
  ];

  final _signUpController = Get.put(SignUpController());
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return SignUpDotIndicator(
            currentPage: _signUpController.currentPage.value,
            pageCount: _pages.length,
          );
        }),
        centerTitle: true,
        leading: CustomImageButton(
          onTap: (){
            if(_signUpController.currentPage.value == 0){
              Get.back();
            }else{
              _signUpController.decrement();
              _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
            }
          },
          path: 'assets/images/back_icon.png',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  _signUpController.currentPage.value = index;
                },
                itemBuilder: (BuildContext context, int index) {
                  return _pages[index];
                },
                itemCount: _pages.length,
              ),
            ),
            Obx(() => Button(
              buttonTitle: 'Devam',
              onTap: () {
                if (_signUpController.currentPage.value < _pages.length - 1) {
                    _signUpController.increment();
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                  else if(_signUpController.currentPage.value == _pages.length -1){
                    // sign up process
                  }
              },
              color: AppColors.primarPurple,
              disabled: (_signUpController.currentPage.value == 0 && _signUpController.name.value.trim() == '') 
              || (_signUpController.currentPage.value == 1 && _signUpController.date.value == null) 
              || (_signUpController.currentPage.value == 2 && (_signUpController.isValidEmail.value == false  || _signUpController.isValidPassword.value == false)),
              textStyle: SignUpScreenTextStyles.continueButtonText,
              margin: const EdgeInsets.symmetric(vertical: 12),
            ),),
          ],
        ),
      ),
    );
  }
}
