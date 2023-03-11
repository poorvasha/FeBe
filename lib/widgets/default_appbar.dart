import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../configs/resources.dart';

class DefaultAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool goBack;
  const DefaultAppbar({super.key, this.title = "", this.goBack = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0,
      leading: goBack
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: AppColors.golden),
              onPressed: () => Navigator.of(context).pop(),
            )
          : const SizedBox(),
      title: Text(
        "OTP",
        style: AppTextStyles.boldBeVietnamPro
            .copyWith(color: AppColors.golden, fontSize: 30),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
