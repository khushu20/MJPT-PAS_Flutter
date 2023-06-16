import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mjpt_pas/res/Routes/App_routes.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_button_component.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_text.dart';
import 'package:provider/provider.dart';

import '../data/local_store_helper.dart';
import '../model/login_mobile_response.dart';
import '../model/validate_mpin_response.dart';
import '../res/app_colors/app_colors.dart';
import '../res/constants/image_constants.dart';
import '../res/constants/shared_pref_consts.dart';
import '../res/string_constants/string_constants.dart';
import '../viewmodel/validate_mpin_view_model.dart';

class ValidateMpin extends StatefulWidget {
  ValidateMpin({super.key});

  @override
  State<ValidateMpin> createState() => _ValidateMpinState();
}

class _ValidateMpinState extends State<ValidateMpin> {
  TextEditingController _mpin = TextEditingController();

  LoginData? args;

  String? entered_mPin;

  List<ValidateMpinData>? validateMpinData;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as LoginData;
    final ProviderForValidateMpin =
        Provider.of<ValidateMpinViewModel>(context, listen: false);

    print("111111 ${args!.otpMobile}");
    print("222222 ${args!.authToken}");
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
                              height: 30,
                            ),
                            AppInputText(
                              text: AppStrings.validate_mpin,
                              fontsize: 24,
                              fontweight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 20,
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
                                entered_mPin = mpinOutput;

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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, AppRoutes.login);
                                    },
                                    child: AppInputText(
                                      text: AppStrings.not_you,
                                      fontsize: 16,
                                    )),
                                GestureDetector(
                                    onTap: () async {
                                      await ProviderForValidateMpin.forgotMpin(
                                          context);
                                      Navigator.pushNamed(
                                          context, AppRoutes.login);
                                    },
                                    child: AppInputText(
                                      text: AppStrings.Forgot_mpin,
                                      fontsize: 16,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AppInputButtonComponent(
                              onPressed: () async {
                                setState(() {
                                  _mpin.text = '';
                                });
                                bool flag =
                                    ProviderForValidateMpin.mpinValidate(
                                        entered_mPin ?? '', context);
                                var mPin = await LocalStoreHelper()
                                    .readTheData(SharedPrefConstants.mPin);
                                var userid = await LocalStoreHelper()
                                    .readTheData(
                                        SharedPrefConstants.userId.toString());
                                print("mPin $mPin");
                                print("userid $userid");
                                if (flag == true) {
                                  validateMpinData =
                                      await ProviderForValidateMpin.mpinMatch(
                                          entered_mPin ?? '',
                                          mPin,
                                          args!.userId ?? 0,
                                          args!.authToken ?? '',
                                          context);
                                }
                                
                                
                                print(
                                    "roleName ${validateMpinData![0].roleName}");
                              },
                              buttonText: AppStrings.validate,
                              //color:Color.fromARGB(255, 63, 16, 10),
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
}
