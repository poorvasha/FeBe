import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

import '../../configs/resources.dart';
import '../../models/data/enabler_category.dart';
import '../../models/data/enabler_designation.dart';
import '../../models/data/user.dart';
import '../../services/enabler_category_service.dart';
import '../../utils/app_helper.dart';
import '../../widgets/default_text_input.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({super.key});

  @override
  State<GeneralSettings> createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  String currentUserType = "entrepreneur";
  int currentPart = 1;
  List<bool> validities = [false, false, true];
  String userName = "";
  String linkedinUrl = "";
  String about = "";
  String designation = "";
  String? designationId = "";
  bool _isLoading = false;
  bool enbleButton = false;
  bool isOptional = false;
  bool isDirty = false;
  List<String> statesOfIndia = ["Tamil", "English", "Chennai"];
  final FocusNode focus = FocusNode();

  List<EnablerCategory> categories = [];
  List<EnablerDesignation> designations = [];

  User currentUser = User();

  @override
  void initState() {
    fetchCategories();
    super.initState();
  }

  void fetchCategories() async {
    try {
      List<EnablerCategoryWithDesignation> response =
          await EnablerCategoryService.getCategoriesWithDesignations();
      List<EnablerDesignation> _designations = [];
      for (var element in response) {
        for (var element in element.designations!) {
          _designations.add(element);
        }
      }

      setState(() {
        designations = _designations;
      });
    } catch (e) {
      AppHelper.showSnackbar("Something went wrong, please try again", context);
    }
  }

  void getCurrentUserType() async {
    String? userType = await AppHelper.getUserType();
    if (userType == null) {
      return;
    }
    setState(() {
      currentUserType = userType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 0),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 0),
        shape: const Border(),
        title: Text(
          "General Settings",
          style: AppTextStyles.regularBeVietnamPro16
              .copyWith(color: AppColors.lightBlack),
        ), //header title
        children: [
          DefaultTextInput(
            hint: "Enter your name",
            helperText: "This will be your display name",
            label: "Name",
            keyboard: TextInputType.text,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 8,
          ),
          DefaultTextInput(
            hint: "Tell us about yourself",
            helperText: "Tell us about yourself",
            label: "About",
            value: "",
            keyboard: TextInputType.text,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            height: 80,
            child: SearchField(
                key: Key("Searchkey"),
                suggestions: designations
                    .map((e) => SearchFieldListItem(e.name.toString(), item: e))
                    .toList(),
                suggestionState: Suggestion.expand,
                textInputAction: TextInputAction.done,
                searchStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.8),
                ),
                validator: (x) {
                  if (designation.isEmpty) {
                    return 'Please Enter a valid State';
                  }
                  return null;
                },
                scrollbarAlwaysVisible: false,
                controller: TextEditingController(text: designation),
                searchInputDecoration: InputDecoration(
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          designation = "";
                        });
                      },
                      child: const Icon(
                        Icons.cancel_outlined,
                        size: 22,
                        color: AppColors.lightBlack,
                      )),
                  labelStyle: AppTextStyles.semiBoldBeVietnamPro12.copyWith(
                    color: AppColors.lightBlack,
                  ),
                  floatingLabelStyle: AppTextStyles.semiBoldBeVietnamPro12
                      .copyWith(
                          color: AppColors.lightBlack,
                          backgroundColor:
                              AppColors.lightGolden.withOpacity(0.50)),
                  labelText: "Designation",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: AppColors.lightBlack,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(color: AppColors.golden, width: 2)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: AppColors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: AppColors.red)),
                  hintText: "Select the Desgination",
                  errorStyle: const TextStyle(height: 0),
                  hintStyle: AppTextStyles.regularBeVietnamPro16
                      .copyWith(color: AppColors.lightWhite),
                ),
                suggestionStyle: AppTextStyles.regularBeVietnamPro16
                    .copyWith(color: AppColors.lightBlack),
                suggestionItemDecoration: const BoxDecoration(border: Border()),
                suggestionsDecoration: SuggestionDecoration(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.black.withOpacity(0.15),
                          spreadRadius: 0,
                          offset: const Offset(0, 4),
                          blurRadius: 6,
                          blurStyle: BlurStyle.normal),
                      BoxShadow(
                          color: AppColors.black.withOpacity(0.15),
                          spreadRadius: 0,
                          offset: const Offset(4, 0),
                          blurRadius: 6,
                          blurStyle: BlurStyle.normal),
                    ]),
                maxSuggestionsInViewPort: 4,
                itemHeight: 50,
                focusNode: focus,
                onSuggestionTap:
                    (SearchFieldListItem<EnablerDesignation> selectedItem) {
                  setState(() {
                    designation = selectedItem.searchKey;
                    designationId = selectedItem.item!.sId;
                  });
                  focus.unfocus();
                }),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.golden,
                  disabledBackgroundColor: AppColors.lightWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
              child: Text(
                "Save",
                style: AppTextStyles.boldBeVietnamPro.copyWith(
                    color: enbleButton
                        ? AppColors.lightBlack
                        : AppColors.gray.withOpacity(0.50),
                    fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
