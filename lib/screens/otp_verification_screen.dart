import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:febe_frontend/widgets/otp_inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/default_appbar.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const DefaultAppbar(title: "OTP"),
      body: FullScreenContainer(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              "Phone Verification",
              style: AppTextStyles.boldBeVietnamPro
                  .copyWith(color: AppColors.golden, fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              "Please enter the 4-digit code send to you at",
              style: AppTextStyles.regularBeVietnamPro16
                  .copyWith(color: AppColors.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "+91 9790152711",
                style: AppTextStyles.semiBoldBeVietnamPro16
                    .copyWith(color: AppColors.golden),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: AppColors.golden,
                    size: 20,
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          OTPInputs(
            onChanged: (value) => {print(value)},
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: SizedBox(
              width: 268,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "1:59 Sec",
                    style: AppTextStyles.regularBeVietnamPro12
                        .copyWith(color: AppColors.lightWhite),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Resend OTP",
                        style: AppTextStyles.regularBeVietnamPro12
                            .copyWith(color: AppColors.lightWhite),
                      ))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 268,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Verfify OTP",
                style: AppTextStyles.semiBoldBeVietnamPro16
                    .copyWith(color: AppColors.white, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.golden,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
