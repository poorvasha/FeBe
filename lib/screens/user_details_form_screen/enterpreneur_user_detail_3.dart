import 'dart:io';

import 'package:febe_frontend/models/data/company_registration.dart';
import 'package:febe_frontend/models/data/entrepreneur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

import '../../configs/resources.dart';
import '../../models/data/user.dart';
import '../../services/file_service.dart';
import '../../utils/app_helper.dart';

class EnterpreneurUserDetail3 extends StatelessWidget {
  final User user;
  final Function(User) onChanged;
  const EnterpreneurUserDetail3({
    super.key,
    required this.user,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    void uploadAndUpdate() async {
      try {
        XFile? image = await AppHelper.pickImage(context);
        if (image == null) {
          AppHelper.showSnackbar("Please choose the image again", context);
          return;
        }

        dynamic response = await FileService.upload(File(image.path));
        user.entrepreneur ??= Entrepreneur();
        user.entrepreneur!.companyRegistrationDocument ??=
            CompanyRegistrationDocument();
        user.entrepreneur!.companyRegistrationDocument!.url = response["url"];
        onChanged(user);
      } catch (e) {
        AppHelper.showSnackbar(
            "Something went wrong, please try again", context);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 75,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Upload Company Reg Doc",
              style: AppTextStyles.regularBeVietnamPro24.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: uploadAndUpdate,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(
                      color:
                          user.entrepreneur?.companyRegistrationDocument?.url !=
                                  null
                              ? AppColors.green
                              : AppColors.white,
                      width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Incorporated  Certificate",
                      style: AppTextStyles.regularBeVietnamPro16
                          .copyWith(color: AppColors.white),
                    ),
                    Icon(
                      Icons.cloud_upload,
                      color:
                          user.entrepreneur?.companyRegistrationDocument?.url !=
                                  null
                              ? AppColors.green
                              : AppColors.white,
                    )
                  ]),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Please upload your Incorporated  Certificate to verify your profile.",
            textAlign: TextAlign.center,
            style: AppTextStyles.regularBeVietnamPro16.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
