import 'package:flutter/material.dart';

class ScaffoldWrapper extends StatelessWidget {
  const ScaffoldWrapper({
    @required this.body,
    this.appBar,
    this.floatingActionButton,
    Key key,
  }) : super(key: key);

  final PreferredSizeWidget appBar;
  final Widget body;
  final Widget floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: body,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
