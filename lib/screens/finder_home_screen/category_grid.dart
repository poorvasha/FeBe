import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/screens/nearby_users_screen/nearby_users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToNearbyUsersScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NearbyUsersScreen()),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Developer",
          style: AppTextStyles.semiBoldBeVietnamPro16
              .copyWith(color: AppColors.golden),
        ),
        GridView.count(
          childAspectRatio: 3.5,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: List.generate(10, //this is the total number of cards
              (index) {
            return SizedBox(
              width: 100,
              height: 80,
              child: TextButton(
                  onPressed: navigateToNearbyUsersScreen,
                  child: Text(
                    "Full Stack Dev",
                    style: AppTextStyles.regularBeVietnamPro16
                        .copyWith(color: AppColors.white),
                  )),
            );
          }),
        ),
      ],
    );
  }
}
