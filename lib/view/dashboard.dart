import 'package:flutter/material.dart';
import 'package:mjpt_pas/model/dashboard_menu_response.dart';

import 'package:mjpt_pas/res/app_colors/app_colors.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_text.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/custom_appbar.dart';
import 'package:mjpt_pas/res/constants/image_constants.dart';
import 'package:mjpt_pas/res/constants/shared_pref_consts.dart';
import 'package:mjpt_pas/view/view_list/dashboard_menu_list.dart';
import 'package:mjpt_pas/viewmodel/dashboard_viewmodel.dart';
import 'package:provider/provider.dart';

import '../model/login_mobile_response.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<DashboardMenuList>? dashboardMenuList = [];
  LoginData? loginMobileData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          titleIs: "Dashboard",
          action: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.exit_to_app),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
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
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppInputText(
                          text: loginMobileData?.employeeName ?? '',
                          fontsize: 18,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppInputText(
                          text: loginMobileData!.employeeName ?? '',
                          fontsize: 14,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppInputText(
                          text: loginMobileData?.designation ?? '',
                          fontsize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DashboardGridView(
                      items: dashboardMenuList ?? [],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: AppColors.PRIMARY_COLOR_DARK,
              image: DecorationImage(
                  image: AssetImage(AssetPath.footer_png), fit: BoxFit.cover)),
          width: MediaQuery.of(context).size.width,
          height: 40,
          //color: AppColors.footerColor,
        ));
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      DashboardMenuList dashboardMenu = DashboardMenuList();
      dashboardMenu.employeeId = 0;
      dashboardMenu.serviceName = "ajjaja";
      dashboardMenu.employeeId = 0;
      dashboardMenu.serviceName = "ajjaja";
      dashboardMenuList?.add(dashboardMenu);
    });
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final dashboardViewmodel =
          Provider.of<DashboardViewModel>(context, listen: false);
          loginMobileData = await dashboardViewmodel
          .getLoginInfo(SharedPrefConstants.loginResponse);
      //await dashboardViewmodel.dashboardService(context, loginMobileData);
      
      setState(() {
       // dashboardMenuList = dashboardViewmodel.getDashboardList;
       
      });
    }); 
  }
}
