import 'package:febe_frontend/models/data/enabler.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:flutter/material.dart';

import '../../configs/resources.dart';
import '../../models/data/expanded_user.dart';
import '../../models/data/user.dart';
import '../../services/user_service.dart';
import '../../widgets/default_text_input.dart';

class VerifyMyProfileSettings extends StatefulWidget {
  final ExpandedUser user;
  final UserType userType;
  const VerifyMyProfileSettings(
      {super.key, required this.user, required this.userType});

  @override
  State<VerifyMyProfileSettings> createState() =>
      _VerifyMyProfileSettingsState();
}

class _VerifyMyProfileSettingsState extends State<VerifyMyProfileSettings> {
  String linkedInURL = "";
  String portfolioURL = "";

  @override
  void initState() {
    super.initState();
    setDefaultValues();
  }

  void setDefaultValues() {
    setState(() {
      linkedInURL = widget.user.enabler?.linkedInURL ?? "";
      portfolioURL = widget.user.enabler?.portfolioURL ?? "";
    });
  }

  void updateUser() async {
    try {
      User user = User.fromExpandedUser(widget.user);

      user.enabler = user.enabler ?? Enabler();
      user.enabler?.linkedInURL = linkedInURL;
      user.enabler?.portfolioURL = portfolioURL;

      await UserService.updateUser(user);
    } catch (e) {
      AppHelper.showSnackbar("Something went wrong, please try again", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 0),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 0),
        shape: const Border(),
        title: Text(
          "Verify My Account",
          style: AppTextStyles.regularBeVietnamPro16
              .copyWith(color: AppColors.lightBlack),
        ), //header title
        children: [
          DefaultTextInput(
            hint: "Enter your linkedin URL",
            helperText: "This will be your professional referrence",
            label: "LinkedIn URL",
            value: linkedInURL,
            keyboard: TextInputType.text,
            onChanged: (value) {
              setState(() {
                linkedInURL = value;
              });
            },
          ),
          DefaultTextInput(
            hint: "Enter your portfolio URL",
            helperText: "This will be your work sample referrence",
            label: "Portfolio URL",
            keyboard: TextInputType.text,
            value: portfolioURL,
            onChanged: (value) {
              setState(() {
                portfolioURL = value;
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: updateUser,
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.golden,
                  disabledBackgroundColor: AppColors.lightWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
              child: Text(
                "Request Verification",
                style: AppTextStyles.boldBeVietnamPro
                    .copyWith(color: AppColors.black, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
