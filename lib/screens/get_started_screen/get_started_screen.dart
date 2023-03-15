import 'package:carousel_slider/carousel_slider.dart';
import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/models/carousel_item.dart';
import 'package:febe_frontend/screens/get_started_screen/get_started_carousel_indicator.dart';
import 'package:febe_frontend/screens/get_started_screen/get_started_carousel_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../configs/routes.dart';
import '../../providers/app_model.dart';

List<CarouselItem> carousels = [
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

  void moveToNextSlide() {
    if (currentCarousel == carousels.length) {
      return moveToLoginScreen();
    }
    controller.nextPage();
  }

  void moveToLoginScreen() {
    context.read<AppModel>().setInitialRoute = Routes.loginScreen;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
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
                      style: AppTextStyles.boldBeVietnamPro
                          .copyWith(color: AppColors.golden, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CarouselSlider(
                  carouselController: controller,
                  items: carousels.map((item) {
                    return GetStartedCarouselItem(carousel: item);
                  }).toList(),
                  options: CarouselOptions(
                      height: 600,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      onPageChanged: (val, _) {
                        setState(() {
                          currentCarousel = val + 1;
                        });
                      }),
                ),
              ),
              GetStartedCarouselIndicator(
                total: carousels.length,
                current: currentCarousel,
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: 200, // <-- Your width
                height: 50,
                child: ElevatedButton(
                  onPressed: () => {moveToNextSlide()},
                  child: Text(
                    currentCarousel == carousels.length
                        ? "Get Started"
                        : "Next",
                    style: AppTextStyles.semiBoldBeVietnamPro16
                        .copyWith(color: AppColors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.golden,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              const SizedBox(
                height: 90,
              )
            ],
          ),
        ),
      ),
    );
  }
}
