import 'package:febe_frontend/models/data/enabler_designation.dart';
import 'package:febe_frontend/models/data/entrepreneur_industry.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

import '../../configs/resources.dart';

class SearchableInput extends StatelessWidget {
  final String currentUserType;
  final String value;
  final List<EnablerDesignation> designations;
  final List<EntrepreneurIndustry> industries;
  final String? Function(String?) validator;
  void Function() onClear;
  final FocusNode focus;
  final dynamic Function(SearchFieldListItem<EnablerDesignation>)
      onEnablerSuggestionTap;
  final dynamic Function(SearchFieldListItem<EntrepreneurIndustry>)
      onEntrepreneurSuggestionTap;

  SearchableInput(
      {super.key,
      required this.currentUserType,
      required this.designations,
      required this.industries,
      required this.validator,
      required this.focus,
      required this.onEnablerSuggestionTap,
      required this.onEntrepreneurSuggestionTap,
      required this.onClear,
      required this.value});

  @override
  Widget build(BuildContext context) {
    if (currentUserType == "enabler") {
      return SearchField(
          key: Key("SearchkeyEnabler"),
          suggestions: designations
              .map((e) => SearchFieldListItem(e.name.toString(), item: e))
              .toList(),
          suggestionState: Suggestion.expand,
          textInputAction: TextInputAction.done,
          searchStyle: TextStyle(
            fontSize: 18,
            color: Colors.black.withOpacity(0.8),
          ),
          validator: validator,
          scrollbarAlwaysVisible: false,
          controller: TextEditingController(text: value),
          searchInputDecoration: InputDecoration(
            suffixIcon: InkWell(
                onTap: onClear,
                child: const Icon(
                  Icons.cancel_outlined,
                  size: 26,
                  color: AppColors.lightBlack,
                )),
            labelStyle: AppTextStyles.semiBoldBeVietnamPro12.copyWith(
              color: AppColors.lightBlack,
            ),
            floatingLabelStyle: AppTextStyles.semiBoldBeVietnamPro12.copyWith(
                color: AppColors.lightBlack,
                backgroundColor: AppColors.lightGolden.withOpacity(0.50)),
            labelText:
                currentUserType == "enabler" ? "Designation" : "Industry",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: AppColors.lightBlack,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: AppColors.golden, width: 2)),
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
          onSuggestionTap: onEnablerSuggestionTap);
    }

    return SearchField(
        key: Key("SearchkeyEntrepreneur"),
        suggestions: industries
            .map((e) => SearchFieldListItem(e.name.toString(), item: e))
            .toList(),
        suggestionState: Suggestion.expand,
        textInputAction: TextInputAction.done,
        searchStyle: TextStyle(
          fontSize: 18,
          color: Colors.black.withOpacity(0.8),
        ),
        validator: validator,
        scrollbarAlwaysVisible: false,
        controller: TextEditingController(text: value),
        searchInputDecoration: InputDecoration(
          suffixIcon: InkWell(
              onTap: onClear,
              child: const Icon(
                Icons.cancel_outlined,
                size: 26,
                color: AppColors.lightBlack,
              )),
          labelStyle: AppTextStyles.semiBoldBeVietnamPro12.copyWith(
            color: AppColors.lightBlack,
          ),
          floatingLabelStyle: AppTextStyles.semiBoldBeVietnamPro12.copyWith(
              color: AppColors.lightBlack,
              backgroundColor: AppColors.lightGolden.withOpacity(0.50)),
          labelText: currentUserType == "enabler" ? "Designation" : "Industry",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: AppColors.lightBlack,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.golden, width: 2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.red)),
          hintText: "Select the Industry",
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
        onSuggestionTap: onEntrepreneurSuggestionTap);
  }
}
