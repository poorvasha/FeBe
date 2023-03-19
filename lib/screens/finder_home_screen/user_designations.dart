import 'package:febe_frontend/screens/finder_home_screen/category_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserDesignations extends StatelessWidget {
  const UserDesignations({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CategoryGrid(),
          const SizedBox(
            height: 10,
          ),
          CategoryGrid(),
          const SizedBox(
            height: 10,
          ),
          CategoryGrid(),
          const SizedBox(
            height: 10,
          ),
          CategoryGrid(),
          const SizedBox(
            height: 10,
          ),
          CategoryGrid(),
          const SizedBox(
            height: 120,
          ),
        ],
      ),
    );
  }
}
