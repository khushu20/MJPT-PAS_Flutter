import 'package:flutter/material.dart';
import 'package:mjpt_pas/res/app_colors/app_colors.dart';

class AppInputButtonComponent extends StatelessWidget {
  AppInputButtonComponent({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });
  final void Function() onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(colors: [
            AppColors.PRIMARY_COLOR_LIGHT,
            AppColors.PRIMARY_COLOR_DARK,
          ])),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.transparent,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
