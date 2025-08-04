import 'package:flutter/material.dart';

class PiecewisePageWrapper extends StatelessWidget {
  final Widget body;

  const PiecewisePageWrapper({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: body));
  }
}
