import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DefaultCheckbox extends StatelessWidget {
  final bool isChecked;
  final Function(bool? value)? onChanged;
  final String label;
  const DefaultCheckbox(
      {super.key, this.isChecked = false, this.onChanged, this.label = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
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
            softWrap : true,
            style: AppTextStyles.regularBeVietnamPro16
                .copyWith(color: AppColors.lightBlack, height: 1.5, fontSize: 14),
          ),
        ),
      ],
    );
    ;
  }
}
