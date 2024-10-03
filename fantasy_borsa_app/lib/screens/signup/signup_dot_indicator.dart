import 'package:fantasy_borsa_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SignUpDotIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const SignUpDotIndicator({
    super.key,
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: currentPage == index ? 30.0 : 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: currentPage == index ? AppColors.primarPurple : AppColors.gray,
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }),
    );
  }
}