import 'package:febe_frontend/models/data/enabler.dart';
import 'package:flutter/material.dart';

import '../../models/data/user.dart';
import '../../widgets/default_text_input.dart';

class EnablerUserDetail2 extends StatefulWidget {
  final User user;
  final Function(User) onChanged;
  final Function(bool) onErrorChanged;

  const EnablerUserDetail2(
      {super.key,
      required this.user,
      required this.onChanged,
      required this.onErrorChanged});

  @override
  State<EnablerUserDetail2> createState() => _EnablerUserDetail2State();
}

class _EnablerUserDetail2State extends State<EnablerUserDetail2> {
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
            placeholder: "Write about yourself",
            maxLines: 8,
            onChanged: (value) {
              widget.user.enabler ??= Enabler();
              widget.user.enabler!.about = value;
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
            placeholder: "LinkedIn Link",
            onChanged: (value) {
              widget.user.enabler ??= Enabler();
              widget.user.enabler!.linkedInURL = value;
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
            placeholder: "Portfolio Link",
            isOptional: true,
            onChanged: (value) {
              widget.user.enabler ??= Enabler();
              widget.user.enabler!.portfolioURL = value;
              widget.onChanged(widget.user);
            },
          ),
        ],
      ),
    );
  }
}
