import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/screens/chat_screen/febe_chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../models/data/all_chats_data_model.dart';
import '../../models/data/user.dart';
import '../../providers/app_model.dart';
import '../../services/chat_service.dart';
import '../../utils/app_helper.dart';
import 'chat_item.dart';

class ChatsList extends StatefulWidget {
  const ChatsList({super.key, required this.currentUser});
  final User currentUser;
  @override
  State<ChatsList> createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
  List<ChatsData> currentChats = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetchChats();
  }

  Future<List<ChatsData>> fetchChats() async {
    try {
      var data = await ChatService.getChats();
      currentChats = data!.isEmpty ? [] : data;
      // context.read<AppModel>().setChats = currentChats;
      return currentChats;
    } catch (e) {
      AppHelper.showSnackbar("Something went wrong, please try again", context);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChatsData>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                //   return ChatItem(
                //     currentUser: widget.currentUser,
                //     selectChatIndex: index,
                //     isVerified: false,
                //     chatDetails : context.watch<AppModel>().getChats[index]
                //   );
                // },

                if (snapshot.connectionState == ConnectionState.done) {
                  // If we got an error
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '${snapshot.error} occurred',
                        style: TextStyle(fontSize: 18),
                      ),
                    );

                    // if we got our data
                  } else if (snapshot.hasData) {
                    // Extracting data from snapshot object
                    return ChatItem(
                        currentUser: widget.currentUser,
                        selectChatIndex: index,
                        isVerified: false,
                        chatDetails: snapshot.data![index]);
                  }
                }
                // Displaying LoadingSpinner to indicate waiting state
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/chats_not_found.png",
                      ),
                      Text(
                        "You have no chats right now, find your fellow collegue using the Finder!",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.regularBeVietnamPro12
                            .copyWith(fontSize: 14),
                      )
                    ],
                  ),
                );
              });
        }
        // Displaying LoadingSpinner to indicate waiting state
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Image.asset(
                "assets/images/chats_not_found.png",
              ),
              Text(
                "You have no chats right now, find your fellow collegue using the Finder!",
                textAlign: TextAlign.center,
                style:
                    AppTextStyles.regularBeVietnamPro12.copyWith(fontSize: 14),
              )
            ],
          ),
        );
      },
      future: fetchChats(),
    );
  }
}
