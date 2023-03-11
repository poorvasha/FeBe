import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DefaultTextInput extends StatelessWidget {
  final String hint;
  final Function(String)? onChanged;
  final String value;
  final String placeholder;
  const DefaultTextInput(
      {super.key,
      this.hint = "",
      this.value = "",
      this.placeholder = "",
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        placeholder != ""
            ? Text(
                placeholder,
                style: AppTextStyles.regularBeVietnamPro24.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : SizedBox(),
        const SizedBox(
          height: 15,
        ),
        TextField(
          controller: TextEditingController()..text = value,
          style: TextStyle(color: AppColors.white),
          onChanged: onChanged,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.regularBeVietnamPro16
                  .copyWith(color: AppColors.lightWhite)),
        ),
      ],
    );
  }
}
