import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mjpt_pas/res/app_alerts/custom_error_alert.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_button_component.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_text.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_toast.dart';
import 'package:mjpt_pas/utils/internet_check.dart';
import 'package:mjpt_pas/viewmodel/update_mpin_viewmodel.dart';
import 'package:provider/provider.dart';

import '../res/app_colors/app_colors.dart';
import '../res/constants/image_constants.dart';
import '../res/string_constants/string_constants.dart';

class SetMpin extends StatelessWidget {
  SetMpin({super.key});
  TextEditingController _mpin = TextEditingController();
  TextEditingController _confirmMpin = TextEditingController();
  @override
  Widget build(BuildContext context) {
     final updateMpinViewmodel =
        Provider.of<UpdateMpinViewModel>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: Container(
        color: AppColors.PRIMARY_COLOR_DARK,
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
            image: AssetImage(AssetPath.bg_image),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
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
                              text: AppStrings.set_mpin,
                              fontsize: 24,
                              fontweight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppInputText(
                              text: AppStrings.generate_mpin,
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
                              controller: _mpin,
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
                              height: 12,
                            ),
                            AppInputText(
                              text: AppStrings.confirm_mpin,
                              fontsize: 16,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            PinCodeFields(
                              length: 4,
                              fieldBorderStyle: FieldBorderStyle.square,
                              controller: _confirmMpin,
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
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppInputButtonComponent(
                              onPressed: () async {
                                   bool isConnected = await InternetCheck()
                                    .hasInternetConnection();
                                if (mpinValidations()) {
                                  if (isConnected) {
                                    updateMpinViewmodel.updateMpinService(
                                        context, _confirmMpin.text.toString(),"");
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return CustomErrorAlert(
                                            descriptions:
                                                AppStrings.plz_internet_check,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            Img: AssetPath.error);
                                      },
                                    );
                                  }
                                }
                              },
                              buttonText: AppStrings.confirm,
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

  bool mpinValidations() {
    if (_mpin.text.isEmpty) {
       AppToast().showToast(AppStrings.plz_enter_mpin);
       return false;
    } else if (_mpin.text.length != 4) {
             AppToast().showToast(AppStrings.plz_enter_4digitMpin);

       return false;

    }  else if (_mpin.text.toString()=="0000") {
             AppToast().showToast(AppStrings.plz_enter_validmpin);

       return false;
    }
    else if (_confirmMpin.text.isEmpty) {
                   AppToast().showToast(AppStrings.plz_enter_cmpin);

       return false;
    } else if (_confirmMpin.text.length != 4) {
        AppToast().showToast(AppStrings.plz_enter_4digitCMpin);
       return false;
    } else if (_mpin.text.toString() != _confirmMpin.text.toString()) {
             AppToast().showToast(AppStrings.plz_enter_validmpin);

      return false;
    }
    return true;
  }
}
