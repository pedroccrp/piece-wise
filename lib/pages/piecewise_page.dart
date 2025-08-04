import 'package:flutter/material.dart';
import 'package:piece_wise/themes/piecewise_colors.dart';

abstract class PiecewisePageState<T extends StatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PiecewiseColors.background,
      body: SafeArea(child: buildBody(context)),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container();
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return Container();
  }
}
