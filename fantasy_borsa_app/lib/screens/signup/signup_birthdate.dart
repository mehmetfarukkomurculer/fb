import 'package:fantasy_borsa_app/components/custom_image_button.dart';
import 'package:fantasy_borsa_app/screens/signup/signup_controller.dart';
import 'package:fantasy_borsa_app/utils/colors.dart';
import 'package:fantasy_borsa_app/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpBirthdate extends StatelessWidget {
  SignUpBirthdate({super.key});
  final _signupController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    void _presentDatePicker() async {
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now(),
      );
      _signupController.setDate(pickedDate);
    }

    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Doğum Tarihinizi Seçiniz',
            style: SignUpScreenTextStyles.birthdateInputTitle,
            textAlign: TextAlign.start,
          ),
          Row(
            children: [
              const Spacer(),
              Obx(
                
                () => Text(
                    _signupController.date.value != null
                        ? '${_signupController.date.value?.day}/${_signupController.date.value?.month}/${_signupController.date.value?.year}'
                        : '',
                    style: SignUpScreenTextStyles.birthdateInput),
              ),
              const Spacer(),
              CustomImageButton(
                  onTap: _presentDatePicker,
                  path: 'assets/images/calendar_icon.png'),
            ],
          ),
          const Divider(color: AppColors.primarPurple, thickness: 2),
        ],
      ),
    );
  }
}
