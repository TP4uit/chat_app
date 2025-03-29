import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeFields extends StatelessWidget {
  final TextEditingController controller;

  const PinCodeFields({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      backgroundColor: Colors.transparent,
      length: 4,
      controller: controller,
      cursorHeight: 19,
      enableActiveFill: true,
      textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly
      ],
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        fieldWidth:40,
        fieldHeight: 50,
        inactiveColor: Colors.grey,
        selectedColor: Colors.lightBlue,
        activeColor: Colors.blue,
        selectedFillColor: Colors.blue,
        inactiveFillColor: Colors.grey.shade100,
        borderWidth: 1,
        borderRadius: BorderRadius.circular(8)
      ),
    );
  }
}
