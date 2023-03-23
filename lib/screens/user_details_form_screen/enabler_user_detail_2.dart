import 'package:febe_frontend/models/data/enabler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../configs/resources.dart';
import '../../models/data/user.dart';
import '../../widgets/default_text_input.dart';

class EnablerUserDetail2 extends StatelessWidget {
  final User user;
  final Function(User) onChanged;
  const EnablerUserDetail2(
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
            placeholder: "Write about yourself",
            maxLines: 8,
            onChanged: (value) {
              user.enabler ??= Enabler();
              user.enabler!.about = value;
              onChanged(user);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          DefaultTextInput(
            placeholder: "LinkedIn Link",
            onChanged: (value) {
              user.enabler ??= Enabler();
              user.enabler!.linkedInURL = value;
              onChanged(user);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          DefaultTextInput(
            placeholder: "Portfolio Link",
            isOptional: true,
            onChanged: (value) {
              user.enabler ??= Enabler();
              user.enabler!.portfolioURL = value;
              onChanged(user);
            },
          ),
        ],
      ),
    );
  }
}
