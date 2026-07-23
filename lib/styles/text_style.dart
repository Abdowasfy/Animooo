import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  AppTextStyles._();

  static final TextStyle logoStyle = TextStyle(
    fontFamily: 'OriginalSurfer',
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF04332D),
    height: 58 / 24,
  );

  static final TextStyle titleStyle = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static final TextStyle bodyStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );

  static final TextStyle buttonStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}