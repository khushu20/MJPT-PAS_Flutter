import 'package:flutter/material.dart';

class AppInputButtonComponent extends StatelessWidget {
  AppInputButtonComponent(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.color});
  final void Function() onPressed;
  final String buttonText;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor:color, 
        ),
        /* style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              color), 
              // Replace with your desired color
        ), */
        onPressed: onPressed,
        child: Text(buttonText, style: TextStyle(fontSize: 16),),
      ),
    );
  }
}
