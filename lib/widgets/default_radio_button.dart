import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DefaultRadioButton extends StatelessWidget {
  const DefaultRadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
            value: "A",
            groupValue: "A",
            fillColor: MaterialStateColor.resolveWith(
                (states) => AppColors.golden), //<-- SEE HERE
            onChanged: (String? value) {}),
        Text(
          "Designer",
          style: AppTextStyles.regularBeVietnamPro16
              .copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
