import 'package:febe_frontend/widgets/default_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widgets/default_text_input.dart';

class EnterpreneurUserDetail1 extends StatelessWidget {
  const EnterpreneurUserDetail1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 75,
          ),
          DefaultTextInput(
            placeholder: "Enter your Name",
          ),
          const SizedBox(
            height: 30,
          ),
          DefaultTextInput(
            placeholder: "Enter your DOB",
            type: "date",
          ),
          const SizedBox(
            height: 30,
          ),
          DefaultDropdown(
            options: ["a", "b"],
            value: "a",
            placeholder: "Choose your Industry",
          ),
          const SizedBox(
            height: 30,
          ),
          DefaultTextInput(
            placeholder: "Enter your Company Name",
          ),
        ],
      ),
    );
  }
}
