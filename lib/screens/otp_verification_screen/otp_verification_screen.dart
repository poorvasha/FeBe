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

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:provider/provider.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../configs/routes.dart';
import '../../providers/app_model.dart';
import '../../services/auth_service.dart';
import '../../utils/app_helper.dart';
import '../../widgets/default_appbar.dart';
import '../../utils/extensions.dart';
import '../../widgets/default_loader.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  String otp = "";
  bool _isLoading = false;

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
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }

    void verifyOTP() async {
      try {
        setState(() {
          _isLoading = true;
        });

        dynamic response =
            await AuthService.verifyOTP("+91${widget.phoneNumber}", otp);
        AppHelper.setAccessToken(response['auth-token']);
        navigateToRespectiveScreen();
      } on BadRequestException catch (e) {
        AppHelper.showSnackbar(
            e.message?.capitalize() ??
                "Something went wrong, please try again later",
            context);
        setState(() {
          _isLoading = false;
        });
      } catch (e) {
        AppHelper.showSnackbar(
            "Something went wrong, please try again later", context);
        setState(() {
          _isLoading = false;
        });
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
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(25.0),
          child: Column(children: [
            const SizedBox(
              height: 73,
            ),
            Image.asset(
              "assets/images/eoe_logo.png",
              // height: 180,
            ),
            const SizedBox(
              height: 73,
            ),
            Text(
              "OTP Verification",
              style: AppTextStyles.boldBeVietnamPro.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "You would have received an OTP on your device right now",
              textAlign: TextAlign.center,
              style: AppTextStyles.regularBeVietnamPro12.copyWith(
                color: AppColors.extraLightBlack,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: OTPTextField(
                outlineBorderRadius: 5,
                spaceBetween: 5,
                length: 4,
                fieldWidth: 50,
                width: MediaQuery.of(context).size.width,
                style: AppTextStyles.semiBoldBeVietnamPro20
                    .copyWith(color: AppColors.lightBlack),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                otpFieldStyle: OtpFieldStyle(
                  borderColor: AppColors.lightBlack,
                  focusBorderColor: AppColors.golden,
                  disabledBorderColor: AppColors.lightBlack,
                  enabledBorderColor: AppColors.lightBlack,
                ),
                onChanged: (value) {
                  setState(() {
                    otp = value;
                  });
                },
              ),
            ),
            Spacer(),
            Center(
              child: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppHelper.convertSecToMin(timeInSecond: _currentTime),
                      style: AppTextStyles.regularBeVietnamPro12
                          .copyWith(color: AppColors.lightBlack),
                    ),
                    TextButton(
                        onPressed: _timer != null && !_timer!.isActive
                            ? resendOTP
                            : null,
                        child: Text(
                          "Resend OTP",
                          style: AppTextStyles.regularBeVietnamPro12
                              .copyWith(color: AppColors.lightBlack),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: _isLoading
                  ? const DefaultLoader()
                  : ElevatedButton(
                      onPressed: otp.length == 4 ? verifyOTP : null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.golden,
                          disabledBackgroundColor: AppColors.lightWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                      child: Text(
                        "Next",
                        style: AppTextStyles.boldBeVietnamPro.copyWith(
                            color: otp.length == 4
                                ? AppColors.lightBlack
                                : AppColors.gray.withOpacity(0.50),
                            fontSize: 18),
                      ),
                    ),
            ),
            const SizedBox(
              height: 70,
            ),
          ]),
        ),
      ),
    );
  }
}
