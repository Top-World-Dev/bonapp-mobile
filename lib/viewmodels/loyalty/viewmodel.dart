import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoyaltyViewModel extends BaseModel {
  UserService userService = locator<UserService>();

  User user;

  String initial = 'drinks';

  void initialise() {
    setState(ViewState.Busy);
    _updateUserInfo();
    notifyListeners();
  }

  void selectPage(String page) {
    initial = page;
    notifyListeners();
  }

  Future<void> _updateUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('userId');

    user = await userService.getUser(id);

    setState(ViewState.Completed);
    notifyListeners();
  }


}
