import 'package:febe_frontend/models/data/entrepreneur.dart';
import 'package:flutter/material.dart';

import '../../models/data/user.dart';
import '../../widgets/default_text_input.dart';

class EnterpreneurUserDetail2 extends StatefulWidget {
  final User user;
  final Function(User) onChanged;
  final Function(bool) onErrorChanged;

  const EnterpreneurUserDetail2(
      {super.key,
      required this.user,
      required this.onChanged,
      required this.onErrorChanged});

  @override
  State<EnterpreneurUserDetail2> createState() =>
      _EnterpreneurUserDetail2State();
}

class _EnterpreneurUserDetail2State extends State<EnterpreneurUserDetail2> {
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
            placeholder: "Write about your org",
            maxLines: 8,
            onChanged: (value) {
              widget.user.entrepreneur ??= Entrepreneur();
              widget.user.entrepreneur!.about = value;
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
            placeholder: "Company Website",
            onChanged: (value) {
              widget.user.entrepreneur ??= Entrepreneur();
              widget.user.entrepreneur!.websiteURL = value;
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
          DefaultTextInput(
            placeholder: "LinkedIn Link",
            onChanged: (value) {
              widget.user.entrepreneur ??= Entrepreneur();
              widget.user.entrepreneur!.linkedInURL = value;
              widget.onChanged(widget.user);
            },
            errorChanged: (value) {
              validities[2] = value;
              emitAllValid();
            },
          ),
        ],
      ),
    );
  }
}
