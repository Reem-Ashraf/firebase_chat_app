import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../constant/app_colors/app_colors.dart';
import '../constant/constant.dart';
import '../helper/show_snack_bar.dart';
import '../whidgets/custom_button.dart';
import '../whidgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static String id = "registerScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;

  String? password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      color: AppColors.darkBlueGreen,
      child: Scaffold(
        backgroundColor: AppColors.darkBlueGreen,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Image.asset(
                      appLogo,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Scholar Chat",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 24.sp,
                            fontFamily: 'Pacifico'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20.sp,
                            fontFamily: 'Pacifico'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  CustomTextFormField(
                    onChange: (data) {
                      email = data;
                    },
                    hintText: "Email", obscureText: false,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextFormField(
                    onChange: (data) {
                      password = data;
                    },
                    hintText: "Password", obscureText: true,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomButton(
                    buttonText: 'SignUp',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          if (formKey.currentState!.validate()) {}
                          await registerMethod();
                          Navigator.pushNamed(context, ChatScreen.id);
                          showSnackBar(
                              context, "Account has been created succesfuly");
                          log("created");
                        } on FirebaseException catch (e) {
                          if (e.code == "weak password") {
                            showSnackBar(context, "weak password");
                          } else if (e.code == "email=already-in-use") {
                            showSnackBar(context, "email=already-in-use");
                          }
                          showSnackBar(context, e.code.toString());
                          log(e.toString());
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: AppColors.white),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text("LogIn",
                              style: TextStyle(color: AppColors.lightCyan)))
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



  Future<void> registerMethod() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
