import 'package:febe_frontend/models/data/expanded_user.dart';
import 'package:febe_frontend/screens/profile_screen/general_settings.dart';
import 'package:febe_frontend/screens/profile_screen/verify_settings.dart';
import 'package:febe_frontend/services/user_service.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  ExpandedUser user = ExpandedUser();
  UserType? userType;

  @override
  void initState() {
    fetchUser();
    fetchUserType();
    super.initState();
  }

  void fetchUser() async {
    try {
      ExpandedUser _user = await UserService.getExpandedUser();
      setState(() {
        user = _user;
      });
    } catch (e) {
      AppHelper.showSnackbar(
          "Couldn't fetch details, please try again later", context);
    }
  }

  void fetchUserType() async {
    UserType? _userType = await AppHelper.getUserType();
    setState(() {
      userType = _userType!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GeneralSettings(
          user: user,
          userType: userType!,
          key: Key("${user.sId}enabler"),
        ),
        VerifyMyProfileSettings(
            user: user,
            userType: userType!,
            key: Key("${user.sId}entrepreneur"))
      ],
    );
  }
}
