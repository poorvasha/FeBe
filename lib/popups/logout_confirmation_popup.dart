import 'package:flutter/material.dart';

import '../configs/resources.dart';

Future<void> showAlertDialog(BuildContext context,
    {String title = "Alert",
    String message = "Are you sure you want to proceed?",
    String buttonTitle = "Yes",
    Function? onSuccess}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: AppTextStyles.semiBoldBeVietnamPro20,
        ),
        content: Text(
          message,
          style: AppTextStyles.regularBeVietnamPro16.copyWith(height: 1.5),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(buttonTitle),
            onPressed: () => onSuccess!(),
          ),
        ],
      );
    },
  );
}
