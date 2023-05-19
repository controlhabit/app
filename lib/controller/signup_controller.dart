import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  SignupController();

  final _loginid = ''.obs;
  final _passwd = ''.obs;
  final _name = ''.obs;
  final _email = ''.obs;
  final _checkpasswd = ''.obs;

  final _headText = '이메일을 알려주세요.'.obs;
  final _emailShow = false.obs;
  final _nameShow = false.obs;
  final _passwordShow = false.obs;
  final _passwordCheckShow = false.obs;

  String get loginid => _loginid.value;
  set loginid(value) => _loginid.value = value;
  String get passwd => _passwd.value;
  set passwd(value) => _passwd.value = value;
  String get name => _name.value;
  set name(value) => _name.value = value;
  String get email => _email.value;
  set email(value) => _email.value = value;
  String get checkpasswd => _checkpasswd.value;
  set checkpasswd(value) => _checkpasswd.value = value;

  String get headText => _headText.value;
  set headText(value) => _headText.value = value;
  bool get emailShow => _emailShow.value;
  set emailShow(value) => _emailShow.value = value;
  bool get nameShow => _nameShow.value;
  set nameShow(value) => _nameShow.value = value;
  bool get passwordShow => _passwordShow.value;
  set passwordShow(value) => _passwordShow.value = value;
  bool get passwordCheckShow => _passwordCheckShow.value;
  set passwordCheckShow(value) => _passwordCheckShow.value = value;

  final txtLoginid = TextEditingController();
  final txtPasswd = TextEditingController();
  final txtName = TextEditingController();
  final txtEmail = TextEditingController();
  final txtCheckPasswd = TextEditingController();
}
