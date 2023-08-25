import 'dart:io';

import 'package:febe_frontend/configs/api_routes.dart';
import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/screens/chat_screen/chat_appbar.dart';
import 'package:febe_frontend/screens/chat_screen/chat_message.dart';
import 'package:febe_frontend/services/chat_service.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/data/all_chats_data_model.dart';
import '../../models/data/chat_data.dart';
import '../../models/data/chat_messages_data_model.dart';
import '../../models/data/user.dart';
import '../../services/user_service.dart';
import '../../widgets/default_appbar.dart';
import 'message_box.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  final String name;
  final bool isVerified;
  final bool isFEBE;
  User currentUser;
  ChatsData? chatDetails;
  ChatScreen(
      {super.key,
      required this.currentUser,
      required this.name,
      required this.isVerified,
      this.isFEBE = false,
      this.chatDetails});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textController = TextEditingController(text: "");
  ScrollController _scrollController = new ScrollController();

  List<ChatMessage> messages = [
    // ChatMessage(
    //     messageContent: "Hello, Will",
    //     messageType: "receiver",
    //     dateTime: DateTime.now()),
    // ChatMessage(
    //     messageContent: "How have you been?",
    //     messageType: "receiver",
    //     dateTime: DateTime.now()),
    // ChatMessage(
    //     messageContent:
    //         "Hey Kriss, I am doing fine dude. wbu? jhcbshjcbjas sjkjkqanjqknskq jkqnsjkqnwq kjnkjsnxuswxusw sjnxjwnsxiuwhxiwhihwihw wuchsciuwhciwhciowh ",
    //     messageType: "sender",
    //     dateTime: DateTime.now()),
    // ChatMessage(
    //     messageContent: "ehhhh, doing OK.",
    //     messageType: "receiver",
    //     dateTime: DateTime.now()),
    // ChatMessage(
    //     messageContent: "Is there any thing wrong?",
    //     messageType: "sender",
    //     dateTime: DateTime.now()),
  ];
  IO.Socket? socket;
  String? userId;
  String? targetUserId;

  @override
  void initState() {
    initSocket();
    super.initState();

    userId = widget.currentUser.sId;
    targetUserId = widget.chatDetails!.targetUser!.sId;
  }

  @override 
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchMessages();
  }

  fetchMessages() async {
    List<ExpandedChatMessage> expandedMessages = await ChatService.getMessages(widget.chatDetails!.room!.sId!);
    for (int i = expandedMessages.length-1; i >= 0; i--) {
      ExpandedChatMessage element = expandedMessages[i];
      messages.add(ChatMessage(
        userId: element.fromId!.sId!,
        targetUserId: element.toId!.sId!, 
        name: widget.currentUser.sId! == element.fromId!.sId! ? element.fromId!.name! : element.toId!.name!, 
        messageContent: element.text!,
        messageType: userId == element.fromId!.sId! ? "currentUser" : "targetUser", 
        dateTime: DateTime.parse(element.createdAt!)));
    }
    var mmm = messages.reversed;
    setState(() {
        messages.reversed;
      });
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 2000,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 2000),
      );
  }

  initSocket() {
    socket = IO.io(ApiRoutes.sockeServertUrl, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket!.connect();

    // when socket connection has beeen established the onConnect will triggered
    socket!.onConnect((_) {
      print('Connection established');
    });
    socket!.onDisconnect((_) => print('Connection Disconnection'));
    socket!.onConnectError((err) => print(err));
    socket!.onError((err) => print(err));

    //TODO add data dynamically
    ChatJoinerData chatJoinerData = ChatJoinerData(
        userId: userId,  targetUserId: targetUserId);
    socket!.emit('user-joined', chatJoinerData);

    socket!.on('chat', (newMessage) {
      ChatMessageRecievingData recieveingData =
          ChatMessageRecievingData.fromJson(newMessage);

      messages.add(ChatMessage(
          userId: targetUserId!,
          targetUserId: userId!,
          name: recieveingData.username ?? "Unknown",
          messageContent: recieveingData.message ?? "Opps! empty message",
          messageType: "targetUser",
          dateTime: DateTime.now()));
      setState(() {
        messages;
      });
    });
  }

  void sendMessage(String text) {
    if (text.isEmpty) {
      return;
    }

    ChatMessageSendingData chatMessageSendingData = ChatMessageSendingData(
        userId: userId,
        message: text,
        targetUserId: targetUserId);

    socket!.emit('chat', chatMessageSendingData.toJson());

    setState(() {
      messages.add(ChatMessage(
          userId: userId!,
          targetUserId: targetUserId!,
          name: widget.currentUser.name ?? "Unknown",
          messageContent: text,
          messageType: "currentUser",
          dateTime: DateTime.now()));
      textController.text = "";
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 2000,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 2000),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 24,
        toolbarHeight: kToolbarHeight,
        backgroundColor: AppColors.lightGolden,
        centerTitle: true,
        title: ListTile(
          titleAlignment: ListTileTitleAlignment.titleHeight,
          leading: CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.golden,
            child: Center(
              child: Text(
                widget.currentUser.name == null ||
                        widget.currentUser.name!.isEmpty
                    ? "U"
                    : widget.currentUser.name!.substring(0, 2),
                textAlign: TextAlign.center,
                style: AppTextStyles.regularBeVietnamPro16
                    .copyWith(color: AppColors.lightBlack),
              ),
            ),
          ),
          title: Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.chatDetails!.targetUser!.name ?? "Unknown",
              style: AppTextStyles.semiBoldBeVietnamPro20
                  .copyWith(fontSize: 16, color: AppColors.black),
            ),
          ),
        ),
        //goBack: true,
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            controller: _scrollController,
            padding: EdgeInsets.only(top: 10, bottom: 70),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(
                    left: messages[index].messageType == "targetUser" ? 14 : 50,
                    right: messages[index].messageType == "targetUser" ? 50 : 14,
                    top: 10,
                    bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "targetUser"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "targetUser"
                          ? Colors.grey.shade200
                          : Colors.blue[200]),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      messages[index].messageContent,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 64,
              width: double.infinity,
              color: AppColors.lightGolden,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: AppColors.golden,
                        child: Icon(
                          Icons.attach_file_rounded,
                          color: AppColors.black,
                          size: 20,
                        ),
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: textController,
                        style: AppTextStyles.regularBeVietnamPro16
                            .copyWith(color: AppColors.extraLightBlack),
                        textAlignVertical: TextAlignVertical.center,
                        autofocus: true,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.send),
                            color: AppColors.golden,
                            onPressed: () {
                              sendMessage(textController.text);
                            },
                          ),
                          fillColor: AppColors.white,
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          labelStyle:
                              AppTextStyles.semiBoldBeVietnamPro12.copyWith(
                            color: AppColors.lightBlack,
                          ),
                          contentPadding: const EdgeInsets.all(8),
                          labelText: "Message",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  // FloatingActionButton(
                  //   onPressed: (){},
                  //   child: Icon(Icons.send,color: Colors.white,size: 18,),
                  //   backgroundColor: Colors.blue,
                  //   elevation: 0,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
