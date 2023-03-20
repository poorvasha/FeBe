import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../configs/resources.dart';

class DefaultAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool goBack;
  final Widget? titleWidget;
  const DefaultAppbar(
      {super.key, this.title = "", this.goBack = true, this.titleWidget});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0,
      leading: goBack
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.golden,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : const SizedBox(),
      title: titleWidget != null
          ? titleWidget
          : Text(
              title,
              style: AppTextStyles.boldBeVietnamPro
                  .copyWith(color: AppColors.golden, fontSize: 30),
            ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
