import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class DefaultTextInput extends StatefulWidget {
  final String hint;
  final Function(String)? onChanged;
  final String value;
  final String placeholder;
  final String type;
  final int maxLines;
  final bool isOptional;
  final TextInputType? keyboard;

  DefaultTextInput(
      {super.key,
      this.hint = "",
      this.value = "",
      this.placeholder = "",
      this.onChanged,
      this.type = "input",
      this.maxLines = 1,
      this.isOptional = false,
      this.keyboard});

  @override
  State<DefaultTextInput> createState() => _DefaultTextInputState();
}

class _DefaultTextInputState extends State<DefaultTextInput> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void pickDate() async {
      DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime(2100));

      if (pickedDate != null) {
        String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
        if (widget.onChanged != null) {
          widget.onChanged!(formattedDate);
          controller.text = formattedDate.toString();
        }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.placeholder != ""
            ? Row(
                children: [
                  Text(
                    widget.placeholder,
                    style: AppTextStyles.regularBeVietnamPro24.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  widget.isOptional
                      ? Text(
                          "(Optional)",
                          style: AppTextStyles.regularBeVietnamPro12.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : const SizedBox(),
                ],
              )
            : const SizedBox(),
        const SizedBox(
          height: 15,
        ),
        TextField(
          style: const TextStyle(color: AppColors.white),
          onChanged: widget.onChanged,
          readOnly: widget.type == "date",
          controller: controller,
          autofocus: true,
          maxLines: widget.maxLines,
          onTap: widget.type == "date" ? pickDate : null,
          keyboardType: widget.keyboard,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: AppTextStyles.regularBeVietnamPro16
                .copyWith(color: AppColors.lightWhite),
          ),
        ),
      ],
    );
  }
}
