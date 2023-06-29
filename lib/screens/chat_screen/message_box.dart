import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/resources.dart';

class MessageBox extends StatelessWidget {
  final bool isDisabled;
  const MessageBox({super.key, this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    if (isDisabled) {
      return Container();
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
