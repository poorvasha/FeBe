import 'dart:async';
import 'dart:io';

import 'package:febe_frontend/configs/constants.dart';
import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/models/data/user.dart';
import 'package:febe_frontend/screens/location_access_screen/location_access_screen.dart';
import 'package:febe_frontend/screens/user_details_form_screen/user_details_form_screen.dart';
import 'package:febe_frontend/services/user_service.dart';
import 'package:febe_frontend/utils/app_exception.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:febe_frontend/screens/otp_verification_screen/otp_inputs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/routes.dart';
import '../../providers/app_model.dart';
import '../../services/auth_service.dart';
import '../../utils/app_helper.dart';
import '../../widgets/default_appbar.dart';
import '../../utils/extensions.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  String otp = "";

  Timer? _timer;
  int _currentTime = OTP_RETRY_TIME;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_currentTime == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _currentTime--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void navigateToRespectiveScreen() async {
      try {
        User user = await UserService.getUser();

        Navigator.of(context).popUntil((route) => route.isFirst);
        if (user.isSignupCompleted!) {
          context.read<AppModel>().setInitialRoute = Routes.homeScreen;
          return;
        }

        context.read<AppModel>().setInitialRoute = Routes.userDetailScreen;
      } catch (e) {
        AppHelper.showSnackbar(
            "Something went wrong, please try again later", context);
      }
    }

    void verifyOTP() async {
      try {
        dynamic response =
            await AuthService.verifyOTP("+91${widget.phoneNumber}", otp);
        AppHelper.setAccessToken(response['auth-token']);
        navigateToRespectiveScreen();
      } on BadRequestException catch (e) {
        AppHelper.showSnackbar(
            e.message?.capitalize() ??
                "Something went wrong, please try again later",
            context);
      } catch (e) {
        AppHelper.showSnackbar(
            "Something went wrong, please try again later", context);
      }
    }

    void resendOTP() async {
      try {
        String? userType = await AppHelper.getUserType();
        if (userType == null) {
          AppHelper.showSnackbar(
              "User type was not selected, please go back and select user type",
              context);
          return;
        }

        await AuthService.sendOTP("+91${widget.phoneNumber}", userType);
        AppHelper.showSnackbar("OTP Sent", context);

        setState(() {
          _currentTime = OTP_RETRY_TIME;
        });
        startTimer();
      } catch (e) {
        AppHelper.showSnackbar(
            "Something went wrong, please try again later", context);
      }
    }

    void goBack() {
      Navigator.pop(context);
    }

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
                "+91${widget.phoneNumber}",
                style: AppTextStyles.semiBoldBeVietnamPro16
                    .copyWith(color: AppColors.golden),
              ),
              IconButton(
                  onPressed: goBack,
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
            onChanged: (value) => {
              setState(() {
                otp = value.toString();
              })
            },
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
                    AppHelper.convertSecToMin(timeInSecond: _currentTime),
                    style: AppTextStyles.regularBeVietnamPro12
                        .copyWith(color: AppColors.lightWhite),
                  ),
                  TextButton(
                      onPressed: _timer != null && !_timer!.isActive
                          ? resendOTP
                          : null,
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
              onPressed: otp.length == 4 ? verifyOTP : null,
              child: Text(
                "Verfify OTP",
                style: AppTextStyles.semiBoldBeVietnamPro16.copyWith(
                    color: otp.length == 4
                        ? AppColors.white
                        : AppColors.lightWhite,
                    fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.golden,
                  disabledBackgroundColor: AppColors.gray,
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
