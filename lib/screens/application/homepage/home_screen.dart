import 'package:flutter/material.dart';
import 'package:flutter_bonapp/responsive/orientation_layout.dart';
import 'package:flutter_bonapp/responsive/screen_type_layout.dart';
import 'package:flutter_bonapp/screens/application/homepage/mobile/orientation_layout.dart';
import 'package:flutter_bonapp/viewmodels/home/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_widget.dart';

class HomeScreen extends StatelessWidget {
  final Function changePage;

  HomeScreen(this.changePage);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<HomeViewModel>(
        viewModel: HomeViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => HomeMobilePortrait(changePage),
            landscape: (context) => HomeMobileLandscape(changePage),
          ),
          tablet: OrientationLayout(
            portrait: (context) => HomeMobilePortrait(changePage),
            landscape: (context) => HomeMobileLandscape(changePage),
          ),
        ),
      ),
    );
  }
}
