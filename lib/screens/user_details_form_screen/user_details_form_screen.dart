import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:febe_frontend/models/data/enabler.dart';
import 'package:febe_frontend/models/data/entrepreneur.dart';
import 'package:febe_frontend/models/data/user.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enabler_user_detail_1.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enabler_user_detail_2.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enabler_user_detail_3.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enterpreneur_user_detail_1.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enterpreneur_user_detail_2.dart';
import 'package:febe_frontend/screens/user_details_form_screen/enterpreneur_user_detail_3.dart';
import 'package:febe_frontend/screens/user_details_form_screen/user_detail_form_enabler_designation.dart';
import 'package:febe_frontend/screens/user_details_form_screen/user_detail_form_stepper.dart';
import 'package:febe_frontend/services/user_service.dart';
import 'package:febe_frontend/utils/app_helper.dart';
import 'package:febe_frontend/widgets/default_text_input.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';

import '../../configs/resources.dart';
import '../../configs/routes.dart';
import '../../models/data/enabler_category.dart';
import '../../models/data/enabler_designation.dart';
import '../../providers/app_model.dart';
import '../../services/enabler_category_service.dart';
import '../../widgets/default_appbar.dart';
import '../../widgets/default_dropdown.dart';
import '../../widgets/default_loader.dart';

class UserDetailsFormScreen extends StatefulWidget {
  const UserDetailsFormScreen({super.key});

  @override
  State<UserDetailsFormScreen> createState() => _UserDetailsFormScreenState();
}

class _UserDetailsFormScreenState extends State<UserDetailsFormScreen> {
  final CarouselController controller = CarouselController();

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
    getCurrentUserType();
    fetchCategories();
    super.initState();
  }

  void fetchCategories() async {
    try {
      List<EnablerCategoryWithDesignation> response =
          await EnablerCategoryService.getCategoriesWithDesignations();
      for (var element in response) {
        for (var element in element.designations!) {
          designations.add(element);
        }
        // element.designations!.map((e) async{
        //   designations.add(e);
        //   });
      }
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

  void addUser() async {
    try {

        
        await UserService.updateUser(currentUser);
        context.read<AppModel>().setInitialRoute = Routes.homeScreen;
      } catch (e) {
        AppHelper.showSnackbar(
            "Something went wrong, please try again", context);
      }
  }

  void validateAllInputsToEnableButton(){
      if((userName != null && userName.isNotEmpty) && (linkedinUrl != null && linkedinUrl.isNotEmpty) && (designation != null && designation.isNotEmpty)){
        setState(() {
          enbleButton = true;
        });
      }
      else{
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
      bool validity = !(!isOptional && isDirty && designation.trim() == "");
      return false;
    }

    void onFocused() {
      if (!isDirty && focus.hasFocus) {
        setState(() {
          isDirty = true;
        });
      }

      // if (!focus.hasFocus) {
      //  // if (widget.errorChanged != null) widget.errorChanged!(isValid());
      // }
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
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: SearchField(
                      key: Key("Searchkey"),
                      suggestions: designations
                          .map((e) =>
                              SearchFieldListItem(e.name.toString(), item: e))
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
                      // onSearchTextChanged: (p0) {
                      //   if (p0.isEmpty) {
                          
                      //   }
                      //   return null;
                      // },
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
                              size: 26,
                              color: AppColors.lightBlack,
                            )),
                        labelStyle:
                            AppTextStyles.semiBoldBeVietnamPro12.copyWith(
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
                        errorText: isValid() ? null : "* required",
                        errorStyle: const TextStyle(height: 0),
                        hintStyle: AppTextStyles.regularBeVietnamPro16
                            .copyWith(color: AppColors.lightWhite),
                      ),
                      suggestionStyle: AppTextStyles.regularBeVietnamPro16
                          .copyWith(color: AppColors.lightBlack),
                      suggestionItemDecoration:
                          const BoxDecoration(border: Border()),
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
                        validateAllInputsToEnableButton();
                        focus.unfocus();
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
                SizedBox(height: 60),
              ],
            )),
          ),
        ));
  }
}
