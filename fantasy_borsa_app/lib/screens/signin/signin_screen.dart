import 'package:fantasy_borsa_app/components/custom_image_button.dart';
import 'package:fantasy_borsa_app/components/button.dart';
import 'package:fantasy_borsa_app/screens/signin/signin_controller.dart';
import 'package:fantasy_borsa_app/utils/colors.dart';
import 'package:fantasy_borsa_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final _signinController = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomImageButton(onTap: () => Get.back(), path: 'assets/images/back_icon.png'),
        title: const Text('Giriş Yap', style: SignInScreenTextStyles.appBarTitle,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Email',
                    style: SignInScreenTextStyles.authInputTitle,
                  ),
                 TextField(
                    onChanged: (enteredEmail) {
                      _signinController.setEmail(enteredEmail);
                    },
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                     keyboardType: TextInputType.emailAddress,
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
                    style: SignUpScreenTextStyles.authFormInput,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Şifre',
                    style: SignInScreenTextStyles.authInputTitle,
                  ),
                 TextField(
                    onChanged: (enteredPassword) {
                      _signinController.setPassword(enteredPassword);
                    },
                    obscureText: true,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
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
                    style: SignUpScreenTextStyles.authFormInput,
                  ),
                ],
              ),
            ),
            Button(
              buttonTitle: 'Devam',
              onTap: () {},
              color: AppColors.primarPurple,
              disabled: false,
              textStyle: SignInScreenTextStyles.continueButtonText,
              margin: const EdgeInsets.symmetric(vertical: 12),
            ),
          ],
        ),
      ),
    );
  }
}
