import 'package:flutter/material.dart';

import '../../configs/resources.dart';
import '../../widgets/default_text_input.dart';

class VerifyMyProfileSettings extends StatefulWidget {
  const VerifyMyProfileSettings({super.key});

  @override
  State<VerifyMyProfileSettings> createState() =>
      _VerifyMyProfileSettingsState();
}

class _VerifyMyProfileSettingsState extends State<VerifyMyProfileSettings> {
  @override
  void initState() {
    super.initState();
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
            keyboard: TextInputType.text,
            onChanged: (value) {},
          ),
          DefaultTextInput(
            hint: "Enter your portfolio URL",
            helperText: "This will be your work sample referrence",
            label: "Portfolio URL",
            keyboard: TextInputType.text,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.golden,
                  disabledBackgroundColor: AppColors.lightWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
              child: Text(
                "Request Verification",
                style: AppTextStyles.boldBeVietnamPro.copyWith(
                    color: false
                        ? AppColors.lightBlack
                        : AppColors.gray.withOpacity(0.50),
                    fontSize: 18),
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
