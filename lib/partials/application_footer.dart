import 'package:flutter/material.dart';
import 'package:flutter_bonapp/utils/constants.dart';

class ApplicationFooter extends StatelessWidget {
  final String name;
  final String version;

  ApplicationFooter({this.name, this.version});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Container(
      color: Color(whiteColour),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: orientation == Orientation.portrait ? 20.0 : 10.0,
              left: 10.0,
            ),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 10.0,
                color: Color(blackColour),
                decoration: TextDecoration.none,
                fontFamily: secondaryFont,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: orientation == Orientation.portrait ? 20.0 : 10.0,
              right: 10.0,
            ),
            child: Text(
              version,
              style: TextStyle(
                fontSize: 10.0,
                color: Color(blackColour),
                decoration: TextDecoration.none,
                fontFamily: secondaryFont,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
