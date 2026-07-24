import 'package:animooo/constans/app_colors.dart';
import 'package:animooo/pages/views/login_screen.dart';
import 'package:animooo/pages/views/widget/custom_botton.dart';
import 'package:animooo/pages/views/widget/custom_text_field.dart';
import 'package:animooo/pages/views/widget/password_validation.dart';
import 'package:animooo/pages/views/widget/upload_image_widget.dart';
import 'package:animooo/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final Phone = TextEditingController();
  final pass = TextEditingController();
  final conpass = TextEditingController();

  File? selectedImage;

  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    print("Start");

    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      print(image?.path);

      if (image != null) {
        setState(() {
          selectedImage = File(image.path);
        });
      }
    } catch (e) {
      print(e);
    }

    print("End");
  }

  void showImagePicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Center(
                          child: Text(
                            "Photo Gallery",
                            style: TextStyle(color: Color(0xFF04332D)),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Divider(height: 1),
                      ListTile(
                        title:  Center(child: Text("Camera",style: TextStyle(color: Color(0xFF04332D)),),),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: const Center(child: Text("Cancel",style: TextStyle(color: Color(0xFF04332D)),)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void dispose() {
    firstname.dispose();
    lastname.dispose();
    email.dispose();
    Phone.dispose();
    pass.dispose();
    conpass.dispose();
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
            child: Center(
              child: Column(
                children: [
                  Gap(20.h),

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

                  Text("Sign Up", style: AppTextStyles.titleStyle),

                  Gap(30.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "First Name",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  Gap(8.h),

                  CustomTextField(
                    controller: firstname,
                    hint: "Enter your First Name",
                    isPassword: false,
                  ),

                  Gap(10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Last Name",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  Gap(8.h),

                  CustomTextField(
                    controller: lastname,
                    hint: "Enter your Last Name",
                    isPassword: false,
                  ),

                  Gap(10),
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
                    controller: email,
                    hint: "Enter your email address",
                    isPassword: false,
                  ),

                  Gap(10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Phone",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  Gap(8.h),

                  CustomTextField(
                    controller: Phone,
                    hint: "Enter your Phone",
                    isPassword: false,
                  ),

                  Gap(10),
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
                    controller: pass,
                    hint: "********",
                    isPassword: true,
                  ),

                  Gap(10),

                  PasswordValidation(
                    hasMinLength: true,
                    hasUpperCase: false,
                    hasLowerCase: true,
                    hasSpecialChar: true,
                    hasNumber: true,
                  ),

                  Gap(10),
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
                  Gap(15),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Upload Image For Your Profile",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Gap(10.h),
                  GestureDetector(
                    onTap: showImagePicker,
                    child: UploadImageWidget(),
                  ),
                  Gap(25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account already ?",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Log in",
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
      ),
    );
  }
}
