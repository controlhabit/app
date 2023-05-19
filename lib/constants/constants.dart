import 'package:flutter/material.dart';

var color = Colors.blueAccent;

var kTextFieldDecoration = const InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  filled: true,
  // fillColor: Color(0x0008c90d),
);
