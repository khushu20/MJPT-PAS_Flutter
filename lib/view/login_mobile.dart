import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mjpt_pas/res/Routes/App_routes.dart';
import 'package:mjpt_pas/res/app_alerts/custom_error_alert.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_button_component.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_text.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_textfield.dart';
import 'package:mjpt_pas/utils/deviceid.dart';
import 'package:mjpt_pas/utils/internet_check.dart';
import 'package:mjpt_pas/viewmodel/login_mobile_view_model.dart';
import 'package:provider/provider.dart';

import '../model/login_mobile_response.dart';
import '../res/app_colors/app_colors.dart';
import '../res/components/reusable widgets/app_toast.dart';
import '../res/constants/image_constants.dart';

import '../res/string_constants/string_constants.dart';

class LoginMobile extends StatelessWidget {
  LoginMobile({super.key});
  TextEditingController _mobile = TextEditingController();
  LoginData? loginMobileData;
  @override
  Widget build(BuildContext context) {
    final loginViewModel =
        Provider.of<LoginMobileViewModel>(context, listen: false);
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
                      height: MediaQuery.of(context).size.height * 0.6,
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
                              height: 50,
                            ),
                            AppInputTextfield(
                              texteditingcontroller: _mobile,
                              labeltext: AppStrings.mobileNo,
                              input_type: TextInputType.number,
                              maxlength: 10,
                              inputFormatters: [
                                new FilteringTextInputFormatter.allow(
                                    RegExp("[0-9]")),
                              ],
                              onEditingComplete: () {
                                FocusScope.of(context).unfocus();
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            AppInputButtonComponent(
                              buttonText: AppStrings.login,
                              //color: Color.fromARGB(255, 63, 16, 10),
                              onPressed: () async {
                                bool isConnected = await InternetCheck()
                                    .hasInternetConnection();
                                if (isConnected) {
                                  if (mobileValidations()) {
                                    loginMobileData =
                                        await loginViewModel.loginMobileService(
                                            context, _mobile.text.toString());
                                  }
                                } else {
                                  CustomErrorAlert(
                                      descriptions:
                                          AppStrings.plz_internet_check,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      Img: AssetPath.bg_image);
                                /*   AppToast()
                                      .showToast(AppStrings.plz_internet_check); */
                                }
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, AppRoutes.login);
                                },
                                child: AppInputText(
                                  text: AppStrings.login_username_password,
                                  fontsize: 16,
                                )),
                          ],
                        ),
                      ),
                    )),
              ),
            ]),
      ),
    );
  }

  bool mobileValidations() {
    if (_mobile.text.isEmpty) {
      AppToast().showToast(AppStrings.mobilenumber_empty);
      return false;
    } else if (_mobile.text.length != 10) {
      AppToast().showToast(AppStrings.mobilenumber_invalid);
      return false;
    } else if (!RegExp(r'^([6-9]{1})([0-9]{9})$').hasMatch(_mobile.text)) {
      AppToast().showToast(AppStrings.mobilenumber_invalid);
      return false;
    }
    return true;
  }
}
