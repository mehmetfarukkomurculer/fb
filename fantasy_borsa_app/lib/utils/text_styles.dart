import 'package:fantasy_borsa_app/utils/colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 20,
    color: Colors.red,
  );
}


extension WelcomeScreenTextStyles on TextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle subTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

 static const TextStyle googleButtonText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const TextStyle signUpButtonText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.lightPurple,
  );

  static const TextStyle signInButtonText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primarPurple,
  );
}

extension SignInScreenTextStyles on TextStyles {
  static const TextStyle continueButtonText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const TextStyle appBarTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static const TextStyle authInputTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );
}


extension SignUpScreenTextStyles on TextStyles {
  static const TextStyle continueButtonText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const TextStyle nameInputTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static const TextStyle nameInput = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const TextStyle birthdateInputTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static const TextStyle birthdateInput = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const TextStyle authInputTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static const TextStyle authFormInput = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

}



