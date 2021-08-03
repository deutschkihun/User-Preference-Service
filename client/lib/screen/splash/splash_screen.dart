import 'package:flutter/material.dart';
import 'package:upp/screen/splash/components/body.dart';
import 'package:upp/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on yur starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
