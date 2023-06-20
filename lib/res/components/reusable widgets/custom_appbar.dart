import 'package:flutter/material.dart';
import 'package:mjpt_pas/res/app_colors/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final Widget child;
  final double height;
  final IconButton? iconButton;
  List<Widget>? action;
  final String? titleIs;
  CustomAppBar(
      {
      //required this.child,
      this.height = kToolbarHeight,
      this.iconButton,
      this.action,
      this.titleIs,
    
      });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.PRIMARY_COLOR_LIGHT,
        title: Text(
        
          titleIs ?? "",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        leading: /* IconButton(
        icon: const Icon(Icons.arrow_back),
        tooltip: 'Menu',
        onPressed: () {
        },
      ), */
            iconButton,
        actions: action);
  }
}
