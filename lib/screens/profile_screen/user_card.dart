import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Row(children: [
        ClipOval(
          child: CircleAvatar(
            radius: 35,
            backgroundColor: AppColors.golden,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Image.asset(
                "assets/images/user_avatar.png",
                height: 60,
                width: 60,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Prem",
                style: AppTextStyles.regularBeVietnamPro24.copyWith(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Full Stack Dev",
                    style: AppTextStyles.regularBeVietnamPro16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextButton.icon(
                        onPressed: () {},
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(4))),
                        icon: const Icon(
                          Icons.edit,
                          size: 18.0,
                          color: AppColors.white,
                        ),
                        label: Text(
                          "Edit",
                          style: AppTextStyles.regularBeVietnamPro16.copyWith(
                            color: AppColors.white,
                          ),
                        ), // <-- Text
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
