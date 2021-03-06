import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/models/offer.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/menu_service.dart';
import 'package:flutter_bonapp/services/message_service.dart';
import 'package:flutter_bonapp/services/offer_service.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  MenuService menuService = locator<MenuService>();
  OfferService offerService = locator<OfferService>();
  MessagesService messagesService = locator<MessagesService>();

  User user;

  List<Items> featuredItems;
  List<Messages> userUnreadMessages;
  Offer offer;

  void initialise() {
    setState(ViewState.Busy);
    _updateUserInfo();
    notifyListeners();
  }

  Future<void> _updateUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('userId');

    user = await userService.getUser(id);
    userUnreadMessages = await messagesService.getUnreadUserMessages(id);
    featuredItems = await menuService.getFeaturedItems(id);
    offer = await offerService.getOffer(1);

    setState(ViewState.Completed);
    notifyListeners();
  }
}
