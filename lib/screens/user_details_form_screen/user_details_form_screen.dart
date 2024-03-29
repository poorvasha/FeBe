import 'package:carousel_slider/carousel_slider.dart';
import 'package:febe_frontend/models/data/enabler.dart';
import 'package:febe_frontend/models/data/entrepreneur.dart';
import 'package:febe_frontend/models/data/entrepreneur_industry.dart';
import 'package:febe_frontend/models/data/user.dart';
import 'package:febe_frontend/screens/user_details_form_screen/searchable_input.dart';
import 'package:febe_frontend/services/entrepreneur_industry_service.dart';
import 'package:febe_frontend/services/user_service.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';

import '../../configs/resources.dart';
import '../../configs/routes.dart';
import '../../models/data/enabler_category.dart';
import '../../models/data/enabler_designation.dart';
import '../../providers/app_model.dart';
import '../../services/enabler_category_service.dart';
import '../../widgets/default_loader.dart';
import '../../widgets/default_text_input.dart';

class UserDetailsFormScreen extends StatefulWidget {
  const UserDetailsFormScreen({super.key});

  @override
  State<UserDetailsFormScreen> createState() => _UserDetailsFormScreenState();
}

class _UserDetailsFormScreenState extends State<UserDetailsFormScreen> {
  final CarouselController controller = CarouselController();

  UserType currentUserType = UserType.enabler;
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
  final FocusNode focus = FocusNode();

  List<EnablerCategory> categories = [];
  List<EnablerDesignation> designations = [];

  List<EntrepreneurIndustry> industries = [];

  User currentUser = User();

  @override
  void initState() {
    getCurrentUserType();
    fetchData();
    super.initState();
  }

