import 'package:febe_frontend/screens/otp_verification_screen.dart';
import 'package:febe_frontend/widgets/default_text_input.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../configs/resources.dart';
import '../widgets/default_checkbox.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isTermsAndConditionsAccepted = false;

  @override
  Widget build(BuildContext context) {
    void getOTP() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OTPVerificationScreen()),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: FullScreenContainer(
          child: Column(
        children: [
          Image.asset(
            "assets/images/xander_media.png",
            height: 180,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Log in",
            style: AppTextStyles.boldBeVietnamPro.copyWith(
              color: Theme.of(context).primaryColor,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          DefaultTextInput(
            hint: "Enter your Phone number",
          ),
          const SizedBox(
            height: 15,
          ),
          DefaultCheckbox(
            isChecked: isTermsAndConditionsAccepted,
            label:
                "By Signing up, you agree to the Terms of Service and Privacy Policy",
            onChanged: (value) => {
              setState(() {
                isTermsAndConditionsAccepted = value!;
              })
            },
          ),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: getOTP,
              child: Text(
                "Get OTP",
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
        ],
      )),
    );
  }
}
