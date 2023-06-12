import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mjpt_pas/res/components/base_scaffold.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_button_component.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_text.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_textfield.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_textformfield.dart';

import '../res/Routes/App_routes.dart';
import '../res/constants/image_constants.dart';
import '../res/string_constants/string_constants.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final _formKey = GlobalKey<FormState>();
  FocusScopeNode _node = FocusScopeNode();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
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
                              height: 20,
                            ),
                            AppInputTextfield(
                                texteditingcontroller: _username,
                                labeltext: AppStrings.UserName,
                                input_type: TextInputType.name),
                            AppInputTextfield(
                              texteditingcontroller: _password,
                              labeltext: AppStrings.Password,
                              input_type: TextInputType.name,
                              obsecuretext: true,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AppInputButtonComponent(
                              buttonText: AppStrings.LOGIN,
                              color: Color.fromARGB(255, 63, 16, 10),
                              onPressed: () {
                                print("ssdd");
                                Navigator.pushNamed(
                                    context, AppRoutes.ValidateMpin);
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppInputText(text: AppStrings.OR, fontsize: 16,),
                            SizedBox(
                              height: 10,
                            ),
                            AppInputButtonComponent(
                              buttonText: AppStrings.LOGIN_MOBILE,
                              color: Color.fromARGB(255, 63, 16, 10),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.LoginMobile);
                              },
                            ),
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
