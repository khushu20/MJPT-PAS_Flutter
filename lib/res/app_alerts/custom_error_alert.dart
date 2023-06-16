import 'package:flutter/material.dart';
import 'package:mjpt_pas/res/app_colors/app_colors.dart';
import 'package:mjpt_pas/res/string_constants/string_constants.dart';

import '../constants/app_constants.dart';

class CustomErrorAlert extends StatefulWidget {
  final String descriptions;
  final String? Buttontext;
  final String Img;
  final Color? imagebg;
  final Color? bgColor;
  final void Function()? onPressed;

  const CustomErrorAlert({
    Key? key,
    required this.descriptions,
    this.Buttontext,
    required this.onPressed,
    this.bgColor,
    required this.Img,
    this.imagebg,
  }) : super(key: key);

  @override
  _CustomErrorAlertState createState() => _CustomErrorAlertState();
}

class _CustomErrorAlertState extends State<CustomErrorAlert> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, top: 50, right: 10, bottom: 10),
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.black,
              borderRadius: BorderRadius.circular(0.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Version: ${AppConstants.version_number}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                AppStrings.appName,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.descriptions,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                        minimumSize: MaterialStateProperty.all(Size(220, 40)),
                        backgroundColor: MaterialStateProperty.all(
                            widget.bgColor ?? AppColors.white)),
                    onPressed: widget.onPressed,
                    child: Text(
                      widget.Buttontext ?? 'OK',
                      style: TextStyle(fontSize: 14),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: CircleAvatar(
              backgroundColor: widget.imagebg ?? Colors.white,
              radius: 35,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(45)),
                  child: Image.asset(
                    widget.Img,
                    // width: 100, height: 100,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