  void fetchData() {
    fetchCategories();
    fetchIndustries();
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
      for (var element in response) {
        for (var element in element.designations!) {
          designations.add(element);
        }
      }
    } catch (e) {
      AppHelper.showSnackbar("Something went wrong, please try again", context);
    }
  }

  void getCurrentUserType() async {
    UserType? userType = await AppHelper.getUserType();
    if (userType == null) {
      return;
    }

    setState(() {
      currentUserType = userType;
    });
  }

  void assignValuestoCurrentUser() {
    if (currentUserType == UserType.enabler) {
      return assignEnablerValues();
    }
    assignEntrepreneurValues();
  }

  void assignEnablerValues() {
    currentUser.enabler = currentUser.enabler ?? Enabler();
    currentUser.enabler!.about = about;
    currentUser.name = userName;
    currentUser.enabler!.linkedInURL = linkedinUrl;
    currentUser.enabler!.designation = designationId;
  }

  void assignEntrepreneurValues() {
    currentUser.entrepreneur = currentUser.entrepreneur ?? Entrepreneur();
    currentUser.entrepreneur!.about = about;
    currentUser.name = userName;
    currentUser.entrepreneur!.linkedInURL = linkedinUrl;
    currentUser.entrepreneur!.industry = industryId;
    currentUser.entrepreneur!.companyName = companyName;
    currentUser.entrepreneur!.websiteURL = companyURL;
  }

  void addUser() async {
    try {
      assignValuestoCurrentUser();
      await UserService.updateUser(currentUser);
      context.read<AppModel>().setInitialRoute = Routes.homeScreen;
    } catch (e) {
      AppHelper.showSnackbar("Something went wrong, please try again", context);
    }
  }

  void validateAllInputsToEnableButton() {
    if ((userName != null && userName.isNotEmpty) &&
        (linkedinUrl != null && linkedinUrl.isNotEmpty) &&
        (about != null && about.isNotEmpty) &&
        ((designation != null && designation.isNotEmpty) ||
            (industry != null && industry.isNotEmpty))) {
      setState(() {
        enbleButton = true;
      });
    } else {
      setState(() {
        enbleButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void moveToNextPart() {
      controller.nextPage();
    }

    void updateUser() async {
      try {
        setState(() {
          _isLoading = true;
        });
        currentUser.name = userName;
        if(currentUserType == "entrepreneur"){
          currentUser.entrepreneur = Entrepreneur();
        }
        else {
           currentUser.enabler = Enabler(linkedInURL: linkedinUrl, designation: designationId);
        }
        await UserService.updateUser(currentUser);
        context.read<AppModel>().setInitialRoute = Routes.homeScreen;
        
      } catch (e) {
        AppHelper.showSnackbar(
            "Something went wrong, please try again", context);
      }
      finally {
        setState(() {
          _isLoading = false;
        });
      }
    }

    void onUserDetailChanged(User user) {
      setState(() {
        currentUser = user;
      });
    }

    bool isValid() {

      bool validity = !(!isOptional && isDirty);
      return validity;
    }

    bool isDesignationValid() {

      bool validity = !(!isOptional && isDirty && designation.trim() == "");
      return validity;
    }

    void onFocused() {
      if (!isDirty && focus.hasFocus) {
        setState(() {
          isDirty = true;
        });
      }
    }

    @override
    void initState() {
      focus.addListener(onFocused);
      super.initState();
    }

    @override
    void dispose() {
      super.dispose();
      focus.removeListener(onFocused);
      focus.dispose();
    }

    return Scaffold(
        backgroundColor: AppColors.white,
        body: GestureDetector(
          onTap: () {
            isDirty = true;
            focus.unfocus();
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 70, horizontal: 25),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Looks like you’re new to the app!",
                  style: AppTextStyles.semiBoldBeVietnamPro12.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 32,
                      height: 1.3),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Let’s introduce yourself!",
                  style: AppTextStyles.regularBeVietnamPro12.copyWith(
                    color: AppColors.extraLightBlack,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                DefaultTextInput(
                  hint: "Enter your name",
                  helperText: "How can I call you?",
                  label: "Name",
                  value: userName,
                  keyboard: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      userName = value;
                    });
                    validateAllInputsToEnableButton();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                DefaultTextInput(
                  hint: "eg : ",
                  helperText: "Just for a professional reference!",
                  label: "LinkedIn URL",
                  value: linkedinUrl,
                  keyboard: TextInputType.url,
                  onChanged: (value) {
                    setState(() {
                      linkedinUrl = value;
                    });
                    validateAllInputsToEnableButton();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                DefaultTextInput(
                  hint: "I'm a passionate developer",
                  helperText: "We'll show this on your profile",
                  label: "About",
                  value: about,
                  keyboard: TextInputType.url,
                  onChanged: (value) {
                    setState(() {
                      about = value;
                    });
                    validateAllInputsToEnableButton();
                  },
                ),
                if (currentUserType == UserType.entrepreneur) ...[
                  const SizedBox(
                    height: 15,
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
                      validateAllInputsToEnableButton();
                    },
                  ),
                  const SizedBox(
                    height: 15,
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
                      validateAllInputsToEnableButton();
                    },
                  ),
                ],
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: SearchableInput(
                      value: currentUserType == UserType.enabler
                          ? designation
                          : industry,
                      currentUserType: currentUserType,
                      designations: designations,
                      industries: industries,
                      validator: (x) {
                        if (currentUserType == UserType.enabler) {
                          if (designation.isEmpty) {
                            return 'Please Enter a valid State';
                          }
                        }

                        if (currentUserType != UserType.entrepreneur) {
                          if (industry.isEmpty) {
                            return 'Please Enter a valid State';
                          }
                        }

                        return null;
                      },
                      focus: focus,
                      onEnablerSuggestionTap:
                          (SearchFieldListItem<EnablerDesignation>
                              selectedItem) {
                        setState(() {
                          designation = selectedItem.searchKey;
                          designationId = selectedItem.item!.sId;
                        });
                        validateAllInputsToEnableButton();
                        focus.unfocus();
                      },
                      onEntrepreneurSuggestionTap:
                          (SearchFieldListItem<EntrepreneurIndustry>
                              selectedItem) {
                        setState(() {
                          industry = selectedItem.searchKey;
                          industryId = selectedItem.item!.sId;
                        });
                        validateAllInputsToEnableButton();
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
                  height: 15,
                ),
                SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: _isLoading
                      ? const DefaultLoader()
                      : ElevatedButton(
                          onPressed: enbleButton ? addUser : null,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.golden,
                              disabledBackgroundColor: AppColors.extraLightgrey,
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
                SizedBox(height: 60),
              ],
            )),
          ),
        ));
  }
}
