import 'package:febe_frontend/widgets/user_type_screen/user_type_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserTypePicker extends StatelessWidget {
  final Function(String value) onSelected;
  final String activeType;
  const UserTypePicker(
      {super.key, required this.onSelected, required this.activeType});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UserTypeCard(
          image: Image.asset("assets/images/enabler.png"),
          title: "Enabler",
          onTap: () => {onSelected("enabler")},
          isActive: activeType == "enabler",
        ),
        UserTypeCard(
          image: Image.asset("assets/images/enteruper.png"),
          title: "Entrepreneur",
          onTap: () => {onSelected("entrepreneur")},
          isActive: activeType == "entrepreneur",
        ),
      ],
    );
  }
}
