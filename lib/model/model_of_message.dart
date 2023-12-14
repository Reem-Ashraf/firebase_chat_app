

import 'package:firebase_chat_app/constant/app_colors/app_colors.dart';

import '../constant/constant.dart';

class MessageModel{
   final String? message;
   final String? id;
   MessageModel(this.message, this.id);
   factory MessageModel.fromJson(jsonData){
     return MessageModel(jsonData[kMessage],jsonData[kid]);
   }

}