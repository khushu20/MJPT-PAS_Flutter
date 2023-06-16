import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mjpt_pas/res/components/base_scaffold.dart';
import 'package:mjpt_pas/res/string_constants/string_constants.dart';

class GrievanceReport extends StatelessWidget {
  const GrievanceReport({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      AppBarvis: true,
      backgroundImageVisible: false,
      titleName: AppStrings.raise_grievance,
      child: Center(
        child: Text('Attendance'),
      ),
    );
  }
}