import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mjpt_pas/res/components/base_scaffold.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/alert_upload_document.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_button_component.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_textformfield.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_text.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/date_picker_component.dart';
import 'package:mjpt_pas/res/constants/app_constants.dart';
import 'package:mjpt_pas/res/constants/image_constants.dart';
import 'package:mjpt_pas/res/string_constants/string_constants.dart';
import 'package:mjpt_pas/viewmodel/apply_leave_view_model.dart';
import 'package:provider/provider.dart';

import '../model/check_if_leave_exists_response.dart';
import '../model/leave_response.dart';
import '../model/leave_time_zone_response.dart';
import '../model/login_mobile_response.dart';
import '../model/sample_model_class.dart';
import '../res/components/get_shared_pref.dart';
import '../res/constants/shared_pref_consts.dart';

class ApplyLeave extends StatefulWidget {
  ApplyLeave({super.key});

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  LeaveTypesData? selectedLeaveType;
  LeaveTimeZoneData? selectedTimeZone;
  TextEditingController _openingBalance = TextEditingController();
  TextEditingController _daysCount = TextEditingController();
  TextEditingController _purpose = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _toDate = TextEditingController();
  TextEditingController _fromDate = TextEditingController();
  bool flag = false;
  bool moreThanOneDayFlag = false;
  bool buttonFlag =  true;
  LeaveData? leaveData;
  List<LeaveTypesData>? leaveTypesData;
  List<LeaveTimeZoneData?>? leaveTimeZoneData;
  CheckLeaveExistsData? checkLeaveExistsData;
  String selectedOption = '';
  List MCQ = ["Yes", "No"];
  GetSharedPref getSharedPref = GetSharedPref();
  LoginData? loginMobileData;
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      AppConstants.checkIfLeaveExistflag = true;
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
      loginMobileData = await getSharedPref.getLoginInfo(SharedPrefConstants.loginResponse);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final applyLeaveViewmodel =
          Provider.of<ApplyLeaveViewModel>(context, listen: false);
          bool visDoc = !AppConstants.docFlag;
          print("visdoc $visDoc");
    return BaseScaffold(
      resize: false,
      AppBarvis: true,
      backgroundImageVisible: false,
      titleName: AppStrings.apply_leave,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<LeaveTypesData>(
                value: selectedLeaveType,
                items: leaveTypesData?.map((LeaveTypesData option) {
                  return DropdownMenuItem<LeaveTypesData>(
                    value: option,
                    child: Text(option.leaveName ?? ''),
                  );
                }).toList(),
                onChanged: (LeaveTypesData? newValue) {
                  setState(() {
                    selectedLeaveType = newValue;
                    if (selectedLeaveType?.leaveName ==
                        'Please select Leave Type') {
                      _openingBalance.text = '';
                    } else {
                      _openingBalance.text =
                          selectedLeaveType?.leaveBalance.toString() ?? '';
                    }
                  });
                },
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
                value: selectedTimeZone,
                items: leaveTimeZoneData?.map((LeaveTimeZoneData? option) {
                  return DropdownMenuItem<LeaveTimeZoneData>(
                    value: option,
                    child: Text(option?.leaveTimeZoneName ?? ''),
                  );
                }).toList(),
                onChanged: (LeaveTimeZoneData? newValue) {
                  setState(() {
                    selectedTimeZone = newValue;
                    _fromDate.text = '';
                    _toDate.text = '';
                    AppConstants.checkIfLeaveExistflag = true;
                    AppConstants.applyLeaveflag = false;
                    _purpose.text = '';
                    _daysCount.text = '';
                    _mobile.text = '';
                    AppConstants.selectedFile = "";
                    AppConstants.selectedImage = XFile("");
                    selectedOption = '';
                    visDoc =  true;
                    AppConstants.docFlag = false;
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
                    //globalKey: _formKey1,
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
                        //globalKey: _formKey1,
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
                        //globalKey: _formKey2,
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
              Visibility(
                visible: AppConstants.checkIfLeaveExistflag,
                child: AppInputButtonComponent(
                    onPressed: () async{
                      bool flag = applyLeaveViewmodel.validateFileds(selectedLeaveType?.leaveName ?? '', selectedLeaveType?.leaveId ?? 0, selectedTimeZone?.leaveTimeZoneName ?? '', selectedTimeZone?.leaveTimeZoneId ?? 0, _fromDate.text, context, _toDate.text );
                      print("falg is $flag");
                      if(flag == true){
                        checkLeaveExistsData = await applyLeaveViewmodel.checkLeavesExists(selectedLeaveType?.leaveName ?? '', selectedLeaveType?.leaveId ?? 0, selectedTimeZone?.leaveTimeZoneName ?? '', selectedTimeZone?.leaveTimeZoneId ?? 0, _fromDate.text, context, _toDate.text );
                        if(checkLeaveExistsData != null) {
                          print("aaaaa");
                          AppConstants.applyLeaveflag = true;

                        }
                        setState(() {
                          _daysCount.text  = checkLeaveExistsData?.numberOfDays.toString() ?? '';
                          _mobile.text  = loginMobileData?.mobileNumber ?? '';
                          print("AppConstants.applyLeaveflag ${AppConstants.applyLeaveflag}");
                        });
                      }
                     
                    }, buttonText: AppStrings.validate),
              ),
              Visibility(
                visible:AppConstants.applyLeaveflag,
                child: Column(
                children: [
                   AppText(
                  textEditingController: _daysCount,
                  labeltext: 'No. of Days'),
              AppInputTextFormfield(
                labeltext: "Purpose",
                nameController: _purpose,
                errorMessage: "Please enter purpose",
                input_type: TextInputType.text,
                obsecuretext: false,
                //globalKey: _formKey3,
              ),
              AppText(
                  textEditingController: _mobile,
                  labeltext: 'Contact Mobile No'),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 8,right: 8),
                          child: Text("Upload Document"),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Visibility(
                          visible: visDoc,
                          child: IconButton(
                            icon: Icon(Icons.upload_file,
                            size: 40),
                            onPressed: () {
                              showDialog(context: context, builder: (context) {
                                return AlertUploadDocument();
                              });
                            },
                          ),
                        ),
                        Visibility(
                          visible: AppConstants.docFlag,
                          child: (AppConstants.selectedFile != null && AppConstants.selectedImage == null) ?
                           SvgPicture.asset(AssetPath.pdfnew,
                            height: 50,
                            width: 50,)
                            :
                            Image.file(File(AppConstants.selectedImage != null ? AppConstants.selectedImage!.path.toString() : ''),
                            height: 50,
                            width: 50,),
                        )
                      ],
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Leaving H.Q"),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        addRadioButton(0, "Yes"),
                        SizedBox(width: 50,),
                        addRadioButton(1, "No"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              
              AppInputButtonComponent(
                  onPressed: () {}, buttonText: AppStrings.submit),
                ],
              ))
             
            ],
          ),
        ),
      ),
    );
  }

  Row addRadioButton(int btnValue, String title) {
    return Row(
      children: <Widget>[
        Radio(
          activeColor: Colors.black,
          value: MCQ[btnValue],
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              print(value);
              selectedOption = value;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Text(
            title,
          ),
        )
      ],
    );
  }

  void validateForm() {}
}
