import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:my_ghmc/ViewModel/splash_view_model.dart';
import 'package:my_ghmc/res/TextConstants/stringConstants.dart';
import 'package:my_ghmc/res/components/CustomAlerts/alert_single_button.dart';
import 'package:my_ghmc/res/constants/image_constants.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashView();
}

class _SplashView extends State<SplashView> {
  String Name = "";

  @override
  Widget build(BuildContext context) {
    //final ProviderForSplash = Provider.of<SplashViewModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage("assets/splashscreenghmc.png"),
              fit: BoxFit.fill),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    network();
  }
  

  network() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final ProviderForSplash =
            Provider.of<SplashViewModel>(context, listen: false);

        ProviderForSplash.versionCheck(
            AppStrings.username, AppStrings.password, context);
      });
    } else if (result == ConnectivityResult.none) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertWithSingleButton(
              Buttontext: AppStrings.MyGHMC_Ok,
              Img: AssetPath.alert_warning_yellow,
              descriptions: AppStrings.InterNet_check,
              imagebg: null,
              onPressed: () {
                Navigator.pop(context);
              },
              title: 'GHMC',
              bgColor: Colors.amber,
            );
          });

      print("Please check internet connection");
    }
  }
}
