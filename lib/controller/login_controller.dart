import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController();

  final _loginid = ''.obs;
  final _passwd = ''.obs;

  String get loginid => _loginid.value;
  set loginid(value) => _loginid.value = value;
  String get passwd => _passwd.value;
  set passwd(value) => _passwd.value = value;

  final txtLoginid = TextEditingController();
  final txtPasswd = TextEditingController();
}
