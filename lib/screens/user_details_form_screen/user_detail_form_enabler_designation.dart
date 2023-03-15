import 'package:febe_frontend/widgets/default_dropdown.dart';
import 'package:febe_frontend/widgets/default_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserDetailEnablerDesignation extends StatelessWidget {
  const UserDetailEnablerDesignation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultDropdown(
          options: ["a", "b"],
          value: "a",
          placeholder: "Choose your Designation",
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          child: SizedBox(
            height: 180,
            child: GridView.count(
              childAspectRatio: 3.5,
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(10, //this is the total number of cards
                  (index) {
                return DefaultRadioButton();
              }),
            ),
          ),
        )
      ],
    );
  }
}
