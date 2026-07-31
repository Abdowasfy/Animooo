import 'package:animooo/constans/app_colors.dart';
import 'package:animooo/pages/views/new_password.dart';
import 'package:animooo/pages/views/widget/custom_botton.dart';
import 'package:animooo/pages/views/widget/custom_otp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> controllers = List.generate(
    5,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(5, (_) => FocusNode());

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }

    for (final node in focusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  void confirmOtp() {
    String otp = controllers.map((e) => e.text).join();

    if (otp.length == 5) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const NewPassword()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter the complete OTP")),
      );
    }
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
                    onTap: () => Navigator.pop(context),
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
                "OTP Verification",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              Gap(8.h),

              Text(
                "Please enter the 5 digit code sent your phone number",
                style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.grey,
                  height: 1.3,
                ),
              ),

              Gap(70.h),

              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    5,
                    (index) => CustomOtpWidget(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 4) {
                          focusNodes[index + 1].requestFocus();
                        }

                        if (value.isEmpty && index > 0) {
                          focusNodes[index - 1].requestFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),

              Gap(40.h),

              CustomButton(text: "Confirm", onPressed: confirmOtp),

              Gap(15.h),

              Align(
                alignment: Alignment.center,
                child: Text(
                  "Resend Code In 00:59",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
