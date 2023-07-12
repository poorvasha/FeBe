import 'package:febe_frontend/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/resources.dart';
import '../../configs/routes.dart';
import '../../providers/app_model.dart';
import 'user_type_card.dart';

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({super.key});

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  bool enablerRadioSelected = true;
  bool entrepreneurRadioSelected = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    void setUserType(UserType value) async {
      AppHelper.setUserType(value);
      bool isUsingForFirstTime = await AppHelper.isUserUsingForFirstTime();
      context.read<AppModel>().setInitialRoute =
          isUsingForFirstTime ? Routes.getStartedScreen : Routes.loginScreen;
    }

    void onRadioButtonSelected(String value) {
      if (value == "enabler") {
        setState(() {
          enablerRadioSelected = true;
          entrepreneurRadioSelected = false;
        });
      } else {
        setState(() {
          entrepreneurRadioSelected = true;
          enablerRadioSelected = false;
        });
      }
    }

    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/welcome.png"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Welcome!",
                          style: AppTextStyles.boldBeVietnamPro.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 32)),
                      const SizedBox(
                        height: 30,
                      ),
                      Text("What suits you better",
                          style: AppTextStyles.semiBoldBeVietnamPro20.copyWith(
                            color: AppColors.lightBlack,
                          )),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        width: width,
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UserTypeCard(
                                title: "Enabler",
                                subtitle:
                                    "One who helps the entreprenuers to achieve their goals",
                                displayRadioUserCard: true,
                                radioSelected: enablerRadioSelected,
                                onTap: () => {onRadioButtonSelected("enabler")},
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              UserTypeCard(
                                title: "Entrepreneur",
                                subtitle:
                                    "One who drives the growth of the product and visions its benefits",
                                displayRadioUserCard: true,
                                radioSelected: entrepreneurRadioSelected,
                                onTap: () =>
                                    {onRadioButtonSelected("entrepreneur")},
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (enablerRadioSelected) {
                            setUserType(UserType.enabler);
                          } else if (entrepreneurRadioSelected) {
                            setUserType(UserType.entrepreneur);
                          }
                        },
                        style: AppResources.buttonStyle,
                        child: Text(
                          "Next",
                          style: AppTextStyles.boldBeVietnamPro.copyWith(
                              color: AppColors.lightBlack, fontSize: 18),
                        ),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ));
  }
}
