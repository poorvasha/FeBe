import 'package:febe_frontend/models/data/entrepreneur.dart';
import 'package:febe_frontend/models/data/entrepreneur_industry.dart';
import 'package:febe_frontend/services/entrepreneur_industry_service.dart';
import 'package:febe_frontend/widgets/default_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

import '../../models/data/user.dart';
import '../../utils/app_helper.dart';
import '../../widgets/default_text_input.dart';

class EnterpreneurUserDetail1 extends StatefulWidget {
  final User user;
  final Function(User) onChanged;
  final Function(bool) onErrorChanged;
  const EnterpreneurUserDetail1(
      {super.key,
      required this.user,
      required this.onChanged,
      required this.onErrorChanged});

  @override
  State<EnterpreneurUserDetail1> createState() =>
      _EnterpreneurUserDetail1State();
}

class _EnterpreneurUserDetail1State extends State<EnterpreneurUserDetail1> {
  List<bool> validities = [false, false, false];
  List<EntrepreneurIndustry> industries = [];
  EntrepreneurIndustry? selectedIndustry;

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
        selectedIndustry = response.first;
      });
    } catch (e) {
      AppHelper.showSnackbar("Something went wrong, please try again", context);
    }
  }

  void emitAllValid() {
    bool isAllValid = validities.reduce((value, element) => value && element);
    widget.onErrorChanged(isAllValid);
  }

  void onIndustrySelected(value) {
    EntrepreneurIndustry selected =
        industries.where((element) => element.name == value).first;

    setState(() {
      selectedIndustry = selected;
    });
    widget.user.entrepreneur ??= Entrepreneur();
    widget.user.entrepreneur!.industry = value;
    widget.onChanged(widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 75,
          ),
          DefaultTextInput(
            placeholder: "Enter your Name",
            onChanged: (value) {
              widget.user.name = value;
              widget.onChanged(widget.user);
            },
            errorChanged: (value) {
              validities[0] = value;
              emitAllValid();
            },
          ),
          const SizedBox(
            height: 30,
          ),
          DefaultTextInput(
            placeholder: "Enter your DOB",
            type: "date",
            onChanged: (value) {
              widget.user.dob = DateFormat('dd/MM/yyyy').parse(value);
              widget.onChanged(widget.user);
            },
            errorChanged: (value) {
              validities[1] = value;
              emitAllValid();
            },
          ),
          const SizedBox(
            height: 30,
          ),
          DefaultDropdown(
            options: industries.map((e) => e.name!).toList(),
            value: selectedIndustry?.name ?? "",
            placeholder: "Choose your Industry",
            onChanged: (value) {
              widget.user.entrepreneur ??= Entrepreneur();
              widget.user.entrepreneur!.industry = value;
              widget.onChanged(widget.user);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          DefaultTextInput(
            placeholder: "Enter your Company Name",
            onChanged: (value) {
              widget.user.entrepreneur ??= Entrepreneur();
              widget.user.entrepreneur!.companyName = value;
              widget.onChanged(widget.user);
            },
            errorChanged: (value) {
              validities[2] = value;
              emitAllValid();
            },
          ),
        ],
      ),
    );
  }
}
