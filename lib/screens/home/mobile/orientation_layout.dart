import 'package:flutter/material.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/viewmodels/home/viewmodel.dart';
import 'package:flutter_bonapp/widgets/app_drawer/drawer.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/widgets/busy_overlay.dart';

class HomeMobilePortrait extends BaseModelWidget<HomeViewModel> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, HomeViewModel data) {
    return BusyOverlay(
      show: data.state != ViewState.Completed,
      child: Scaffold(
        key: _scaffold,
        drawer: AppDrawer(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
//          data.updateTitle();
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 25.0,
                ),
                onPressed: () {
                  _scaffold.currentState.openDrawer();
                },
              ),
            ),
            Expanded(
              child: _appInfo(data),
            )
          ],
        ),
      ),
    );
  }
}

class HomeMobileLandscape extends BaseModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel data) {
    return BusyOverlay(
      show: data.state == ViewState.Busy,
      child: Scaffold(
        body: Row(
          children: <Widget>[
            AppDrawer(),
            Expanded(
              child: Center(
                child: Center(
                  child: _appInfo(data),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _appInfo(data) {
  return data.state == ViewState.Completed
      ? Center(
          child: Text(
            data.appInfo.name,
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: primaryFont,
            ),
          ),
        )
      : null;
}
