import 'package:carousel_slider/carousel_slider.dart';
import 'package:febe_frontend/models/data/user.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enabler_user_detail_1.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enabler_user_detail_2.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enabler_user_detail_3.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enterpreneur_user_detail_1.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enterpreneur_user_detail_2.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enterpreneur_user_detail_3.dart';
import 'package:febe_frontend/screens/user_details_form_screen/user_detail_form_enabler_designation.dart';
import 'package:febe_frontend/screens/user_details_form_screen/user_detail_form_stepper.dart';
import 'package:febe_frontend/services/user_service.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:febe_frontend/widgets/default_text_input.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../configs/resources.dart';
import '../../configs/routes.dart';
import '../../providers/app_model.dart';
import '../../widgets/default_appbar.dart';
import '../../widgets/default_dropdown.dart';

class UserDetailsFormScreen extends StatefulWidget {
  const UserDetailsFormScreen({super.key});

  @override
  State<UserDetailsFormScreen> createState() => _UserDetailsFormScreenState();
}

class _UserDetailsFormScreenState extends State<UserDetailsFormScreen> {
  final CarouselController controller = CarouselController();

  String currentUserType = "entrepreneur";
  int currentPart = 1;
  List<bool> validities = [false, false, true];

  User currentUser = User();

  @override
  void initState() {
    // getCurrentUserType();
    super.initState();
  }

  void getCurrentUserType() async {
    String? userType = await AppHelper.getUserType();
    if (userType == null) {
      return;
    }
    setState(() {
      currentUserType = userType;
    });
  }

  @override
  Widget build(BuildContext context) {
    void moveToNextPart() {
      controller.nextPage();
    }

    void updateUser() async {
      try {
        await UserService.updateUser(currentUser);
        context.read<AppModel>().setInitialRoute = Routes.homeScreen;
      } catch (e) {
        AppHelper.showSnackbar(
            "Something went wrong, please try again", context);
      }
    }

    void onUserDetailChanged(User user) {
      setState(() {
        currentUser = user;
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const DefaultAppbar(
        title: "Get Started",
        goBack: false,
      ),
      body: FullScreenContainer(
        disablePadding: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UserDetailFormStepper(
              activeIndex: currentPart - 1,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: CarouselSlider(
                      carouselController: controller,
                      items: currentUserType == "enabler"
                          ? [
                              EnablerUserDetail1(
                                user: currentUser,
                                onChanged: onUserDetailChanged,
                                onErrorChanged: (value) {
                                  setState(() {
                                    validities[0] = value;
                                  });
                                },
                              ),
                              EnablerUserDetail2(
                                user: currentUser,
                                onChanged: onUserDetailChanged,
                                onErrorChanged: (value) {
                                  setState(() {
                                    validities[1] = value;
                                  });
                                },
                              ),
                              EnablerUserDetail3(
                                user: currentUser,
                                onChanged: onUserDetailChanged,
                              )
                            ]
                          : [
                              EnterpreneurUserDetail1(
                                user: currentUser,
                                onChanged: onUserDetailChanged,
                                onErrorChanged: (value) {
                                  setState(() {
                                    validities[0] = value;
                                  });
                                },
                              ),
                              EnterpreneurUserDetail2(
                                user: currentUser,
                                onChanged: onUserDetailChanged,
                                onErrorChanged: (value) {
                                  setState(() {
                                    validities[1] = value;
                                  });
                                },
                              ),
                              EnterpreneurUserDetail3(
                                user: currentUser,
                                onChanged: onUserDetailChanged,
                              )
                            ],
                      options: CarouselOptions(
                        height: 760,
                        viewportFraction: 1,
                        enableInfiniteScroll: false,
                        scrollPhysics: NeverScrollableScrollPhysics(),
                        onPageChanged: (val, _) {
                          setState(() {
                            currentPart = val + 1;
                          });
                        },
                      ),
                    ),
                  ),
                  currentPart == 3
                      ? SizedBox(
                          width: 260,
                          height: 50,
                          child: TextButton(
                            onPressed: updateUser,
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                            child: Text(
                              "Skip",
                              style: AppTextStyles.semiBoldBeVietnamPro16
                                  .copyWith(color: AppColors.white),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 260,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: !validities[currentPart - 1]
                          ? null
                          : currentPart == 3
                              ? updateUser
                              : moveToNextPart,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.golden,
                          disabledBackgroundColor: AppColors.gray,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                      child: Text(
                        currentPart == 3 ? "Get Started" : "Next",
                        style: AppTextStyles.semiBoldBeVietnamPro16
                            .copyWith(color: AppColors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
