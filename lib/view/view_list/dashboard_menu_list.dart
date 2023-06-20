import 'package:flutter/material.dart';

import 'package:mjpt_pas/model/dashboard_menu_response.dart';
import 'package:mjpt_pas/res/app_colors/app_colors.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_text.dart';

class DashboardGridView extends StatelessWidget {
  final List<DashboardMenuList> items;

  DashboardGridView({required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Adjust the crossAxisCount as per your needs
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          childAspectRatio: (.7 / .4),
        ),
        itemBuilder: (context, index) {
          return SizedBox(
            /* width: MediaQuery.of(context).size.width,
            height: 50, */
            child: GridTile(
              child: Container(
                /* decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ), */
                //color:AppColors.white,
                child: GestureDetector(
                  onTap: () {
                    // getDetails(context,index);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        //side: BorderSide(width: 5, color: Colors.green)
                        ),
                    color: AppColors.PRIMARY_COLOR_LIGHT,
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /* Image.network(
                          items[index].imagePath ?? '',
                          height: 50.0,
                          width: 50.0,
                        ), */

                        AppInputText(
                          text: items[index].serviceName ?? '',
                          fontsize: 16,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /* void getDetails(BuildContext context, int index) {
    switch (items[index].serviceId) {
    case 'S1':
   
          
      Navigator.pushNamed(context, RouteName.applyLeave);
      break;
    case 'S2':
       Navigator.pushNamed(context, RouteName.applyLeave);
      break;
    case 'S3':
        Navigator.pushNamed(context, RouteName.cancelleave);
     case 'S4':
        Navigator.pushNamed(context, RouteName.availableleave);
      break;
       case 'S5':
        Navigator.pushNamed(context, RouteName.applyLeave);
      break;
       case 'S6':
        Navigator.pushNamed(context, RouteName.officerOnLeaveReport);
      break;
       case 'S7':
        Navigator.pushNamed(context, RouteName.inchargeAllotmentMade);
      break;
       case 'S8':
        Navigator.pushNamed(context, RouteName.leaveWithdrawalApprove);
      break;
       case 'S9':
        Navigator.pushNamed(context, RouteName.applyLeave);
      break;
      case 'S10':
        Navigator.pushNamed(context, RouteName.applyLeave);
      break;
      case 'S11':
        Navigator.pushNamed(context, RouteName.applyLeave);
      break;
      case 'S12':
        Navigator.pushNamed(context, RouteName.applyLeave);
      break;
      case 'S13':
        Navigator.pushNamed(context, RouteName.applyLeave);
      break;
    default:
      print('Please dont ask me');
  }

  } */
}
