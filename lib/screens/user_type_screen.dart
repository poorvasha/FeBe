import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../configs/resources.dart';
import '../widgets/user_type_card.dart';

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
                              child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    UserTypeCard(
                                      image: Image.asset(
                                          "assets/images/enabler.png"),
                                      title: "Enabler",
                                      onTap: () => {print("enabler")},
                                    ),
                                    UserTypeCard(
                                      image: Image.asset(
                                          "assets/images/enteruper.png"),
                                      title: "Entrepreneur",
                                      onTap: () => {print("entrepreneur")},
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
