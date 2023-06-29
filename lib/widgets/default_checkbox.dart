import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';

class DefaultCheckbox extends StatelessWidget {
  final bool isChecked;
  final Function(bool? value)? onChanged;
  final String label;
  const DefaultCheckbox(
      {super.key, this.isChecked = false, this.onChanged, this.label = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.all<Color>(AppColors.golden),
          value: isChecked,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          onChanged: onChanged,
        ),
        Flexible(
          child: Text(
            label,
            style: AppTextStyles.regularBeVietnamPro16
                .copyWith(color: AppColors.lightWhite, height: 1.5),
          ),
        ),
      ],
    );
  }
}
