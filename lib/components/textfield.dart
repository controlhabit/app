import 'package:flutter/material.dart';
import 'package:get/get.dart';

class testfieldController extends GetxController {
  testfieldController();
}

class MyTextField extends StatelessWidget {
  const MyTextField(
      {Key? key,
      required this.controller,
      this.decoration,
      this.labelText,
      this.hintText,
      this.prefixIcon,
      this.obscureText = false})
      : super(key: key);

  final controller;
  final decoration;
  final labelText;
  final hintText;
  final prefixIcon;
  final obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: decoration.copyWith(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () {
            controller.clear();
          },
        ),
        // suffixIcon: null,
      ),
      obscureText: obscureText,
    );
  }
}
