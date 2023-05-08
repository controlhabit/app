import 'package:flutter/material.dart';
import 'package:controlhabit/screens/login/login_screen.dart';
// import 'package:flutter_component/screens/main_screen.dart';
// import 'package:flutter_component/screens/splash_screen.dart';
import 'package:get/get.dart';

// import 'services/auth_service.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.pink,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
      ),
      initialRoute: "/login",
      getPages: [
        // GetPage(
        //     name: "/",
        //     page: () => const SplashScreen(),
        //     transition: Transition.fade),
        GetPage(
            name: "/login",
            page: () => LoginScreen(),
            transition: Transition.fade),
        // GetPage(
        //     name: "/main",
        //     page: () => const MainScreen(),
        //     transition: Transition.downToUp,
        //     middlewares: [AuthService()]),
      ],
    ),
  );
}
