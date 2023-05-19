import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestfieldController extends GetxController {
  TestfieldController();
}

class MyTextField extends StatelessWidget {
  final dynamic controller;
  final InputDecoration decoration;
  final dynamic hintText;
  final dynamic obscureText;

  const MyTextField(
      {Key? key,
      required this.controller,
      required this.decoration,
      this.hintText,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: decoration.copyWith(
        hintText: hintText,
      ),
      obscureText: obscureText,
      style: const TextStyle(fontSize: 16),
    );
  }
}
