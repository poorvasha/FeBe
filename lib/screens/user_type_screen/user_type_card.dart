import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../configs/resources.dart';

class UserTypeCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final Function onTap;
  final bool? isActive;
  final bool? displayRadioUserCard;
  final bool? radioSelected;
  const UserTypeCard(
      {super.key,
      this.title = "",
      required this.subtitle,
      required this.onTap,
      this.isActive,
      this.displayRadioUserCard = false,
      this.radioSelected});

  @override
  State<UserTypeCard> createState() => _UserTypeCardState();
}

class _UserTypeCardState extends State<UserTypeCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {widget.onTap()},
        child:
            // widget.displayWaveUserCard != null && !widget.displayWaveUserCard!?
            Container(
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        offset: const Offset(0, 0),
                        blurRadius: 6,
                        blurStyle: BlurStyle.normal),
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: AppColors.lightGolden,
                      radius: 30,
                      child: Icon(
                        Icons.construction,
                        color: AppColors.golden,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.title,
                              style: AppTextStyles.mediumBeVietnamPro
                                  .copyWith(fontSize: 16)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(widget.subtitle,
                              style: AppTextStyles.regularBeVietnamPro12
                                  .copyWith(height: 1.3)),
                        ],
                      ),
                    ),
                    widget.displayRadioUserCard != null &&
                            widget.displayRadioUserCard!
                        ? Align(
                            alignment: Alignment.topRight,
                            child: Stack(alignment: Alignment.center, children: [
                              Container(
                                  width: 15,
                                  height: 15,
                                  decoration: ShapeDecoration(
                                    color: widget.radioSelected != null &&
                                            widget.radioSelected!
                                        ? Colors.transparent
                                        : Colors.transparent,
                                    shape: CircleBorder(
                                        side: BorderSide(
                                      width: 1.5,
                                      color: widget.radioSelected != null &&
                                              widget.radioSelected!
                                          ? AppColors.golden
                                          : AppColors.gray.withOpacity(0.25),
                                    )),
                                  )),
                              widget.radioSelected != null &&
                                      widget.radioSelected!
                                  ? Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const ShapeDecoration(
                                        color: AppColors.golden,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                          width: 1.5,
                                          color: AppColors.golden,
                                        )),
                                      ))
                                  : const SizedBox(),
                            ]),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            )

// ListTile(
//                   leading: const CircleAvatar(
//                     backgroundColor: AppColors.lightGolden,
//                     radius: 30,
//                     child: Icon(
//                       Icons.construction,
//                       color: AppColors.golden,
//                     ),
//                   ),
//                   title: Padding(
//                     padding: const EdgeInsets.only(bottom: 5),
//                     child: Text(widget.title,
//                         style: AppTextStyles.mediumBeVietnamPro
//                             .copyWith(fontSize: 16)),
//                   ),
//                   subtitle: Text(widget.subtitle,
//                       style: AppTextStyles.regularBeVietnamPro12
//                           .copyWith(height: 1.3)),
//                   trailing: Container(
//                       margin: EdgeInsets.all(0),
//                       padding: EdgeInsets.all(0),
//                       width: 15,
//                       height: 15,
//                       decoration: ShapeDecoration(
//                         shape: CircleBorder(
//                             side: BorderSide(
//                           width: 1.5,
//                           color: AppColors.gray.withOpacity(0.25),
//                         )),
//                       )),
//                 ),

        );
  }
}
