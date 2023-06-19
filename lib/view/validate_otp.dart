import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mjpt_pas/data/local_store_helper.dart';
import 'package:mjpt_pas/model/login_mobile_response.dart';
import 'package:mjpt_pas/res/Routes/App_routes.dart';
import 'package:mjpt_pas/res/app_alerts/custom_error_alert.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_button_component.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_text.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_toast.dart';
import 'package:mjpt_pas/res/constants/shared_pref_consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../res/constants/image_constants.dart';
import '../res/string_constants/string_constants.dart';

class ValidateOtp extends StatefulWidget {
  ValidateOtp({super.key});
  TextEditingController _otp = TextEditingController();
  @override
  State<ValidateOtp> createState() => _ValidateOtpState();
}

class _ValidateOtpState extends State<ValidateOtp> {
  TextEditingController _otp = TextEditingController();
  String mobileOtp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: Container(
        color: Color.fromARGB(255, 63, 16, 10),
        height: MediaQuery.of(context).size.height * 0.06,
        child: SvgPicture.asset(
          AssetPath.footer,
          width: double.infinity,
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: //SvgPicture.asset(AssetPath.bg),
                AssetImage(AssetPath.bg_image),
            // AssetImage("assets/zoo_bg_transparent.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.white,
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.65,
                      /* decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                      ), */
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.14,
                              child: SvgPicture.asset(
                                AssetPath.app_logo,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppInputText(
                              text: AppStrings.verification_code,
                              fontsize: 24,
                              fontweight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppInputText(
                              text: AppStrings.verification_code_text,
                              fontsize: 15,
                              fontweight: FontWeight.normal,
                              color: Colors.black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            PinCodeFields(
                              length: 4,
                              fieldBorderStyle: FieldBorderStyle.square,
                              controller: _otp,
                              responsive: false,
                              fieldHeight: 40.0,
                              fieldWidth: 40.0,
                              borderWidth: 1.0,
                              //obscureCharacter: ".",
                              obscureText: true,
                              activeBorderColor:
                                  Color.fromARGB(255, 43, 17, 17),
                              activeBackgroundColor: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              keyboardType: TextInputType.number,
                              autoHideKeyboard: true,
                              fieldBackgroundColor: Colors.black12,
                              borderColor: Color.fromARGB(255, 43, 17, 17),
                              textStyle: TextStyle(
                                color: Color.fromARGB(255, 43, 17, 17),
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),

                              onComplete: (mpinOutput) {
                                // Your logic with pin code
                                print(mpinOutput);
                                /* widget.textEditingController.text = mpinOutput;
                                otp_textcontrol =
                                    widget.textEditingController.text;
                                print(
                                    'otp val ${widget.textEditingController.text}');
                                print('otp val is ${otp_textcontrol}'); */
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      if(!mobileOtp.isEmpty){
                                        if(mobileOtp==_otp.text.toString()){
                                           Navigator.pushNamed(
                                          context, AppRoutes.setMpin);
                                        }else{
                                           showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions:AppStrings.plz_enter_validotp ,
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.error);
            },);
                                        }
                                      }
                                      /*  */
                                    },
                                    child: AppInputText(
                                      text: AppStrings.resend_otp,
                                      fontsize: 16,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AppInputButtonComponent(
                              onPressed: () {},
                              buttonText: AppStrings.validate,
                              //color: Color.fromARGB(255, 63, 16, 10),
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            ]),
      ),
    );
  }

  bool otpValidations() {
    if (_otp.text.isEmpty) {
      AppToast().showToast(AppStrings.plz_enter_otp);
      return false;
    } else if (_otp.text.length!=4) {
      AppToast().showToast(AppStrings.plz_enter_4digitotp);
      return false;
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String otp =
          await LocalStoreHelper().readTheData(SharedPrefConstants.otpMobile);

      setState(() {
        mobileOtp = otp;
      });
    });
  }
}
