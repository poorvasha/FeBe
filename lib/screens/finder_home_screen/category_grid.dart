import 'package:febe_frontend/configs/resources.dart';
import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  final String title;
  final List<String> options;
  final Function(String)? onTapped;
  const CategoryGrid(
      {super.key, required this.title, required this.options, this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.semiBoldBeVietnamPro16
              .copyWith(color: AppColors.golden),
        ),
        GridView.count(
          childAspectRatio: 3.5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: options
              .map((option) => SizedBox(
                    width: 100,
                    height: 80,
                    child: TextButton(
                        onPressed: () {
                          if (onTapped != null) onTapped!(option);
                        },
                        style:
                            const ButtonStyle(alignment: Alignment.centerLeft),
                        child: Text(
                          option,
                          style: AppTextStyles.regularBeVietnamPro16
                              .copyWith(color: AppColors.white),
                        )),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
