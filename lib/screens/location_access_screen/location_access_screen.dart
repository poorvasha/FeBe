import 'package:febe_frontend/screens/user_details_form_screen/user_details_form_screen.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../configs/resources.dart';
import '../../widgets/default_appbar.dart';

class LocationAccessScreen extends StatelessWidget {
  const LocationAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToUserDetailForm() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const UserDetailsFormScreen()));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const DefaultAppbar(title: "Location"),
      body: FullScreenContainer(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset("assets/images/trail_map.png"),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Current Location",
            style: AppTextStyles.extraBoldBeVietnamPro
                .copyWith(color: AppColors.golden, fontSize: 22),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "To provide better experience",
            style: AppTextStyles.regularBeVietnamPro16
                .copyWith(color: AppColors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Please allow us the following permissions",
            style: AppTextStyles.regularBeVietnamPro16
                .copyWith(color: AppColors.white),
          ),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: navigateToUserDetailForm,
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.golden,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              child: Text(
                "Allow us",
                style: AppTextStyles.semiBoldBeVietnamPro16
                    .copyWith(color: AppColors.white, fontSize: 20),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
