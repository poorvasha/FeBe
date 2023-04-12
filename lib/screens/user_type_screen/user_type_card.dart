import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/resources.dart';

class UserTypeCard extends StatefulWidget {
  final String title;
  final dynamic image;
  final Function onTap;
  final bool? isActive;
  final bool? displayWaveUserCard;
  const UserTypeCard(
      {super.key,
      this.title = "",
      required this.image,
      required this.onTap,
      this.isActive,
      this.displayWaveUserCard = false});

  @override
  State<UserTypeCard> createState() => _UserTypeCardState();
}

class _UserTypeCardState extends State<UserTypeCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {widget.onTap()},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child:
            widget.displayWaveUserCard != null && !widget.displayWaveUserCard!
                ? Container(
                    height: 90,
                    decoration: BoxDecoration(
                        color: AppColors.golden,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: AppColors.golden, width: 3)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 5,
                          vertical: 16),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            widget.image,
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(widget.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.extraBoldBeVietnamPro
                                      .copyWith(
                                          color: AppColors.lightWhite,
                                          fontSize: 18.0)),
                            )
                          ]),
                    ),
                  )
                : Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: widget.isActive!
                            ? AppColors.golden
                            : AppColors.lightBlack,
                        borderRadius: BorderRadius.circular(7),
                        border: widget.isActive!
                            ? null
                            : Border.all(color: AppColors.golden, width: 3)),
                    child: Expanded(
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Text(widget.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.extraBoldBeVietnamPro
                                      .copyWith(
                                          color: AppColors.lightWhite,
                                          fontSize: 18.0)),
                            ),
                            widget.image,
                          ]),
                    ),
                  ),
      ),
    );
  }
}
