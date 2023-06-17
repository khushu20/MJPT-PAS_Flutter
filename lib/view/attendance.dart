import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mjpt_pas/res/app_colors/app_colors.dart';
import 'package:mjpt_pas/res/components/base_scaffold.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_button_component.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_text.dart';
import 'package:mjpt_pas/res/string_constants/string_constants.dart';

import '../res/components/reusable widgets/app_input_flat_button.dart';
import '../res/constants/image_constants.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

Color button1Color = Colors.green;
bool button1Enabled = true;
Color button2Color = Colors.grey;
bool button2Enabled = false;
List<Map> SampleList = [
  {
    "punchin": "10:45",
    "punchout": "12:45",
    "punchinarea": "Gachibowli",
    "punchoutarea": "Gachibowli",
    "time": "2:00 ",
  }
];

class _AttendanceState extends State<Attendance> {
   late Timer _timer;
  int _start = 120;
  bool flag = true;

  String get timerString {
  int minutes = (_start / 60).floor();
  int seconds = _start % 60;
  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = seconds.toString().padLeft(2, '0');
  return '$minutesStr:$secondsStr';
}
  startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            setState(() {
              flag = false;
              // otp_del();
              // AppConstants.otp_death_certificate = '';
              //widget.birth_deathOTP = '';
            });
          } else {
            _start = _start - 1;
            //print('validate1212 ${validateOTP}');
          }
        },
      ),
    );
  }
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((_) {
      startTimer();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      AppBarvis: true,
      backgroundImageVisible: false,
      titleName: AppStrings.attendance,
      //bottomSheetVis: false,
      bottomsheet: 
          Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: AppInputFlatButton(
              onPressed: button1Enabled ? _onButton1Pressed : null,
              buttonText: "PUNCH IN",
              color: button1Color,
              icon: Icons.arrow_upward_outlined,
            )),
            Expanded(
                child: AppInputFlatButton(
              onPressed: button2Enabled ? _onButton2Pressed : null,
              buttonText: "PUNCH OUT",
              color: button2Color,
              icon: Icons.arrow_downward_outlined,
            )),
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            width: double.infinity,
            child: Card(
              color: AppColors.PRIMARY_COLOR_DARK,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: flag,
                        child: AppInputText(
                                          text: "$timerString",
                                          fontsize: 20,
                                          color: AppColors.white,
                                        ),
                      ),
                    ],
                  ),
                  AppInputText(
                    text: "RAJASHEKAR",
                    fontsize: 20,
                    color: AppColors.white,
                  ),
                  AppInputText(
                    text: "Trained Graduate Teacher",
                    fontsize: 16,
                    color: AppColors.white,
                  ),
                  AppInputText(
                    text: "600669",
                    fontsize: 16,
                    color: AppColors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            AssetPath.timer,
                            fit: BoxFit.cover,
                            color: AppColors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AppInputText(
                            text: "PUNCH IN",
                            fontsize: 18,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AssetPath.timer,
                            fit: BoxFit.cover,
                            color: AppColors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AppInputText(
                            text: "PUNCH OUT",
                            fontsize: 18,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: SampleList.length,
            itemBuilder: (context, index) {
              final sampleList = SampleList[index];
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    //height: MediaQuery.of(context).size.height * 0.15,
                    width: double.infinity,
                    child: Card(
                      //margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            color: Color.fromARGB(255, 32, 30, 30), width: 1),
                      ),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.35,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.green, width: 3),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      //color: Colors.green,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.arrow_right_alt_outlined, color: AppColors.green,),
                                        AppInputText(
                                          text: sampleList["punchin"],
                                          fontsize: 20,
                                          textAlign: TextAlign.center,
                                          color: AppColors.green,
                                        ),
                                      ],
                                    )),
                                Container(
                                    //height: 100,
                                    width:
                                        MediaQuery.of(context).size.width * 0.35,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.Red, width: 3),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      //color: Colors.green,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.arrow_right_alt_outlined, color: AppColors.Red,),
                                        AppInputText(
                                          text: sampleList["punchin"],
                                          fontsize: 20,
                                          textAlign: TextAlign.center,
                                          color: AppColors.Red,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AssetPath.in_office,
                                      fit: BoxFit.cover,
                                      height: 20,
                                    ),
                                    AppInputText(
                                      text: sampleList["punchinarea"],
                                      fontsize: 20,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AssetPath.in_office,
                                      fit: BoxFit.cover,
                                      height: 20,
                                    ),
                                    AppInputText(
                                      text: sampleList["punchinarea"],
                                      fontsize: 20,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppInputText(
                                    text: "Duration",
                                    fontsize: 20,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.35,
                                    height:
                                        MediaQuery.of(context).size.height * 0.05,
                                    //color: Color.fromARGB(255, 61, 59, 59),
                      
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: const Color.fromARGB(
                                          255, 226, 218, 218),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SvgPicture.asset(
                                          AssetPath.timer,
                                          fit: BoxFit.cover,
                                        ),
                                        AppInputText(text: sampleList["time"], fontsize: 16,)
                                      ],
                                    ),
                                  )
                                ]),
                                SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void _onButton1Pressed() {
    setState(() {
      button1Color = Colors.grey;
      button1Enabled = false;
      button2Color = Colors.red;
      button2Enabled = true;
    });
    print('Button 1 pressed');
  }

  void _onButton2Pressed() {
    setState(() {
      button1Color = Colors.green;
      button1Enabled = true;
      button2Color = Colors.grey;
      button2Enabled = false;
    });
    print('Button 2 pressed');
  }
}
