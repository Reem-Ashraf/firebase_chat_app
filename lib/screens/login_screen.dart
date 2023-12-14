
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../constant/app_colors/app_colors.dart';
import '../constant/constant.dart';
import '../helper/show_snack_bar.dart';
import '../whidgets/custom_button.dart';
import '../whidgets/custom_text_field.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);
  static String id="logInScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  
}


class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false,isSecure=true;
  String? email,password;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState>formKey=GlobalKey();
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: AppColors.darkBlueGreen,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Image.asset( appLogo,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Scholar Chat",
                        style: TextStyle(color: AppColors.white, fontSize: 24.sp,fontFamily: 'Pacifico'),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h,),
                  Row(
                    children: [
                      Text(
                        "Log In",
                        style: TextStyle(color: AppColors.white, fontSize: 20.sp,fontFamily: 'Pacifico'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  CustomTextFormField(

                    onChange: (data){
                      email=data;
                    },
                    hintText: "Email", obscureText: false,
                   /// suffixIcon: Icon(Icons.email_outlined,color:AppColors.white),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextFormField(
                    onChange: (data){
                      password=data;
                    },
                    hintText: "Password", obscureText:isSecure,
                    // suffixIcon:IconButton(
                    //   icon: Icon(
                    //     // Based on passwordVisible state choose the icon
                    //     isSecure
                    //         ? Icons.visibility
                    //         : Icons.visibility_off,
                    //     color: AppColors.white,
                    //   ),
                    //   onPressed: () {
                    //     // Update the state i.e. toggle the state of passwordVisible variable
                    //     setState(() {
                    //       isSecure =  !isSecure;
                    //     });
                    //   },
                    // ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomButton(
                    onTap: ()async{
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          if (formKey.currentState!.validate()) {}
                          await loginMethod();
                          Navigator.pushNamed(context, ChatScreen.id,arguments: email);
                          showSnackBar(
                              context, "Login succesfuly");
                          log("created");
                        } on FirebaseException catch (e) {
                          if (e.code == "Wrong Password") {
                            showSnackBar(context, "Wrong Password");
                          } else if (e.code == "user-not-found") {
                            showSnackBar(context, "user-not-found");
                          }
                          showSnackBar(context, e.code.toString());
                          log(e.toString());
                        }catch(ex){
                          showSnackBar(context, ex.toString());
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                    buttonText: 'LOGIN',
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account? ",
                        style: TextStyle(color: AppColors.white),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                          child: Text("Rigester Now",
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

  Future<void> loginMethod() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}


