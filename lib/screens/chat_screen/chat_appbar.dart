import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../configs/resources.dart';

class ChatAppbar extends StatelessWidget with PreferredSizeWidget {
  final String name;
  final bool isVerified;
  final bool isFEBE;
  ChatAppbar(
      {super.key,
      required this.name,
      required this.isVerified,
      this.isFEBE = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.golden,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.white,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  isFEBE
                      ? "assets/images/xander_media_golden_transparent.png"
                      : "assets/images/user_avatar.png",
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: AppTextStyles.regularBeVietnamPro24.copyWith(
                    fontSize: 18,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                if (isVerified)
                  Container(
                    width: 75,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(children: [
                      Text(
                        "Verified",
                        style: AppTextStyles.semiBoldBeVietnamPro12
                            .copyWith(color: AppColors.golden),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.verified,
                        color: AppColors.golden,
                        size: 20,
                      )
                    ]),
                  )
              ],
            ),
          ),
        ],
      ),
      centerTitle: false,
      actions: isFEBE
          ? List.empty()
          : [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
