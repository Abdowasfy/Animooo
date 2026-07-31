import 'package:animooo/pages/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreenTow extends StatefulWidget {
  const SplashScreenTow({super.key});

  @override
  State<SplashScreenTow> createState() => _SplashScreenTowState();
}

class _SplashScreenTowState extends State<SplashScreenTow> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
  body: SizedBox.expand(
    child: Image.asset(
      "assets/images/splash.png",
      fit: BoxFit.cover,
    ),
  ),
); ;
  }
}