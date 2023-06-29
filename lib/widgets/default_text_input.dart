import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class DefaultTextInput extends StatefulWidget {
  final String hint;
  final Function(String)? onChanged;
  final Function(bool)? errorChanged;
  final String value;
  final String placeholder;
  final String type;
  final int maxLines;
  final bool isOptional;
  final TextInputType? keyboard;
  final String label;
  final String helperText;

  DefaultTextInput(
      {super.key,
      this.hint = "",
      this.value = "",
      this.placeholder = "",
      this.onChanged,
      this.type = "input",
      this.maxLines = 1,
      this.isOptional = false,
      this.keyboard,
      this.errorChanged,
      this.label = "",
      this.helperText = ""});

  @override
  State<DefaultTextInput> createState() => _DefaultTextInputState();
}

class _DefaultTextInputState extends State<DefaultTextInput> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focus = FocusNode();
  bool isDirty = false;

  void onFocused() {
    if (!isDirty && focus.hasFocus) {
      setState(() {
        isDirty = true;
      });
    }

    // if (!focus.hasFocus) {
    //  // if (widget.errorChanged != null) widget.errorChanged!(isValid());
    // }
  }

  @override
  void initState() {
    focus.addListener(onFocused);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    focus.removeListener(onFocused);
    focus.dispose();
  }

  bool isValid() {
    bool validity =
        !(!widget.isOptional && isDirty && controller.text.trim() == "");
    return validity;
  }

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

        onFocused();
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
          maxLength: widget.keyboard == TextInputType.number ? 10 : null,
          // inputFormatters: widget.keyboard == TextInputType.number ?  [
          //   FilteringTextInputFormatter.allow(RegExp(r'([0-9][10-12])'))
          // ] : [],
          style: AppTextStyles.regularBeVietnamPro16
              .copyWith(color: AppColors.extraLightBlack),
          onChanged: (value) {
            if (widget.onChanged != null) widget.onChanged!(value);
            //if (widget.errorChanged != null) widget.errorChanged!(isValid());
          },
          readOnly: widget.type == "date",
          focusNode: focus,
          controller: controller,
          autofocus: true,
          maxLines: widget.maxLines,
          onTap: widget.type == "date" ? pickDate : null,
          keyboardType: widget.keyboard,
          decoration: InputDecoration(
              labelStyle: AppTextStyles.semiBoldBeVietnamPro12.copyWith(
                color: AppColors.lightBlack,
              ),
              floatingLabelStyle: AppTextStyles.semiBoldBeVietnamPro12.copyWith(
                  color: AppColors.lightBlack,
                  backgroundColor: AppColors.lightGolden.withOpacity(0.50)),
              labelText: widget.label ?? "",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: AppColors.lightBlack,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: AppColors.lightBlack)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: AppColors.red)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: AppColors.red)),
              hintText: widget.hint,
              errorText: isValid() ? null : "* required",
              errorStyle: const TextStyle(height: 0),
              hintStyle: AppTextStyles.regularBeVietnamPro16
                  .copyWith(color: AppColors.lightWhite),
              helperText: widget.helperText ?? "",
              helperStyle: AppTextStyles.regularBeVietnamPro12
                  .copyWith(color: AppColors.extraLightBlack)),
        ),
      ],
    );
  }
}
