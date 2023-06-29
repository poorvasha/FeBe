import 'package:febe_frontend/screens/user_type_screen/user_type_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class UserTypePicker extends StatelessWidget {
  final Function(String value) onSelected;
  final String activeType;
  final bool isFinderTapped;
  const UserTypePicker(
      {super.key,
      required this.onSelected,
      required this.activeType,
      required this.isFinderTapped});

  @override
  Widget build(BuildContext context) {
    return !isFinderTapped
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserTypeCard(
                image: Image.asset("assets/images/enabler.png"),
                title: "Enabler",
                onTap: () => {
                  onSelected("enabler"),
                },
              ),
              const SizedBox(
                height: 30,
              ),
              UserTypeCard(
                image: Image.asset("assets/images/enteruper.png"),
                title: "Entrepreneur",
                onTap: () => {onSelected("entrepreneur")},
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserTypeCard(
                  image: SvgPicture.asset(
                    "assets/images/wave_2.svg",
                    semanticsLabel: 'Wave',
                    width: MediaQuery.of(context).size.width / 2.4,
                  ),
                  title: "enabler",
                  onTap: () => {onSelected("enabler")},
                  isActive: activeType == "enabler",
                  displayWaveUserCard: true),
              UserTypeCard(
                  image: SvgPicture.asset(
                    "assets/images/wave_2.svg",
                    semanticsLabel: 'Wave',
                    width: MediaQuery.of(context).size.width / 2.4,
                  ),
                  title: "Entrepreneur",
                  onTap: () => {onSelected("entrepreneur")},
                  isActive: activeType == "entrepreneur",
                  displayWaveUserCard: true),
            ],
          );
  }
}
