import 'package:febe_frontend/models/data/enabler_category.dart';
import 'package:febe_frontend/models/data/enabler_designation.dart';
import 'package:febe_frontend/screens/finder_home_screen/category_grid.dart';
import 'package:febe_frontend/services/enabler_category_service.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserDesignations extends StatefulWidget {
  final Function(String, String) onIdentitySelected;
  const UserDesignations({super.key, required this.onIdentitySelected});

  @override
  State<UserDesignations> createState() => _UserDesignationsState();
}

class _UserDesignationsState extends State<UserDesignations> {
  List<EnablerCategoryWithDesignation> categories = [];

  void fetchCategories() async {
    try {
      List<EnablerCategoryWithDesignation> response =
          await EnablerCategoryService.getCategoriesWithDesignations();
      setState(() {
        categories = response;
      });
    } catch (e) {
      AppHelper.showSnackbar("Something went wrong, please try again", context);
    }
  }

  void onDesignationSelected(String name, int index) {
    EnablerDesignation? selected = categories[index]
        .designations
        ?.where((element) => element.name == name)
        .first;
    if (selected == null) {
      return;
    }

    widget.onIdentitySelected(selected.sId!, selected.name!);
  }

  @override
  void initState() {
    fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...categories.map((category) {
            return Column(
              children: [
                CategoryGrid(
                  title: category.name!,
                  options:
                      category.designations?.map((e) => e.name!).toList() ??
                          [""],
                  onTapped: (value) {
                    onDesignationSelected(value, categories.indexOf(category));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          }),
          const SizedBox(
            height: 120,
          ),
        ],
      ),
    );
  }
}
