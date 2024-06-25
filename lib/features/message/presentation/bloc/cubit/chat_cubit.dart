import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../data/model/chatid_model.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  final firestore = FirebaseFirestore.instance;
  ChatIdModel selectedChatId = ChatIdModel();
  selectChatId({user, otherUser}) {
    emit(ChatLoadingState());
    selectedChatId = ChatIdModel(currentUser: user, otherUser: otherUser);
    log(selectedChatId.otherUser.toString());
    emit(ChatLoadedState());
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "${b}_$a";
    } else {
      return "${a}_$b";
    }
  }

  final messagecontroller = TextEditingController();
  addMessage({currentuser, otheruser}) {
    List<String> users = [currentuser, otheruser];

    String chatroomid = getChatRoomId(currentuser, otheruser);
    Map<String, dynamic> chatroommap = {
      'users': users,
      'chatroomid': chatroomid
    };
    firestore.collection('chatsroom').doc(chatroomid).set(chatroommap);
    firestore
        .collection("chatsroom")
        .doc(chatroomid)
        .collection("chats")
        .add(<String, dynamic>{
      'sender': currentuser,
      'message': messagecontroller.text,
      'time': DateTime.now().millisecondsSinceEpoch,
    });
    messagecontroller.clear();
  }
}
