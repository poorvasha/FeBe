import 'package:febe_frontend/screens/chat_home_screen/post_card_item.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PostCardItem(
          title: "Create Post",
        ),
        PostCardItem(
          title: "Total Post",
          subTitle: "155",
        )
      ],
    );
  }
}
