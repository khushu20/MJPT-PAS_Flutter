import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Routes/App_routes.dart';
import '../constants/image_constants.dart';

// ignore: must_be_immutable
class BaseScaffold extends StatefulWidget {
  BaseScaffold(
      {this.key,
      this.child,
      this.bottomsheet,
      this.resize,
      this.appBar,
      this.endDrawer,
      this.routeName,
      this.titleName,
      this.color,
      this.extendBodyBehindAppBar,
      this.vis,
      this.drawerContent,
      this.AppBarvis,
      this.appBarSize, this.backArrowFlag, this.sidebarVis});
  final Widget? child;
  final Widget? bottomsheet;
  final bool? resize;
  final bool? vis;
  final Key? key;
  final bool? sidebarVis;
  final bool? AppBarvis;
  final bool? backArrowFlag;
  final bool? extendBodyBehindAppBar;
  final AppBar? appBar;
  final Widget? endDrawer;
  final Widget? drawerContent;
  final String? routeName;
  final String? titleName;
  Color? color;
  final double? appBarSize;
  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}
class _BaseScaffoldState extends State<BaseScaffold> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      /* backgroundImage = await LocalStoreHelper()
          .readTheData(SharedPrefConstants.backgroundImage);
      print("sdfbhbdsjdfhs347883 $themeColor");
      setState(() {}); */
    });
  }

  Color? themeColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar ?? false,
      drawer: Visibility(
        visible: widget.sidebarVis ?? false,
        child: Drawer(
          child: widget.drawerContent,
        ),
      ),
      key: widget.key,
      //endDrawer: widget.endDrawer,
      resizeToAvoidBottomInset: widget.resize,
      bottomSheet: widget.vis == true
          ? Image.asset(
          AssetPath.footer,
          width: double.infinity,
          height: 40,
        )
          : widget.bottomsheet,
      appBar: widget.AppBarvis == true
          ? PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: AppBar(
                leading: IconButton(
                    onPressed: () {
                      // ProviderForPropertyTax.navigate(context, AppRoutes.dashboard);
                      widget.backArrowFlag == true ? Navigator.pushNamed(context, AppRoutes.LogIn) 
                      :
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.LogIn);
                        //ProviderForPropertyTax.navigate(context, AppRoutes.dashboard);
                      },
                      icon: Icon(
                        Icons.home,
                        color: Colors.black,
                      ))
                ],
                centerTitle: true,
                backgroundColor: Colors.white,
                title: Text(
                  widget.titleName ?? '',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(widget.appBarSize ?? 40),
              child: widget.appBar ?? Container(color: Colors.transparent,),
            ),
      body: Container(
        //margin: EdgeInsets.only(bottom: 25),
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: //SvgPicture.asset(AssetPath.bg),
            AssetImage(AssetPath.bg_image),
            // AssetImage("assets/zoo_bg_transparent.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
