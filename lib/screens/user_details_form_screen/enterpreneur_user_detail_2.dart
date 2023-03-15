import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widgets/default_dropdown.dart';
import '../../widgets/default_text_input.dart';

class EnterpreneurUserDetail2 extends StatelessWidget {
  const EnterpreneurUserDetail2({super.key});

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
          ),
          const SizedBox(
            height: 30,
          ),
          DefaultTextInput(
            placeholder: "Company Website",
            type: "date",
          ),
          const SizedBox(
            height: 30,
          ),
          DefaultTextInput(
            placeholder: "LinkedIn Link",
          ),
        ],
      ),
    );
  }
}
