import 'package:febe_frontend/models/data/enabler.dart';
import 'package:febe_frontend/models/data/user.dart';
import 'package:febe_frontend/screens/user_details_form_screen/user_detail_form_enabler_designation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/default_text_input.dart';

class EnablerUserDetail1 extends StatelessWidget {
  final User user;
  final Function(User) onChanged;
  const EnablerUserDetail1(
      {super.key, required this.user, required this.onChanged});

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
            onChanged: (value) {
              user.name = value;
              onChanged(user);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          DefaultTextInput(
            placeholder: "Enter your DOB",
            type: "date",
            onChanged: (value) {
              user.dob = DateFormat('dd/MM/yyyy').parse(value);
              onChanged(user);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          UserDetailEnablerDesignation(
            onChanged: (value) {
              user.enabler ??= Enabler();
              user.enabler!.designation = value;
            },
          )
        ],
      ),
    );
  }
}
