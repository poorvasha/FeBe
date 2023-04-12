import 'package:febe_frontend/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../configs/resources.dart';
import '../../configs/routes.dart';
import '../../providers/app_model.dart';
import '../../services/secure_local_storage.dart';
import 'user_type_card.dart';

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({super.key});

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    void setUserType(String value) async {
      AppHelper.setUserType(value);
      bool isUsingForFirstTime = await AppHelper.isUserUsingForFirstTime();
      context.read<AppModel>().setInitialRoute =
          isUsingForFirstTime ? Routes.getStartedScreen : Routes.loginScreen;
    }

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          height: height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                    color: Theme.of(context).backgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/who_you_are.png"),
                            const SizedBox(
                              height: 40,
                            ),
                            Text("Are You ?",
                                style: AppTextStyles.boldBeVietnamPro.copyWith(
                                    color: Theme.of(context).primaryColor)),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: width,
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    UserTypeCard(
                                      image: Image.asset(
                                          "assets/images/enabler.png"),
                                      title: "Enabler",
                                      onTap: () => {setUserType("enabler")},
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    UserTypeCard(
                                      image: Image.asset(
                                          "assets/images/enteruper.png"),
                                      title: "Entrepreneur",
                                      onTap: () =>
                                          {setUserType("entrepreneur")},
                                    ),
                                  ]),
                            ),
                            const SizedBox(
                              height: 60,
                            )
                          ]),
                    )),
              ),
              Container(
                color: Theme.of(context).backgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset("assets/images/wave.svg",
                        semanticsLabel: 'Wave')
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
