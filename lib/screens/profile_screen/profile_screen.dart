import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/models/data/expanded_user.dart';
import 'package:febe_frontend/models/ui/profile_option.dart';
import 'package:febe_frontend/screens/profile_screen/user_card.dart';
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
  List<ProfileOption> OPTIONS = [
    ProfileOption(
      "Suggestions",
      SvgPicture.asset("assets/icons/suggestion_bg.svg"),
      "https://google.co.in",
      () {},
    ),
    ProfileOption(
      "About us",
      SvgPicture.asset(
        "assets/icons/info_bg.svg",
      ),
      "https://google.co.in",
      () {},
    ),
    ProfileOption(
      "Privacy Policy",
      SvgPicture.asset("assets/icons/info_bg.svg"),
      "https://google.co.in",
      () {},
    ),
    ProfileOption(
      "Terms and Conditions",
      SvgPicture.asset("assets/icons/info_bg.svg"),
      "https://google.co.in",
      () {},
    ),
    // ProfileOption("Switch Profile",
    // SvgPicture.asset("assets/icons/profile_bg.svg"), "https://google.co.in"),
    ProfileOption(
      "Logout",
      SvgPicture.asset("assets/icons/logout_bg.svg"),
      null,
      () {},
    )
  ];

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
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const DefaultAppbar(
        goBack: false,
        title: "Profile",
      ),
      body: FullScreenContainer(
        child: Column(
          children: [
            UserCard(
              name: user?.name! ?? "User",
              designation: user?.enabler?.designation?.name ??
                  user?.entrepreneur?.industry?.name ??
                  "--",
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: OPTIONS.length,
                itemBuilder: (BuildContext context, int index) {
                  ProfileOption item = OPTIONS[index];
                  return InkWell(
                    onTap: item.title == "Logout"
                        ? showLogoutConfirmationPopup
                        : () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          item.icon,
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              item.title,
                              textAlign: TextAlign.start,
                              style: AppTextStyles.regularBeVietnamPro20
                                  .copyWith(
                                      color: AppColors.white, fontSize: 18),
                            ),
                          ),
                          item.url != null
                              ? const Icon(
                                  Icons.chevron_right_sharp,
                                  color: AppColors.white,
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Text(
              "Made in 💛 with India",
              style: AppTextStyles.mediumBeVietnamPro.copyWith(
                fontSize: 20,
                color: AppColors.white,
              ),
            ),
            const SizedBox(
              height: 90,
            )
          ],
        ),
      ),
    );
  }
}
