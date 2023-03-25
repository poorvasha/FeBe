import 'dart:io';

import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/models/data/aadhar.dart';
import 'package:febe_frontend/models/data/enabler.dart';
import 'package:febe_frontend/services/file_service.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/data/user.dart';
import '../../widgets/default_text_input.dart';

class EnablerUserDetail3 extends StatelessWidget {
  final User user;
  final Function(User) onChanged;

  EnablerUserDetail3({super.key, required this.user, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    void uploadAndUpdate(String side) async {
      try {
        XFile? image = await AppHelper.pickImage(context);
        if (image == null) {
          AppHelper.showSnackbar("Please choose the image again", context);
          return;
        }

        dynamic response = await FileService.upload(File(image.path));
        user.enabler ??= Enabler();
        user.enabler!.aadhar ??= Aadhar();
        if (side == "front") user.enabler!.aadhar!.front = response["url"];
        if (side == "back") user.enabler!.aadhar!.back = response["url"];
        onChanged(user);
      } catch (e) {
        AppHelper.showSnackbar(
            "Something went wrong, please try again", context);
      }
    }

    void onFrontSideTapped() async {
      uploadAndUpdate("front");
    }

    void onBackSideTapped() async {
      uploadAndUpdate("back");
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
              "Upload Aadhar",
              style: AppTextStyles.regularBeVietnamPro24.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: onFrontSideTapped,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: user.enabler?.aadhar?.front != null
                          ? Colors.green
                          : Colors.white,
                      width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Front Side",
                      style: AppTextStyles.regularBeVietnamPro16
                          .copyWith(color: AppColors.white),
                    ),
                    if (user.enabler?.aadhar?.front != null)
                      const Icon(
                        Icons.cloud_upload,
                        color: AppColors.green,
                      ),
                    if (user.enabler?.aadhar?.front == null)
                      const Icon(
                        Icons.cloud_upload,
                        color: AppColors.white,
                      )
                  ]),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: onBackSideTapped,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: user.enabler?.aadhar?.back != null
                          ? Colors.green
                          : Colors.white,
                      width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Back Side",
                      style: AppTextStyles.regularBeVietnamPro16
                          .copyWith(color: AppColors.white),
                    ),
                    if (user.enabler?.aadhar?.back != null)
                      const Icon(
                        Icons.cloud_upload,
                        color: AppColors.green,
                      ),
                    if (user.enabler?.aadhar?.back == null)
                      const Icon(
                        Icons.cloud_upload,
                        color: AppColors.white,
                      )
                  ]),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Please upload your aadhar to verify your profile.",
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
