import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat_app/constant/app_colors/app_colors.dart';
import 'package:firebase_chat_app/model/model_of_message.dart';
import 'package:firebase_chat_app/whidgets/chat_buble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/constant.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'ChatPage';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ///that refers to collection that i want to use or access data on it
  CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );

  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      ///that's request to get data from collection
      /// query snapshot that refer to all document the collection (query)
      /// snap shot that have all data that i wan to access
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapShot) {
        ///snapShot that contain the data tha i want to access
        if (snapShot.hasData) {
          //  print(snapShot.data!.docs[0]['message']);
          List<MessageModel> messageList = [];

          ///for loop to count and print this messages in my screen
          for (int i = 0; i < snapShot.data!.docs.length; i++) {
            /// i want to save document in my list
            /// so i have to add this doc to my message model fro json
            messageList.add(MessageModel.fromJson(snapShot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.darkBlueGreen,
              // centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      appLogo,
                      height: 6.h,
                    ),
                    Text(
                      "Chat",
                      style: TextStyle(color: AppColors.white),
                    )
                  ],
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                    icon: Icon(
                      Icons.login_rounded,
                      color: AppColors.white,
                    ))
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        return messageList[index].id == email
                            ? ChatBubble(
                                message: messageList[index],
                              )
                            : ChatBubbleForFriend(message: messageList[index]);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({
                        kMessage: data,
                        kCreatedAt: DateTime.now(),
                        'id': email
                      });
                      controller.clear();
                      log("created");
                      _controller.animateTo(0,
                          duration: Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          //  color: AppColors.darkBlueGreen
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                BorderSide(color: AppColors.darkBlueGreen)),
                        suffixIcon: IconButton(onPressed: (){},
                          icon: Icon(
                            Icons.send,
                            color: AppColors.darkBlueGreen,
                          ),
                        ),
                        hintText: "Send Message"),
                  ),
                )
              ],
            ),
          );
        } else {
          return const Scaffold(
              body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Messages has been Loading....."),
              CircularProgressIndicator(),
            ],
          ));
        }
      },
    );
  }
}
