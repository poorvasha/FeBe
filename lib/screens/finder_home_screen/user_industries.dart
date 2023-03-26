import 'package:febe_frontend/models/data/entrepreneur_industry.dart';
import 'package:febe_frontend/services/entrepreneur_industry_service.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'category_grid.dart';

class UserIndustries extends StatefulWidget {
  final Function(String, String) onIdentitySelected;
  const UserIndustries({super.key, required this.onIdentitySelected});

  @override
  State<UserIndustries> createState() => _UserIndustriesState();
}

class _UserIndustriesState extends State<UserIndustries> {
  List<EntrepreneurIndustry> industries = [];

  @override
  void initState() {
    fetchIndustries();
    super.initState();
  }

  void fetchIndustries() async {
    try {
      List<EntrepreneurIndustry> response =
          await EntrepreneurIndustryService.getIndustries();
      setState(() {
        industries = response;
      });
    } catch (e) {
      AppHelper.showSnackbar("Something went wrong, please try again", context);
    }
  }

  void onDesignationSelected(String name) {
    EntrepreneurIndustry selected =
        industries.where((element) => element.name == name).first;
    widget.onIdentitySelected(selected.sId!, selected.name!);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CategoryGrid(
            title: "Industries",
            options: industries.map((e) => e.name!).toList(),
            onTapped: onDesignationSelected,
          ),
        ],
      ),
    );
  }
}
