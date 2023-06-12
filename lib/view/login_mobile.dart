import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mjpt_pas/res/Routes/App_routes.dart';
import 'package:mjpt_pas/res/components/base_scaffold.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_button_component.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_text.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_textfield.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_textformfield.dart';

import '../res/constants/image_constants.dart';
import '../res/string_constants/string_constants.dart';

class LoginMobile extends StatelessWidget {
  LoginMobile({super.key});
  TextEditingController _mobile = TextEditingController();
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
                              width: MediaQuery.of(context).size.width * 0.2,
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
                                labeltext: AppStrings.Mobile_Number,
                                input_type: TextInputType.name),
                            SizedBox(
                              height: 40,
                            ),
                            AppInputButtonComponent(
                              buttonText: AppStrings.LOGIN,
                              color: Color.fromARGB(255, 63, 16, 10),
                              onPressed: () {
                                print("ssdd");
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context,AppRoutes.LogIn);
                              },
                              child: AppInputText(text: AppStrings.login_username_password, fontsize: 16,)),
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
