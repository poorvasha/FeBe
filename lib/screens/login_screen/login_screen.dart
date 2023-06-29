
import 'package:febe_frontend/screens/otp_verification_screen/otp_verification_screen.dart';
import 'package:febe_frontend/services/auth_service.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:febe_frontend/utils/extensions.dart';
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
  bool isWhatsappNotificationAccepted = false;
  bool _isLoading = false;
  String phonenumber = "";
  bool enbleButton = false;
  String userType = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // var isContainsKey =
    //       await SecureStorage().containsKeyInSecureData('accessToken');
    //   if (isContainsKey) {
    //     var data = await SecureStorage().readSecureData('accessToken');
    //     if (data != null && data.isNotEmpty) {
    //       return true;
    //     }
    //   }
    Future.delayed(const Duration(seconds: 500));
    getUserType().then((value) { 
      setState(() {
        userType = value.toString().capitalize();
      });
    });
    // AppHelper.getUserType().then((value){ 
    //   userType = value.toString();
    // });
  }

  Future<String?> getUserType() async{
    return await AppHelper.getUserType();
  }
  @override
  Widget build(BuildContext context) {
    void getOTP() async {
      if (phonenumber.trim() == "" || phonenumber.length != 10) {
        return AppHelper.showSnackbar("Please enter valid phone number", context);
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

    void validateAllInputsToEnableButton(){
      if((phonenumber != null && phonenumber.isNotEmpty) && isTermsAndConditionsAccepted){
        setState(() {
          enbleButton = true;
        });
      }
      else{
        setState(() {
          enbleButton = false;
        });
      }
    }
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                "LOGIN",
                style: AppTextStyles.boldBeVietnamPro.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "You’re logging in as $userType",
                style: AppTextStyles.regularBeVietnamPro12.copyWith(
                  color: AppColors.extraLightBlack,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              DefaultTextInput(
                hint: "Enter your phone number",
                helperText: "This will create an account if you don’t have one",
                label: "Phone Number",
                value: phonenumber,
                keyboard: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    phonenumber = value;
                  });
                  validateAllInputsToEnableButton();
                },
              ),
              const SizedBox(
                height: 25,
              ),
              DefaultCheckbox(
                isChecked: isTermsAndConditionsAccepted,
                label:
                    "I’m hearby accepting the terms and conditions of FEBE to use this app",
                onChanged: (value) => {
                  setState(() {
                    isTermsAndConditionsAccepted = value!;
                  }),
                  validateAllInputsToEnableButton()
                },
              ),
              const SizedBox(
                height: 18,
              ),
              DefaultCheckbox(
                isChecked: isWhatsappNotificationAccepted,
                label:
                    "Receive Whatsapp notifications",
                onChanged: (value) => {
                  setState(() {
                    isWhatsappNotificationAccepted = value!;
                  }),
                },
              ),
              
            SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: _isLoading
                    ? const DefaultLoader()
                    : ElevatedButton(
                        onPressed: enbleButton ? getOTP : null,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.golden,
                            disabledBackgroundColor: AppColors.lightWhite,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                        child: Text(
                          
                          "Next",
                          style: AppTextStyles.boldBeVietnamPro.copyWith(
                              color: enbleButton
                                  ? AppColors.lightBlack
                                  : AppColors.gray.withOpacity(0.50),
                              fontSize: 18),
                        ),
                      ),
              ),
              SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }
}
