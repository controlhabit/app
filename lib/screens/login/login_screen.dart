import 'dart:convert';

import 'package:controlhabit/screens/login/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../components/textfield.dart';
import '../../constants/constants.dart';
import '../../controller/login_controller.dart';
import '../../config/config.dart' as config;

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  // final authController = Get.find<AuthController>();
  final LoginController controller = Get.put(LoginController());

  static const storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    void login(email, passwd) async {
      var res = await http.get(
        Uri.parse('${config.serverUrl}/api/jwt?email=$email&passwd=$passwd'),
      );
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        if (data['code'] == 'ok') {
          // authController.authenticated = true;
          await storage.write(key: 'token', value: 'bearer ${data['token']}');
          await storage.write(key: 'email', value: email);
          // await Get.offAllNamed("/main");
          print("로그인 완료");
          print(data['token']);
        } else {
          print(data['message']);
        }
      } else {
        print('error');
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 300, 24, 0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyTextField(
              controller: controller.txtEmail,
              decoration: kTextFieldDecoration,
              hintText: 'Email',
            ),
            const SizedBox(
              height: 15.0,
            ),
            MyTextField(
              controller: controller.txtPasswd,
              decoration: kTextFieldDecoration,
              hintText: 'Password',
              obscureText: true,
            ),
            // const Text(
            //   '아이디를 확인해 주세요.',
            //   style: TextStyle(color: Colors.red),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Material(
                elevation: 2.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10.0),
                child: MaterialButton(
                  onPressed: () {
                    login(controller.txtEmail.text, controller.txtPasswd.text);
                  },
                  minWidth: 200.0,
                  height: 55.0,
                  child: const Text('LOGIN',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                        textStyle: const TextStyle(fontSize: 15)),
                    onPressed: () {},
                    child: const Text('Google로 로그인',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                        textStyle: const TextStyle(fontSize: 15)),
                    onPressed: () {},
                    child: const Text('Apple로 로그인',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                        textStyle: const TextStyle(fontSize: 15)),
                    onPressed: () {},
                    child: const Text('Naver로 로그인',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('CONTOL 처음이신가요?  ',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                  GestureDetector(
                      child: const Text('회원가입',
                          style: TextStyle(color: Colors.lightBlueAccent)),
                      onTap: () {
                        Get.to(SignupScreen());
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
