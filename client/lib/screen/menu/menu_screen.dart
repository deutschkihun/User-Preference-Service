import 'package:flutter/material.dart';
import 'components/body.dart';

class MenuScreen extends StatelessWidget {
  static String routeName = "/menu";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Menu"),
      ),
      body: Body(),
    );
  }
}
