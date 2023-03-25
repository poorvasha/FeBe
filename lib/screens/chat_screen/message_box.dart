import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/resources.dart';

class MessageBox extends StatelessWidget {
  final bool isDisabled;
  const MessageBox({super.key, this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    if (isDisabled) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock,
              color: AppColors.green,
              size: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Only admins can able to send messages",
              style: AppTextStyles.regularBeVietnamPro16
                  .copyWith(color: AppColors.white),
            )
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(color: AppColors.white),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: TextField(
              maxLines: 1,
              style: AppTextStyles.regularBeVietnamPro16,
              autofocus: true,
              textInputAction: TextInputAction.next,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              // showCursor: false,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                  counterText: '',
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Write a message..."),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/send.svg",
                color: AppColors.golden, semanticsLabel: 'Send'),
          )
        ],
      ),
    );
  }
}
