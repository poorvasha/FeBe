import 'package:flutter/material.dart';

import '../configs/routes.dart' as routes;
import '../models/data/all_chats_data_model.dart';
import '../models/data/user.dart';

class AppModel with ChangeNotifier {

  // Routing
  String? _intialRoute = routes.Routes.flashScreen;
  String? get getInitialRoute {
    return _intialRoute;
  }

  set setInitialRoute(String? route) {
    _intialRoute = route;
    notifyListeners();
  }


  // User Type
  final String _userType = "none";
  String? get getUserType {
    return _userType;
  }

  set setIUserType(String? userType) {
    _intialRoute = userType;
    notifyListeners();
  }


  // Chats
  List<ChatsData> _userChats = [];
  List<ChatsData> get getChats {
    return _userChats;
  }

  set setChats(List<ChatsData> route) {
    _userChats = route;
    notifyListeners();
  }

}
