import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/models/data/expanded_user.dart';
import 'package:febe_frontend/models/ui/profile_option.dart';
import 'package:febe_frontend/screens/profile_screen/profile_settings.dart';
import 'package:febe_frontend/widgets/default_appbar.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../configs/routes.dart';
import '../../popups/logout_confirmation_popup.dart';
import '../../providers/app_model.dart';
import '../../services/user_service.dart';
import '../../utils/app_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ExpandedUser? user;

  void showLogoutConfirmationPopup() async {
    showAlertDialog(context,
        title: "Confirmation",
        message: "Are you sure you wish to proceed with the logout?",
        buttonTitle: "Logout",
        onSuccess: logoutUser);
  }

  void logoutUser() async {
    Navigator.of(context).pop();
    AppHelper.logoutUser();
    context.read<AppModel>().setInitialRoute = Routes.loginScreen;
  }

  void fetchUserDetails() async {
    try {
      ExpandedUser currentUser = await UserService.getExpandedUser();
      setState(() {
        user = currentUser;
      });
    } catch (e) {
      AppHelper.showSnackbar("Something went wrong, please try again", context);
    }
  }

  @override
  void initState() {
    fetchUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(
        goBack: false,
        title: "Profile",
      ),
      body: FullScreenContainer(
        child: Column(children: [
          ClipOval(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.golden,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  "assets/images/user_avatar.png",
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ProfileSettings(),
          ListTile(
            onTap: showLogoutConfirmationPopup,
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            title: Text(
              "Logout",
              style: AppTextStyles.regularBeVietnamPro16
                  .copyWith(color: AppColors.red),
            ),
          )
        ]),
      ),
    );
  }
}
