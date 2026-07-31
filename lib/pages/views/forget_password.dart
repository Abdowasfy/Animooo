import 'package:animooo/constans/app_colors.dart';
import 'package:animooo/pages/views/otp_verfication_screen.dart';
import 'package:animooo/pages/views/widget/custom_botton.dart';
import 'package:animooo/pages/views/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20.h),

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
                    Gap(6.w),
                    Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                Gap(10),
                Text(
                  "Forget Your Password ?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                Gap(20),
                Text(
                  "Please enter the email address associated with your account, and we'll send you OTP to reset your password.",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                Gap(60),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                Gap(10),
                CustomTextField(
                  controller: _emailController,
                  hint: "Enter your email",
                  keyboardType: TextInputType.emailAddress,
                ),
                Gap(150),
                CustomButton(
                  text: "Send  Code",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(_emailController.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpVerificationScreen(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
