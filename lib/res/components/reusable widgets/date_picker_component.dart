import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class datePickerComponent extends StatelessWidget {
  const datePickerComponent(
      {super.key,
      required this.nameController,
      required this.errorMessage,
      this.input_type,
      required this.obsecuretext,
      this.node,
      this.action,
      required this.onEditingComplete,
      this.globalKey,
      this.prefixIcon,
      // this.isSecured,
      // this.isVisible,
      this.onTap,
      this.suffixIcon,
      required this.labeltext});
  final String labeltext, errorMessage;
  final TextEditingController nameController;
  final TextInputType? input_type;
  final bool obsecuretext;
  final FocusScopeNode? node;
  final TextInputAction? action;
  final VoidCallback? onEditingComplete;
  final GlobalKey? globalKey;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  // final IconData? suffixIcon;
  // final bool? isSecured;
  // final bool? isVisible;

  final void Function()? onTap;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        child: TextFormField(
          obscureText: obsecuretext,
          textInputAction: action,
          onEditingComplete: onEditingComplete,
          style: const TextStyle(color: Colors.black),
          controller: nameController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            //hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: prefixIcon,
            //suffixIcon: null == suffixIcon ? null : Icon(suffixIcon),
            suffixIcon: suffixIcon,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
            labelText: labeltext,
            labelStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            /* labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            labelText: hintText, */
          ),
          onTap: () async {
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2050),
            ).then((selectedDate) {
              if (selectedDate != null) {
                nameController.text =
                    DateFormat('dd/MM/yyyy').format(selectedDate);
              }
            });
          },
          validator: (value) {
            if (value!.isEmpty) {
              return errorMessage;
            }
          },
          keyboardType: input_type,
        ),
      ),
    );
  }
}
