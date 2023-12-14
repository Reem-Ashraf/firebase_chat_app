import 'package:firebase_chat_app/model/model_of_message.dart';
import 'package:flutter/cupertino.dart';
import '../constant/app_colors/app_colors.dart';

class ChatBubble extends StatelessWidget {
   const ChatBubble({Key? key,required this.message}) : super(key: key);
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 25,top: 25,bottom: 25,right: 25),
        //alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        decoration: const BoxDecoration(
            color: AppColors.darkBlueGreen,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
                bottomRight: Radius.circular(32))),
        child:  Text(
          message.message!,
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({Key? key,required this.message}) : super(key: key);
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(left: 25,top: 25,bottom: 25,right: 25),
        //alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        decoration: const BoxDecoration(
            color: AppColors.lightBlueGreen,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
                bottomLeft: Radius.circular(32))),
        child:  Text(
          message.message!,
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
