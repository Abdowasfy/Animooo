import 'package:animooo/constans/app_colors.dart';
import 'package:animooo/pages/views/widget/custom_botton.dart';
import 'package:animooo/pages/views/widget/custom_text_field.dart';
import 'package:animooo/pages/views/widget/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final pass = TextEditingController();
  final conpass = TextEditingController();

  void dispose() {
    pass.dispose();
    conpass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 18.sp,
                      color: AppColors.primary,
                    ),
                  ),
                  Gap(4.w),
                  Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),

              Gap(24.h),

              Text(
                "Create New Password",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              Gap(10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "New Password",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Gap(8.h),

              CustomTextField(
                controller: pass,
                hint: "********",
                isPassword: true,
              ),
              Gap(15),
              PasswordValidation(
                hasMinLength: true,
                hasUpperCase: false,
                hasLowerCase: true,
                hasSpecialChar: true,
                hasNumber: true,
              ),
              Gap(20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Confirm Password",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Gap(8.h),

              CustomTextField(
                controller: conpass,
                hint: "********",
                isPassword: true,
              ),
              Gap(100),

              CustomButton(text: "Submit", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
