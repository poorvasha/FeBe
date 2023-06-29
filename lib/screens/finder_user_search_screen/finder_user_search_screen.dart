
import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/models/data/entrepreneur_industry.dart';
import 'package:febe_frontend/models/ui/identity_tile_item.dart';
import 'package:febe_frontend/services/enabler_category_service.dart';
import 'package:febe_frontend/services/entrepreneur_industry_service.dart';
import 'package:febe_frontend/widgets/default_appbar.dart';
import 'package:febe_frontend/widgets/full_screen_container.dart';
import 'package:flutter/material.dart';

import '../../models/data/enabler_category.dart';
import '../../utils/app_helper.dart';
import 'identification_tile.dart';

class FinderUserSearchScreen extends StatefulWidget {
  final UserType targetUserType;
  const FinderUserSearchScreen({super.key, required this.targetUserType});

  @override
  State<FinderUserSearchScreen> createState() => _FinderUserSearchScreenState();
}

class _FinderUserSearchScreenState extends State<FinderUserSearchScreen> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  String searchText = "";
  List<IdentityTile> idendities = [];
  List<IdentityTile> rawIdendities = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    if (widget.targetUserType == UserType.enabler) {
      loadEnablerIdentities();
    }

    if (widget.targetUserType == UserType.entrepreneur) {
      loadEntrepreneurIdentities();
    }
  }

  void loadEnablerIdentities() async {
    try {
      List<EnablerCategoryWithDesignation> designations =
          await EnablerCategoryService.getCategoriesWithDesignations();

      List<IdentityTile> identities = designations.fold(
          [],
          (value, element) =>
              value +
              element.designations!
                  .map((e) => IdentityTile(e.sId!, e.name!))
                  .toList());

      setState(() {
        idendities = identities;
        rawIdendities = identities;
      });
    } catch (e) {}
  }

  void loadEntrepreneurIdentities() async {
    try {
      List<EntrepreneurIndustry> industries =
          await EntrepreneurIndustryService.getIndustries();

      List<IdentityTile> identities =
          industries.map((e) => IdentityTile(e.sId!, e.name!)).toList();

      setState(() {
        idendities = identities;
        rawIdendities = identities;
      });
    } catch (e) {}
  }

  void onSearch(value) {
    if (value == searchText) {
      return;
    }

    if (value.isEmpty) {
      return clearSearch();
    }

    List<IdentityTile> filteredIdentities = rawIdendities
        .where((element) =>
            element.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    setState(() {
      searchText = value;
      idendities = filteredIdentities;
    });
  }

  void clearSearch() {
    controller.text = "";
    setState(() {
      searchText = "";
      idendities = rawIdendities;
    });
  }

  void onIdentitySelected(IdentityTile identity) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        wideTitle: true,
        titleWidget: TextField(
          controller: controller,
          focusNode: focusNode,
          onChanged: onSearch,
          decoration: AppResources.bareInputDecoration.copyWith(
              hintText: "Search using designation...",
              hintStyle: AppTextStyles.regularBeVietnamPro16
                  .copyWith(color: AppColors.lightGray)),
        ),
        actions: searchText.isNotEmpty
            ? [
                IconButton(
                    onPressed: clearSearch, icon: const Icon(Icons.clear))
              ]
            : null,
      ),
      body: FullScreenContainer(
          disablePadding: true,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ListView.separated(
              itemCount: idendities.length,
              itemBuilder: (context, index) {
                return IdentificationTile(
                  title: idendities[index].title,
                  onTap: () {
                    onIdentitySelected(idendities[index]);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                );
              },
            ),
          )),
    );
  }
}
