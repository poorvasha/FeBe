import 'package:febe_frontend/screens/finder_home_screen/user_designations.dart';
import 'package:febe_frontend/screens/finder_home_screen/user_type_picker.dart';
import 'package:febe_frontend/widgets/default_appbar.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../configs/resources.dart';
import 'category_grid.dart';

class FinderHomeScreen extends StatefulWidget {
  const FinderHomeScreen({super.key});

  @override
  State<FinderHomeScreen> createState() => _FinderHomeScreenState();
}

class _FinderHomeScreenState extends State<FinderHomeScreen> {
  String userType = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        goBack: false,
        title: "Find your mate",
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: FullScreenContainer(
        isInsideTabbar: true,
        child: Column(children: [
          if (userType == "") ...[
            Image.asset(
              "assets/images/boy_girl_looking.png",
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Are you looking for?",
              style: AppTextStyles.regularBeVietnamPro24
                  .copyWith(color: AppColors.golden),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
          UserTypePicker(
            onSelected: (value) {
              setState(() {
                userType = value;
              });
            },
            activeType: userType,
          ),
          if (userType != "") ...[
            const SizedBox(
              height: 20,
            ),
            Expanded(child: UserDesignations())
          ]
        ]),
      ),
    );
  }
}
