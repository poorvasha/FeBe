import 'package:flutter/material.dart';
 

import '../configs/resources.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool goBack;
  final bool wideTitle;
  final Widget? titleWidget;
  final List<Widget>? actions;
  const DefaultAppbar(
      {super.key,
      this.title = "",
      this.goBack = true,
      this.wideTitle = false,
      this.titleWidget,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.lightGolden,
      leading: goBack
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.lightBlack,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : const SizedBox(),
      title: titleWidget ??
          Text(
            title,
            style: AppTextStyles.boldBeVietnamPro
                .copyWith(color: AppColors.lightBlack, fontSize: 24),
          ),
      actions: actions,
      titleSpacing: wideTitle ? -14 : 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
