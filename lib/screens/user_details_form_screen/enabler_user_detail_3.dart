import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widgets/default_text_input.dart';

class EnablerUserDetail3 extends StatelessWidget {
  const EnablerUserDetail3({super.key});

  @override
  Widget build(BuildContext context) {
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
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Front Side",
                      style: AppTextStyles.regularBeVietnamPro16
                          .copyWith(color: AppColors.white),
                    ),
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
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Back Side",
                      style: AppTextStyles.regularBeVietnamPro16
                          .copyWith(color: AppColors.white),
                    ),
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
