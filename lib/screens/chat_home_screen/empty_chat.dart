import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';

class EmptyChat extends StatelessWidget {
  const EmptyChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset("assets/images/feeling_sorry.png"),
          Text(
            "You have no chats right now, find your fellow collegue using the Finder!",
            style: AppTextStyles.regularBeVietnamPro16.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.travel_explore,
              color: AppColors.white,
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.golden,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                )),
            label: Text(
              "Go to Finder",
              style: AppTextStyles.semiBoldBeVietnamPro16
                  .copyWith(color: AppColors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
