import 'package:firebase_chat_app/firebase_options.dart';
import 'package:firebase_chat_app/screens/chat_screen.dart';
import 'package:firebase_chat_app/screens/login_screen.dart';
import 'package:firebase_chat_app/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder:(context, orientation, screenType)=> MaterialApp(
          routes: {
            LoginScreen.id:(context)=> LoginScreen(),
            RegisterScreen.id:(context)=>RegisterScreen(),
            ChatScreen.id:(context)=>ChatScreen()
          },
          theme: ThemeData(
           //   fontFamily: 'Pacifico'
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: LoginScreen.id,
        )
    );
  }
}


