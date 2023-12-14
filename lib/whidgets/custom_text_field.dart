import 'package:flutter/material.dart';

import '../constant/app_colors/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, this.hintText, this.isSecure,this.onChange,required this.obscureText,this.suffixIcon, });
  String? hintText;
  bool? isSecure;
  bool obscureText=false;
  Function(String)?onChange;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (data){
        if(data!.isEmpty){
          return "this field mustn't be empty ";
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.white),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.white)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.white),
          )),
    );
  }
}
