import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mjpt_pas/res/components/base_scaffold.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_button_component.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_textformfield.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_text.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/date_picker_component.dart';
import 'package:mjpt_pas/res/string_constants/string_constants.dart';
import 'package:mjpt_pas/viewmodel/apply_leave_view_model.dart';
import 'package:provider/provider.dart';

import '../model/leave_response.dart';
import '../model/leave_time_zone_response.dart';
import '../model/sample_model_class.dart';

class ApplyLeave extends StatefulWidget {
  ApplyLeave({super.key});

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  LeaveTypesData? selectedValueSalary;
  LeaveTimeZoneData? selectedValueTime;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();
  FormFieldValidator<LeaveTypesData>? validatorFunction = (value) {
    if (value == null || value.leaveName!.isEmpty) {
      return 'Please select Leave Type';
    }
    return null;
  };
  FormFieldValidator<LeaveTimeZoneData>? validatorFunction1 = (value) {
    if (value == null || value.leaveTimeZoneName!.isEmpty) {
      return 'Please selecte Time Zone';
    }
    return null;
  };
  TextEditingController _openingBalance = TextEditingController();
  TextEditingController _daysCount = TextEditingController();
  TextEditingController _purpose = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _toDate = TextEditingController();
  TextEditingController _fromDate = TextEditingController();
  bool flag = false;
  bool moreThanOneDayFlag = false;
  LeaveData? leaveData;
  List<LeaveTypesData>? leaveTypesData;
  List<LeaveTimeZoneData?>? leaveTimeZoneData;
  
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final applyLeaveViewmodel =
          Provider.of<ApplyLeaveViewModel>(context, listen: false);
      leaveData = await applyLeaveViewmodel.LeaveService(context);

      leaveTypesData = leaveData?.leaveTypesData;
      leaveTypesData?.insert(
          0,
          LeaveTypesData(
              leaveName: 'Please select Leave Type',
              leaveBalance: 0,
              leaveId: 0));
      leaveTimeZoneData =
          await applyLeaveViewmodel.LeaveTimeZoneService(context);
      leaveTimeZoneData?.insert(
          0,
          LeaveTimeZoneData(
              leaveTimeZoneName: 'Please select Time Zone',
              leaveTimeZoneId: 0));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    String selectedOption = '';
    return BaseScaffold(
      resize: false,
      AppBarvis: true,
      backgroundImageVisible: false,
      titleName: AppStrings.apply_leave,
      child: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<LeaveTypesData>(
                    value: selectedValueSalary,
                    items: leaveTypesData?.map((LeaveTypesData option) {
                      return DropdownMenuItem<LeaveTypesData>(
                        value: option,
                        child: Text(option.leaveName ?? ''),
                      );
                    }).toList(),
                    onChanged: (LeaveTypesData? newValue) {
                      setState(() {
                        selectedValueSalary = newValue;
                        if (selectedValueSalary?.leaveName ==
                            'Please select Leave Type') {
                          _openingBalance.text = '';
                        } else {
                          _openingBalance.text =
                              selectedValueSalary?.leaveBalance.toString() ??
                                  '';
                        }
                      });
                    },
                    validator: validatorFunction,
                    decoration: InputDecoration(
                      labelText: leaveTypesData?[0].leaveName ?? " ",
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppText(
                      textEditingController: _openingBalance,
                      labeltext: 'Opening Balance'),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<LeaveTimeZoneData>(
                    value: selectedValueTime,
                    items: leaveTimeZoneData?.map((LeaveTimeZoneData? option) {
                      return DropdownMenuItem<LeaveTimeZoneData>(
                        value: option,
                        child: Text(option?.leaveTimeZoneName ?? ''),
                      );
                    }).toList(),
                    onChanged: (LeaveTimeZoneData? newValue) {
                      setState(() {
                        selectedValueTime = newValue;
                        if (newValue?.leaveTimeZoneId == 0) {
                          flag = false;
                          moreThanOneDayFlag = false;
                        } else if (newValue?.leaveTimeZoneId == 4) {
                          flag = false;
                          moreThanOneDayFlag = true;
                        } else {
                          flag = true;
                          moreThanOneDayFlag = false;
                        }
                      });
                    },
                    validator: validatorFunction1,
                    decoration: InputDecoration(
                      labelText: leaveTimeZoneData?[0]?.leaveTimeZoneName,
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: flag,
                    child: datePickerComponent(
                        labeltext: "Select Date",
                        nameController: _fromDate,
                        errorMessage: "Please select date",
                        obsecuretext: false,
                        onEditingComplete: () {
                          print("onEditingComplete");
                        },
                        globalKey: _formKey1,
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: Colors.black,
                          size: 20,
                        )),
                  ),
                  Visibility(
                    visible: moreThanOneDayFlag,
                    child: Column(
                      children: [
                        datePickerComponent(
                            labeltext: "Select From Date",
                            nameController: _fromDate,
                            errorMessage: "Please select from date",
                            obsecuretext: false,
                            onEditingComplete: () {
                              print("onEditingComplete");
                            },
                            globalKey: _formKey1,
                            prefixIcon: Icon(
                              Icons.date_range,
                              color: Colors.black,
                              size: 20,
                            )),
                        datePickerComponent(
                            labeltext: "Select To Date",
                            nameController: _toDate,
                            errorMessage: "Please select to date",
                            obsecuretext: false,
                            onEditingComplete: () {
                              print("onEditingComplete");
                            },
                            globalKey: _formKey2,
                            prefixIcon: Icon(
                              Icons.date_range,
                              color: Colors.black,
                              size: 20,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppInputButtonComponent(
                      onPressed: validateForm, buttonText: AppStrings.validate),
                  SizedBox(
                    height: 10,
                  ),
                  AppText(
                      textEditingController: _daysCount,
                      labeltext: 'Opening Balance'),
                  AppInputTextFormfield(
                    labeltext: "Purpose",
                    nameController: _purpose,
                    errorMessage: "Please enter purpose",
                    input_type: TextInputType.text,
                    obsecuretext: false,
                    globalKey: _formKey3,
                  ),
                  AppText(
                      textEditingController: _mobile,
                      labeltext: 'Contact Mobile No'),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text("Leaving H.Q"),
                      RadioListTile(
                        title: const Text('Yes'),
                        value: 'Yes',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value ?? '';
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text('No'),
                        value: 'No',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value ?? '';
                          });
                        },
                      )
                    ],
                  ),
                  AppInputButtonComponent(
                      onPressed: validateForm, buttonText: AppStrings.submit),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      print("11212121121");
      print("555555 ${selectedValueSalary?.leaveBalance ?? ''}");
    } else if (_formKey1.currentState!.validate()) {
      print("0000000");
      print("555555 ${selectedValueTime?.leaveTimeZoneId ?? ''}");
    } else if (_formKey2.currentState!.validate()) {
      print("0000000");
      print("555555 ${selectedValueTime?.leaveTimeZoneId ?? ''}");
    } else if (_formKey3.currentState!.validate()) {
      print("9999999999");
    } else {
      print("0000000");
    }
  }
}
