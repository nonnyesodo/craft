import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/constants/appscaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftman/features/authentication/presentation/bloc/cubit/auth_cubit.dart';
import 'package:craftman/features/message/presentation/bloc/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/export.dart';

class MessageDetailPage extends StatelessWidget {
  const MessageDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    final user = context.watch<AuthCubit>().user;
    final firestore = FirebaseFirestore.instance;
    return AppScaffold(
      color: Appcolors.lightgrey,
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore
            .collection("chatsroom")
            .doc(context
                .watch<ChatCubit>()
                .getChatRoomId(user.email!, 'otheruser'))
            .collection("chats")
            .orderBy('time')
            .snapshots(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? SingleChildScrollView(
                  reverse: true,
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: controller,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.docs[index].data() as Map;
                        return MessageBubble(
                          sender: (data["sender"]),
                          text: (data["message"]),
                          isMe: user == (data["sender"]),
                        );
                      }),
                )
              : Container();
        },
      ),
    );
  }
}
