import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadImageWidget extends StatelessWidget {
  const UploadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: const Color(0xff0B3B36),
      strokeWidth: 1,
      dashPattern: const [4, 3],
      borderType: BorderType.RRect,
      radius: Radius.circular(12.r),
      child: Container(
        height: 180.h,
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image,
              size: 35.sp,
              color: const Color(0xff0B3B36),
            ),
            SizedBox(height: 12.h),
            Text(
              "Select file",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}