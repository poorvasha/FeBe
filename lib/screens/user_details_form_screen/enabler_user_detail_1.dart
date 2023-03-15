import 'package:febe_frontend/screens/user_details_form_screen/user_detail_form_enabler_designation.dart';
import 'package:flutter/material.dart';
import '../../widgets/default_text_input.dart';

class EnablerUserDetail1 extends StatelessWidget {
  const EnablerUserDetail1({super.key});

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
            placeholder: "Enter your name",
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
          UserDetailEnablerDesignation()
        ],
      ),
    );
  }
}
