import 'package:fantasy_borsa_app/screens/signup/signup_controller.dart';
import 'package:fantasy_borsa_app/utils/colors.dart';
import 'package:fantasy_borsa_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpAuthForm extends StatelessWidget {
  SignUpAuthForm({super.key});
  final _signupController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Email',
            style: SignUpScreenTextStyles.authInputTitle,
          ),
         Obx(() =>  TextField(
            onChanged: (enteredEmail) {
              final isValidEnteredEmail = enteredEmail.trim().isNotEmpty &&
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(enteredEmail);
              _signupController.setValidEmail(isValidEnteredEmail);
              _signupController.setEmail(enteredEmail);
            },
            autocorrect: false,
            textCapitalization: TextCapitalization.none,
             keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              suffixIcon: _signupController.isValidEmail.value
                  ? const Icon(
                      Icons.check_circle_rounded,
                      color: AppColors.primarPurple,
                    )
                  : null,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primarPurple,
                  width: 1.0,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primarPurple,
                  width: 1.0,
                ),
              ),
            ),
            style: SignUpScreenTextStyles.authFormInput,
          ),),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Şifre',
            style: SignUpScreenTextStyles.authInputTitle,
          ),
         Obx(() =>  TextField(
            onChanged: (enteredPassword) {
               final isValidEnteredPassword = enteredPassword.length > 7;
              _signupController.isValidPassword(isValidEnteredPassword);
              _signupController.setPassword(enteredPassword);
            },
            obscureText: _signupController.displayPassword.value,
            autocorrect: false,
            textCapitalization: TextCapitalization.none,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  _signupController.displayPassword.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColors.gray,
                ),
                onPressed: () {
                  _signupController.setDisplayPassword();
                },
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primarPurple,
                  width: 1.0,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primarPurple,
                  width: 1.0,
                ),
              ),
            ),
            style: SignUpScreenTextStyles.authFormInput,
          ),),
        ],
      ),
    );
  }
}
