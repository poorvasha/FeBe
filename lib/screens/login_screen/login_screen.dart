
import 'package:febe_frontend/screens/otp_verification_screen/otp_verification_screen.dart';
import 'package:febe_frontend/services/auth_service.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:febe_frontend/widgets/default_loader.dart';
import 'package:febe_frontend/widgets/default_text_input.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';

import '../../configs/resources.dart';
import '../../widgets/default_checkbox.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isTermsAndConditionsAccepted = false;
  bool _isLoading = false;
  String phonenumber = "";

  @override
  Widget build(BuildContext context) {
    void getOTP() async {
      if (phonenumber.trim() == "") {
        return AppHelper.showSnackbar("Please enter phonenumber", context);
      }

      try {
        setState(() {
          _isLoading = true;
        });
        String? userType = await AppHelper.getUserType();
        if (userType == null) {
          AppHelper.showSnackbar(
              "User type was not selected, please go back and select user type",
              context);
          return;
        }

        await AuthService.sendOTP("+91$phonenumber", userType);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OTPVerificationScreen(
                    phoneNumber: phonenumber,
                  )),
        );
      } catch (e) {
        AppHelper.showSnackbar(
            "Something went wrong, please try again later", context);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
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
            value: phonenumber,
            keyboard: TextInputType.number,
            onChanged: (value) {
              setState(() {
                phonenumber = value;
              });
            },
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
            child: _isLoading
                ? const DefaultLoader()
                : ElevatedButton(
                    onPressed: isTermsAndConditionsAccepted ? getOTP : null,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.golden,
                        disabledBackgroundColor: AppColors.gray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                    child: Text(
                      "Get OTP",
                      style: AppTextStyles.semiBoldBeVietnamPro16.copyWith(
                          color: isTermsAndConditionsAccepted
                              ? AppColors.white
                              : AppColors.lightWhite,
                          fontSize: 20),
                    ),
                  ),
          ),
        ],
      )),
    );
  }
}
