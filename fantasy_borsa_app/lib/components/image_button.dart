
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton(
      {super.key,
      required this.buttonTitle,
      required this.path,
      required this.onTap,
      required this.color,
      required this.disabled,
      required this.textStyle,
      this.margin, this.padding,});

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final String buttonTitle;
  final String path;
  final Color color;
  final bool disabled;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: ElevatedButton(
        onPressed: disabled ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(path, width: 25, height: 25,),
            const SizedBox(width: 8,),
            Text(
              buttonTitle,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}