import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';

class DefaultRadioButton extends StatelessWidget {
  final String title;
  final String selectedValue;
  final Function(String) onChanged;
  const DefaultRadioButton(
      {super.key,
      required this.title,
      required this.selectedValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
            value: title,
            groupValue: selectedValue,
            fillColor: MaterialStateColor.resolveWith(
                (states) => AppColors.golden), //<-- SEE HERE
            onChanged: (String? value) {
              onChanged(value!);
            }),
        Text(
          title,
          style: AppTextStyles.regularBeVietnamPro16
              .copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
