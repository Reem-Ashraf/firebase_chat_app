import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/app_colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.buttonText,this.onTap}) : super(key: key);
  VoidCallback? onTap;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 6.h,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          buttonText,
          style: TextStyle(color: AppColors.darkBlueGreen,fontWeight: FontWeight.bold,fontSize: 18.sp),
        )),
      ),
    );
  }
}
