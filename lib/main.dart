import 'package:animooo/pages/splash_page.dart';
import 'package:animooo/pages/views/login_screen.dart';
import 'package:animooo/pages/views/new_password.dart';
import 'package:animooo/pages/views/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(debugShowCheckedModeBanner: false, home: child);
      },
      child: const SplashPage(),
    );
  }
}
