import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../configs/resources.dart';
import '../../widgets/default_text_input.dart';

class EnablerUserDetail2 extends StatelessWidget {
  const EnablerUserDetail2({super.key});

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
          ),
          const SizedBox(
            height: 30,
          ),
          DefaultTextInput(
            placeholder: "LinkedIn Link",
          ),
          const SizedBox(
            height: 30,
          ),
          DefaultTextInput(
            placeholder: "Portfolio Link",
            isOptional: true,
          ),
        ],
      ),
    );
  }
}
