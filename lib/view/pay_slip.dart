import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mjpt_pas/res/components/base_scaffold.dart';
import 'package:mjpt_pas/res/string_constants/string_constants.dart';

class PaySlip extends StatelessWidget {
  const PaySlip({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      AppBarvis: true,
      backgroundImageVisible: false,
      titleName: AppStrings.pay_slip,
      child: Center(
        child: Text('Attendance'),
      ),
    );
  }
}