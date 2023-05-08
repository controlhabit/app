import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static const storage = FlutterSecureStorage();

  final _authenticated = false.obs;

  bool get authenticated => _authenticated.value;
  set authenticated(value) {
    if (value == false) {
      storage.deleteAll();
    }
    _authenticated.value = value;
  }

  @override
  void onInit() {
    ever(_authenticated, (value) {});
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authenticatedState();
    });
  }

  authenticatedState() async {
    String? tokenInfo = await storage.read(key: 'token');
    if (tokenInfo != null) {
      authenticated = true;
    }
  }
}
