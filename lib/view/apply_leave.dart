import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mjpt_pas/res/components/base_scaffold.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_input_button_component.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/date_picker_component.dart';
import 'package:mjpt_pas/res/string_constants/string_constants.dart';

import '../model/sample_model_class.dart';

class ApplyLeave extends StatefulWidget {
  ApplyLeave({super.key});

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  SampleModelClass? selectedValueSalary;
  SampleModelClass? selectedValueTime;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final List<SampleModelClass> options = [
    SampleModelClass(noOfDays: 'Please select an option', salary: '0'),
    SampleModelClass(noOfDays: '1', salary: '1000'),
    SampleModelClass(noOfDays: '2', salary: '2000'),
    SampleModelClass(noOfDays: '3', salary: '3000'),
    SampleModelClass(noOfDays: '4', salary: '4000'),
    SampleModelClass(noOfDays: '5', salary: '5000'),
  ];

  FormFieldValidator<SampleModelClass>? validatorFunction = (value) {
    if (value == null || value.noOfDays!.isEmpty) {
      return 'Leave Type';
    }
    return null;
  };
  TextEditingController controller = TextEditingController();
  TextEditingController _date = TextEditingController();
  bool flag = false;
  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<SampleModelClass>(
                  value: selectedValueSalary,
                  items: options.map((SampleModelClass option) {
                    return DropdownMenuItem<SampleModelClass>(
                      value: option,
                      child: Text(option.noOfDays ?? ''),
                    );
                  }).toList(),
                  onChanged: (SampleModelClass? newValue) {
                    setState(() {
                      selectedValueSalary = newValue ?? SampleModelClass();
                      controller.text = selectedValueSalary?.salary ?? '';
                    });
                  },
                  validator: validatorFunction,
                  decoration: InputDecoration(
                    labelText: options[0].noOfDays ?? " ",
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
                TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: 'Salary',
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
                    )),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<SampleModelClass>(
                  value: selectedValueTime,
                  items: options.map((SampleModelClass option) {
                    return DropdownMenuItem<SampleModelClass>(
                      value: option,
                      child: Text(option.noOfDays ?? ''),
                    );
                  }).toList(),
                  onChanged: (SampleModelClass? newValue) {
                    setState(() {
                      selectedValueTime = newValue ?? SampleModelClass();
                      flag = true;
                    });
                  },
                  validator: validatorFunction,
                  decoration: InputDecoration(
                    labelText: options[0].noOfDays ?? " ",
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
                      nameController: _date,
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
                AppInputButtonComponent(onPressed: validateForm, buttonText: AppStrings.validate)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      print("11212121121");
      print("555555 ${selectedValueSalary?.salary ?? ''}");
    } else if (_formKey1.currentState!.validate()) {
      print("0000000");
      print("555555 ${selectedValueTime?.salary ?? ''}");
    } else {
      print("0000000");
    }
  }
}
