import 'package:animooo/constans/app_colors.dart';
import 'package:animooo/pages/views/forget_password.dart';
import 'package:animooo/pages/views/widget/custom_botton.dart';
import 'package:animooo/pages/views/widget/custom_text_field.dart';
import 'package:animooo/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
              children: [
                Gap(20.h),

                /// Logo
                Container(
                  width: 200.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFD8B85C),
                    border: Border.all(
                      color: const Color(0xFF1F3048),
                      width: 4,
                    ),
                  ),
                  child: SvgPicture.asset("assets/logo/logo.svg"),
                ),

                Gap(8.h),

                Text(
                  "ANIMOOO",
                  style: TextStyle(
                    fontFamily: "OriginalSurfer",
                    fontSize: 15,
                    color: AppColors.primary,
                  ),
                ),

                Gap(35.h),

                Text("Log In", style: AppTextStyles.titleStyle),

                Gap(30.h),

                /// Email
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                Gap(8.h),

                CustomTextField(
                  controller: emailController,
                  hint: "Enter your email address",
                  isPassword: false,
                ),

                Gap(20.h),

                /// Password
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                Gap(8.h),

                CustomTextField(
                  controller: passwordController,
                  hint: "********",
                  isPassword: true,
                ),

                /// Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgetPassword(),
                        ),
                      );
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),

                Gap(20.h),

                /// Login Button
                CustomButton(
                  text: "Log In",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(emailController.text);
                      print(passwordController.text);
                    }
                  },
                ),

                Gap(229.h),

                /// Bottom Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up now",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF04332D),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
