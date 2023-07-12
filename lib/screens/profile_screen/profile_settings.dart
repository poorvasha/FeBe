import 'package:febe_frontend/models/data/expanded_user.dart';
import 'package:febe_frontend/screens/profile_screen/general_settings.dart';
import 'package:febe_frontend/screens/profile_screen/verify_settings.dart';
import 'package:febe_frontend/services/user_service.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:flutter/material.dart';

import '../../configs/resources.dart';
import '../../widgets/default_loader.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  UserType? userType;

  @override
  void initState() {
    fetchUserType();
    super.initState();
  }

  Future<ExpandedUser?> fetchUser() async {
    ExpandedUser _user = await UserService.getExpandedUser();
    return _user;
  }

  void fetchUserType() async {
    UserType? _userType = await AppHelper.getUserType();
    setState(() {
      userType = _userType!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Something went wrong, please try again",
                style: AppTextStyles.semiBoldBeVietnamPro16
                    .copyWith(color: AppColors.black),
              ),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.data as ExpandedUser;
            return Column(
              children: [
                GeneralSettings(
                  user: data,
                  userType: userType!,
                  key: Key("${data.sId}general"),
                ),
                if (userType == UserType.enabler)
                  VerifyMyProfileSettings(
                      user: data,
                      userType: userType!,
                      key: Key("${data.sId}verify"))
              ],
            );
          }
        }

        // Displaying LoadingSpinner to indicate waiting state
        return const SizedBox(
          height: 200,
          child: Center(
            child: DefaultLoader(),
          ),
        );
      },
    );
  }
}
