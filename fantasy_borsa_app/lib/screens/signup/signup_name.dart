
import 'package:fantasy_borsa_app/screens/signup/signup_controller.dart';
import 'package:fantasy_borsa_app/utils/colors.dart';
import 'package:fantasy_borsa_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpName extends StatelessWidget {
  SignUpName({super.key});

  final _signupController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'İsminiz nedir?',
            style: SignUpScreenTextStyles.nameInputTitle,
            textAlign: TextAlign.start,
          ),
          TextField(
            onChanged: (enteredName) {
              _signupController.setName(enteredName);
            },
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primarPurple,
                  width: 1.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primarPurple,
                  width: 1.0,
                ),
              ),
            ),
            style: SignUpScreenTextStyles.nameInput,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
