import 'package:carousel_slider/carousel_slider.dart';
import 'package:febe_frontend/configs/constants.dart';
import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/models/misc/local_storage_item.dart';
import 'package:febe_frontend/models/ui/carousel_item.dart';
import 'package:febe_frontend/screens/get_started_screen/get_started_carousel_indicator.dart';
import 'package:febe_frontend/screens/get_started_screen/get_started_carousel_item.dart';
import 'package:febe_frontend/services/secure_local_storage.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/routes.dart';
import '../../providers/app_model.dart';

List<CarouselItem> enablerCarousels = [
  CarouselItem(
      image: "assets/images/enabler_carousel_1.png",
      title: "Find Your Near Mate",
      description:
          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur"),
  CarouselItem(
      image: "assets/images/enabler_carousel_2.png",
      title: "Most Personalized App",
      description:
          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur"),
  CarouselItem(
      image: "assets/images/enabler_carousel_3.png",
      title: "One App for your needs",
      description:
          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur")
];

List<CarouselItem> entrepreneurCarousels = [
  CarouselItem(
      image: "assets/images/enabler_carousel_1.png",
      title: "Find Your Near Mate",
      description:
          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur"),
  CarouselItem(
      image: "assets/images/enabler_carousel_2.png",
      title: "Most Personalized App",
      description:
          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur"),
  CarouselItem(
      image: "assets/images/enabler_carousel_3.png",
      title: "One App for your needs",
      description:
          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur")
];

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  CarouselController controller = CarouselController();
  int currentCarousel = 1;
  List<CarouselItem> carousels = [];
  void moveToNextSlide() {
    if (currentCarousel == carousels.length) {
      return moveToLoginScreen();
    }
    controller.nextPage();
  }

  void moveToLoginScreen() {
    SecureStorage().writeSecureData(
        LocalStorageItem(key: IS_USING_FOR_FIRST_TIME_KEY, value: "false"));
    context.read<AppModel>().setInitialRoute = Routes.loginScreen;
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    checkUserType();
  }

  void checkUserType() async {
    var userType;
    await AppHelper.getUserType().then((value) => userType = value);

    setState(() {
      carousels =
          userType == "enabler" ? enablerCarousels : entrepreneurCarousels;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: screenSize.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () => {moveToLoginScreen()},
                      child: Text(
                        "Skip",
                        style: AppTextStyles.boldBeVietnamPro.copyWith(
                            color: Colors.transparent,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.lightBlack,
                            shadows: [const Shadow(
                              color: AppColors.lightBlack,
                              offset: Offset(0, -2)
                            )]),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: CarouselSlider(
                    carouselController: controller,
                    items: carousels.map((item) {
                      return GetStartedCarouselItem(carousel: item);
                    }).toList(),
                    options: CarouselOptions(
                        height: screenSize.height,
                        enlargeCenterPage: true,
                        enlargeFactor: 1,
                        viewportFraction: 1,
                        enableInfiniteScroll: false,
                        onPageChanged: (val, _) {
                          setState(() {
                            currentCarousel = val + 1;
                          });
                        }),
                  ),
                ),
                if(screenSize.height < 800)
                  const SizedBox(
                    height: 40,
                  ),
                GetStartedCarouselIndicator(
                  total: carousels.length,
                  current: currentCarousel,
                ),
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => {moveToNextSlide()},
                    style: AppResources.buttonStyle,
                    child: Text(
                      currentCarousel == carousels.length
                          ? "Get Started"
                          : "Next",
                      style: AppTextStyles.boldBeVietnamPro
                          .copyWith(color: AppColors.lightBlack, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 90,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
