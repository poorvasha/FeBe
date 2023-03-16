import 'package:carousel_slider/carousel_slider.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enabler_user_detail_1.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enabler_user_detail_2.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enabler_user_detail_3.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enterpreneur_user_detail_1.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enterpreneur_user_detail_2.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enterpreneur_user_detail_3.dart';
import 'package:febe_frontend/screens/user_details_form_screen/user_detail_form_enabler_designation.dart';
import 'package:febe_frontend/screens/user_details_form_screen/user_detail_form_stepper.dart';
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
  int currentPart = 1;

  @override
  Widget build(BuildContext context) {
    void moveToNextPart() {
      controller.nextPage();
    }

    void navigateToHome() {
      context.read<AppModel>().setInitialRoute = Routes.homeScreen;
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const DefaultAppbar(title: "Get Started"),
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
                      items: false
                          ? [
                              EnablerUserDetail1(),
                              EnablerUserDetail2(),
                              EnablerUserDetail3()
                            ]
                          : [
                              EnterpreneurUserDetail1(),
                              EnterpreneurUserDetail2(),
                              EnterpreneurUserDetail3()
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
                            onPressed: navigateToHome,
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
                      onPressed:
                          currentPart == 3 ? navigateToHome : moveToNextPart,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.golden,
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
