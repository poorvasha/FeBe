import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';

class DefaultDropdown extends StatelessWidget {
  final String hint;
  final Function(String)? onChanged;
  final String value;
  final String placeholder;
  final List<String> options;
  final TextEditingController controller = TextEditingController();

  DefaultDropdown({
    super.key,
    this.hint = "",
    this.value = "",
    this.placeholder = "",
    required this.options,
    this.onChanged,
  });

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
            : const SizedBox(),
        const SizedBox(
          height: 15,
        ),
        DropdownButtonFormField<String>(
          icon: const Icon(
            Icons.arrow_drop_down,
            size: 30,
            color: AppColors.white,
          ),
          value: value,
          dropdownColor: AppColors.gray,
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              onTap: () => {onChanged!(value)},
              child: Text(value,
                  style: AppTextStyles.regularBeVietnamPro16
                      .copyWith(color: AppColors.white)),
            );
          }).toList(),
          style: AppTextStyles.regularBeVietnamPro16
              .copyWith(color: AppColors.white),
          onChanged: (_) {},
        ),
      ],
    );
  }
}
