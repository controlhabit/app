import 'dart:convert';

import 'package:controlhabit/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../controller/signup_controller.dart';
import '../../config/config.dart' as config;

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    bool checkEmail(email) {
      return RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
    }

    bool checkName(name) {
      return RegExp(r"^[ㄱ-ㅎ가-힣]*$").hasMatch(name);
    }

    bool checkPasswd(passwd) {
      return RegExp(
              r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$')
          .hasMatch(passwd);
    }

    bool confirmPasswd(passwd, checkpasswd) {
      return passwd == checkpasswd;
    }

    void signup() async {
      String email = controller.txtEmail.text;
      String name = controller.txtName.text;
      String passwd = controller.txtPasswd.text;
      String chPasswd = controller.txtCheckPasswd.text;

      if (!checkEmail(email)) {
        print(checkEmail(email));
        return;
      }
      if (!checkPasswd(passwd)) {
        print(checkPasswd(passwd));
        return;
      }
      if (!confirmPasswd(passwd, chPasswd)) {
        print(confirmPasswd(passwd, chPasswd));
        return;
      }
      if (!checkName(name)) {
        print(checkName(name));
        return;
      }
      var result = await http.post(Uri.parse('${config.serverUrl}/api/user'),
          body: <String, String>{
            'email': email,
            'name': name,
            'passwd': passwd,
          });
      if (result.statusCode == 200) {
        final parsed = json.decode(result.body);
        if (parsed['code'] == 'ok') {
          // await Get.to("/login");
          print('완료 되었습니다.');
          Get.to(LoginScreen());
        }
      } else {}
    }

    return Scaffold(
        body: Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(30, 150, 30, 0),
            child: Obx(() => Text(
                  controller.headText,
                  style: const TextStyle(color: Colors.black, fontSize: 30),
                ))),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx(() {
                return Visibility(
                  visible: controller.passwordCheckShow,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                        decoration:
                            const InputDecoration(labelText: 'PASSWORD CHECK'),
                        controller: controller.txtCheckPasswd,
                        obscureText: true,
                      )),
                );
              }),
              Obx(() {
                return Visibility(
                  visible: controller.passwordShow,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                          decoration:
                              const InputDecoration(labelText: 'PASSWORD'),
                          controller: controller.txtPasswd,
                          obscureText: true,
                          textInputAction: TextInputAction.go,
                          onSubmitted: (value) async {
                            controller.passwordCheckShow = true;
                            controller.headText = '다시 한번 비밀번호를 입력해주세요.';
                          })),
                );
              }),
              Obx(() {
                return Visibility(
                  visible: controller.nameShow,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                          decoration: const InputDecoration(labelText: 'NAME'),
                          controller: controller.txtName,
                          textInputAction: TextInputAction.go,
                          onSubmitted: (value) async {
                            controller.passwordShow = true;
                            controller.headText = '비밀번호를 입력해주세요.';
                          })),
                );
              }),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                      decoration: const InputDecoration(labelText: 'EMAIL'),
                      controller: controller.txtEmail,
                      textInputAction: TextInputAction.go,
                      onSubmitted: (value) async {
                        controller.nameShow = true;
                        controller.headText = '이름을 알려주세요.';
                      })),
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: MaterialButton(
                    color: Colors.lightBlueAccent,
                    disabledColor: Colors.grey,
                    onPressed:
                        controller.passwordCheckShow ? () => signup() : null,
                    minWidth: 200.0,
                    height: 55.0,
                    child: const Text('SIGNUP',
                        style: TextStyle(color: Colors.white)),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    ));
  }
}
