import 'package:fantasy_borsa_app/components/button.dart';
import 'package:fantasy_borsa_app/components/image_button.dart';
import 'package:fantasy_borsa_app/utils/colors.dart';
import 'package:fantasy_borsa_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/app_logo.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'FantasyBorsa',
                textAlign: TextAlign.center,
                style: WelcomeScreenTextStyles.title
                    .copyWith(color: AppColors.primarPurple),
              ),
              Text(
                'Hoş Geldin',
                textAlign: TextAlign.center,
                style: WelcomeScreenTextStyles.title
                    .copyWith(color: AppColors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              /*const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla in odio luctus, feugiat risus sodales, tristique justo.',
                textAlign: TextAlign.center,
                style: WelcomeScreenTextStyles.subTitle,
              ),*/
              const Spacer(),
              ImageButton(
                buttonTitle: 'Google ile giriş yap',
                path: 'assets/images/google.png',
                onTap: () {},
                color: AppColors.white,
                disabled: false,
                textStyle: WelcomeScreenTextStyles.googleButtonText,
                margin: const EdgeInsets.only(bottom: 8),
              ),
              Button(
                buttonTitle: 'Kayıt Ol',
                onTap: () {
                  Get.toNamed('signUp');
                },
                color: AppColors.primarPurple,
                disabled: false,
                textStyle: WelcomeScreenTextStyles.signUpButtonText,
                margin: const EdgeInsets.only(bottom: 8),
              ),
              Button(
                buttonTitle: 'Giriş Yap',
                onTap: () {
                  Get.toNamed('signIn');
                },
                color: AppColors.lightPurple,
                disabled: false,
                textStyle: WelcomeScreenTextStyles.signInButtonText,
                margin: const EdgeInsets.only(bottom: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
