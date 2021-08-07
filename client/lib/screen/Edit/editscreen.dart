import 'package:flutter/material.dart';
import 'components/body.dart';

class EditScreen extends StatelessWidget {
  static String routeName = "/edit";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
      ),
      body: Body(),
    );
  }
}
