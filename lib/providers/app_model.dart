import 'package:flutter/material.dart';

import '../configs/routes.dart' as routes;

class AppModel with ChangeNotifier {
  String? _intialRoute = routes.Routes.getStartedScreen;
  String? get getInitialRoute {
    return _intialRoute;
  }

  set setInitialRoute(String? route) {
    _intialRoute = route;
    notifyListeners();
  }

  String? _userType = "none";
  String? get getUserType {
    return _userType;
  }

  set setIUserType(String? userType) {
    _intialRoute = userType;
    notifyListeners();
  }
}
