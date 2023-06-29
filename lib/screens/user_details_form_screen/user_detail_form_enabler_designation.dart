import 'package:febe_frontend/models/data/enabler_category.dart';
import 'package:febe_frontend/models/data/enabler_designation.dart';
import 'package:febe_frontend/services/enabler_category_service.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:febe_frontend/widgets/default_dropdown.dart';
import 'package:febe_frontend/widgets/default_radio_button.dart';
import 'package:flutter/material.dart';
 

class UserDetailEnablerDesignation extends StatefulWidget {
  final Function(String) onChanged;
  const UserDetailEnablerDesignation({super.key, required this.onChanged});

  @override
  State<UserDetailEnablerDesignation> createState() =>
      _UserDetailEnablerDesignationState();
}

class _UserDetailEnablerDesignationState
    extends State<UserDetailEnablerDesignation> {
  List<EnablerCategory> categories = [];
  List<EnablerDesignation> designations = [];
  EnablerCategory? selectedCategory;
  EnablerDesignation? selectedDesignation;

  @override
  void initState() {
    fetchCategories();
    super.initState();
  }

  void fetchCategories() async {
    try {
      List<EnablerCategory> response =
          await EnablerCategoryService.getCategories();
      setState(() {
        categories = response;
        selectedCategory = response.first;
      });
      fetchDesignations(response.first.sId!);
    } catch (e) {
      AppHelper.showSnackbar("Something went wrong, please try again", context);
    }
  }

  void fetchDesignations(String sId) async {
    try {
      List<EnablerDesignation> response =
          await EnablerCategoryService.getDesignations(sId);
      setState(() {
        designations = response;
        selectedDesignation = response.first;
      });
      widget.onChanged(response.first.sId!);
    } catch (e) {
      AppHelper.showSnackbar("Something went wrong, please try again", context);
    }
  }

  void onCategorySelected(String value) {
    EnablerCategory selected =
        categories.where((element) => element.name == value).first;
    setState(() {
      selectedCategory = selected;
    });
    fetchDesignations(selected.sId!);
  }

  void onDesignationSelected(String value) {
    EnablerDesignation selected =
        designations.where((element) => element.name == value).first;
    setState(() {
      selectedDesignation = selected;
    });
    widget.onChanged(selected.sId!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultDropdown(
          options: categories.isEmpty
              ? [""]
              : categories.map((e) => e.name!).toList(),
          value: selectedCategory?.name ?? "",
          placeholder: "Choose your Designation",
          onChanged: onCategorySelected,
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          child: SizedBox(
            height: 140,
            child: ListView.builder(
                itemCount: designations.length,
                itemBuilder: (BuildContext context, int index) {
                  EnablerDesignation item = designations[index];
                  return DefaultRadioButton(
                    title: item.name!,
                    selectedValue: selectedDesignation?.name ?? "",
                    onChanged: onDesignationSelected,
                  );
                }),
          ),
        )
      ],
    );
  }
}
