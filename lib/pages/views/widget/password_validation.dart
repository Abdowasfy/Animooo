import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({
    super.key,
    required this.hasMinLength,
    required this.hasUpperCase,
    required this.hasLowerCase,
    required this.hasSpecialChar,
    required this.hasNumber,
  });

  final bool hasMinLength;
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasSpecialChar;
  final bool hasNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Please add all necessary characters to create safe password.",
          style: TextStyle(
            color: Colors.red,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),

        _buildItem("Minimum characters 12.", hasMinLength),
        _buildItem("One uppercase character.", hasUpperCase),
        _buildItem("One lowercase character.", hasLowerCase),
        _buildItem("One special character.", hasSpecialChar),
        _buildItem("One number.", hasNumber),
      ],
    );
  }

  Widget _buildItem(String text, bool valid) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 6.sp,
            color: valid ? Colors.green : Colors.red,
          ),
          SizedBox(width: 6.w),
          Text(
            text,
            style: TextStyle(
              color: valid ? Colors.green : Colors.red,
              fontSize: 10.sp,
              decoration: valid
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
