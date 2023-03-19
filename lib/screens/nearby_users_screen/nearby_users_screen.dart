import 'package:febe_frontend/screens/nearby_users_screen/nearby_user_card.dart';
import 'package:febe_frontend/widgets/default_appbar.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NearbyUsersScreen extends StatelessWidget {
  const NearbyUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: DefaultAppbar(title: "Full Stack Dev"),
      body: FullScreenContainer(
          child: ListView(
        children: List.generate(20, //this is the total number of cards
            (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: NearbyUserCard(),
          );
        }),
      )),
    );
  }
}
