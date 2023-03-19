import 'package:flutter/material.dart';

import '../../configs/resources.dart';

class UserTypeCard extends StatefulWidget {
  final String title;
  final Image image;
  final Function onTap;
  final bool? isActive;
  const UserTypeCard(
      {super.key,
      this.title = "",
      required this.image,
      required this.onTap,
      this.isActive});

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
        child: Container(
          width: 175,
          decoration: BoxDecoration(
              color: widget.isActive != null && !widget.isActive!
                  ? AppColors.lightBlack
                  : AppColors.golden,
              border: Border.all(color: AppColors.golden, width: 2)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              widget.image,
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(widget.title,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.extraBoldBeVietnamPro.copyWith(
                          color: AppColors.lightWhite, fontSize: 18.0)),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
