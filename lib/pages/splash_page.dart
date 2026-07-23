import 'package:animooo/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  
void initState() {
  super.initState();

  Future.delayed(const Duration(seconds: 2), () {
    if (!mounted) return;

    Navigator.pushReplacementNamed(context, '/login');
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Gap(320),
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFD8B85C),
                border: Border.all(color: const Color(0xFF1F3048), width: 10),
              ),
              child: SvgPicture.asset(
                "assets/logo/logo.svg",
                width: 220.w,
                height: 230.h,
                fit: BoxFit.contain,
              ),
            ),
            Gap(9.h),
            Text(
              "ANIMOOO",
              style: const TextStyle(
                fontFamily: "OriginalSurfer",
                fontSize: 30,
                color: Color(0xff04332D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
