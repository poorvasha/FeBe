import 'package:febe_frontend/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

import '../../configs/resources.dart';
import '../../models/data/enabler.dart';
import '../../models/data/enabler_category.dart';
import '../../models/data/enabler_designation.dart';
import '../../models/data/entrepreneur.dart';
import '../../models/data/entrepreneur_industry.dart';
import '../../models/data/expanded_user.dart';
import '../../models/data/user.dart';
import '../../services/enabler_category_service.dart';
import '../../services/entrepreneur_industry_service.dart';
import '../../utils/app_helper.dart';
import '../../widgets/default_text_input.dart';
import '../user_details_form_screen/searchable_input.dart';

class GeneralSettings extends StatefulWidget {
  final ExpandedUser user;
  final UserType userType;
  const GeneralSettings(
      {super.key, required this.user, required this.userType});

  @override
  State<GeneralSettings> createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  int currentPart = 1;
  List<bool> validities = [false, false, true];
  String userName = "";
  String linkedinUrl = "";
  String about = "";

  String designation = "";
  String? designationId = "";

  String industry = "";
  String? industryId = "";
  String companyName = "";
  String companyURL = "";

  bool _isLoading = false;
  bool enbleButton = false;
  bool isOptional = false;
  bool isDirty = false;
  List<String> statesOfIndia = ["Tamil", "English", "Chennai"];
  final FocusNode focus = FocusNode();

  List<EnablerCategory> categories = [];
  List<EnablerDesignation> designations = [];
  List<EntrepreneurIndustry> industries = [];

  User user = User();

  @override
  void initState() {
    fetchCategories();
    fetchIndustries();
    setDefaultData();
    super.initState();
  }

  void fetchIndustries() async {
    List<EntrepreneurIndustry> response =
        await EntrepreneurIndustryService.getIndustries();
    setState(() {
      industries = response;
    });
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

  void setDefaultData() {
    setState(() {
      userName = widget.user.name ?? "";
      if (widget.userType == UserType.enabler) {
        linkedinUrl = widget.user.enabler?.linkedInURL ?? "";
        about = widget.user.enabler?.about ?? "";
        designation = widget.user.enabler?.designation?.name ?? "";
        designationId = widget.user.enabler?.designation?.sId ?? "";
      }

      if (widget.userType == UserType.entrepreneur) {
        linkedinUrl = widget.user.entrepreneur?.linkedInURL ?? "";
        about = widget.user.entrepreneur?.about ?? "";
        companyName = widget.user.entrepreneur?.companyName ?? "";
        companyURL = widget.user.entrepreneur?.websiteURL ?? "";
        industry = widget.user.entrepreneur?.industry?.name ?? "";
        industryId = widget.user.entrepreneur?.industry?.sId ?? "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    void assignEnablerValues() {
      user.enabler = user.enabler ?? Enabler();
      user.enabler!.about = about;
      user.name = userName;
      user.enabler!.designation = designationId;
    }

    void assignEntrepreneurValues() {
      user.entrepreneur = user.entrepreneur ?? Entrepreneur();
      user.entrepreneur!.about = about;
      user.name = userName;
      user.entrepreneur!.industry = industryId;
      user.entrepreneur!.companyName = companyName;
      user.entrepreneur!.websiteURL = companyURL;
    }

    void assignValuestoCurrentUser() {
      if (widget.userType == UserType.enabler) {
        return assignEnablerValues();
      }
      assignEntrepreneurValues();
    }

    void updateUser() async {
      try {
        user = User.fromExpandedUser(widget.user);
        assignValuestoCurrentUser();
        await UserService.updateUser(user);
      } catch (e) {
        AppHelper.showSnackbar(
            "Something went wrong, please try again", context);
      }
    }

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
            value: userName,
            hint: "Enter your name",
            helperText: "This will be your display name",
            label: "Name",
            keyboard: TextInputType.text,
            onChanged: (value) {
              setState(() {
                userName = value;
              });
            },
          ),
          const SizedBox(
            height: 8,
          ),
          DefaultTextInput(
            value: about,
            hint: "Tell us about yourself",
            helperText: "Tell us about yourself",
            label: "About",
            keyboard: TextInputType.text,
            onChanged: (value) {
              setState(() {
                about = value;
              });
            },
          ),
          if (widget.userType == UserType.entrepreneur) ...[
            const SizedBox(
              height: 16,
            ),
            DefaultTextInput(
              hint: "Google",
              helperText: "This will be used to display on your profile",
              label: "Company Name",
              value: companyName,
              keyboard: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  companyName = value;
                });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            DefaultTextInput(
              hint: "https://google.com",
              helperText: "This will be used to display on your profile",
              label: "Company Website URL",
              value: companyURL,
              keyboard: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  companyURL = value;
                });
              },
            ),
          ],
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            height: 80,
            child: SearchableInput(
                value: widget.userType == UserType.enabler
                    ? designation
                    : industry,
                currentUserType: widget.userType,
                designations: designations,
                industries: industries,
                validator: (x) {
                  if (widget.userType == UserType.enabler) {
                    if (designation.isEmpty) {
                      return 'Please Enter a valid State';
                    }
                  }

                  if (widget.userType != UserType.entrepreneur) {
                    if (industry.isEmpty) {
                      return 'Please Enter a valid State';
                    }
                  }

                  return null;
                },
                focus: focus,
                onEnablerSuggestionTap:
                    (SearchFieldListItem<EnablerDesignation> selectedItem) {
                  setState(() {
                    designation = selectedItem.searchKey;
                    designationId = selectedItem.item!.sId;
                  });
                  focus.unfocus();
                },
                onEntrepreneurSuggestionTap:
                    (SearchFieldListItem<EntrepreneurIndustry> selectedItem) {
                  setState(() {
                    industry = selectedItem.searchKey;
                    industryId = selectedItem.item!.sId;
                  });
                  focus.unfocus();
                },
                onClear: () {
                  setState(() {
                    designation = "";
                    industry = "";
                  });
                }),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: updateUser,
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.golden,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
              child: Text(
                "Save",
                style: AppTextStyles.boldBeVietnamPro
                    .copyWith(color: AppColors.black, fontSize: 18),
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
