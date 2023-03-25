import 'package:febe_frontend/models/data/enabler.dart';
import 'package:febe_frontend/models/data/user.dart';
import 'package:febe_frontend/screens/user_details_form_screen/user_detail_form_enabler_designation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/default_text_input.dart';

class EnablerUserDetail1 extends StatefulWidget {
  final User user;
  final Function(User) onChanged;
  final Function(bool) onErrorChanged;
  const EnablerUserDetail1(
      {super.key,
      required this.user,
      required this.onChanged,
      required this.onErrorChanged});

  @override
  State<EnablerUserDetail1> createState() => _EnablerUserDetail1State();
}

class _EnablerUserDetail1State extends State<EnablerUserDetail1> {
  List<bool> validities = [false, false];

  void emitAllValid() {
    bool isAllValid = validities.reduce((value, element) => value && element);
    widget.onErrorChanged(isAllValid);
  }

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
              widget.user.name = value;
              widget.onChanged(widget.user);
            },
            errorChanged: (value) {
              validities[0] = value;
              emitAllValid();
            },
          ),
          const SizedBox(
            height: 30,
          ),
          DefaultTextInput(
            placeholder: "Enter your DOB",
            type: "date",
            onChanged: (value) {
              widget.user.dob = DateFormat('dd/MM/yyyy').parse(value);
              widget.onChanged(widget.user);
            },
            errorChanged: (value) {
              validities[1] = value;
              emitAllValid();
            },
          ),
          const SizedBox(
            height: 30,
          ),
          UserDetailEnablerDesignation(
            onChanged: (value) {
              widget.user.enabler ??= Enabler();
              widget.user.enabler!.designation = value;
            },
          )
        ],
      ),
    );
  }
}
