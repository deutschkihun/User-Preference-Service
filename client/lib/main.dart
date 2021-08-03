import 'package:flutter/material.dart';
import 'package:upp/route.dart';
import 'package:upp/screen/splash/splash_screen.dart';
import 'package:upp/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UPMP',
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        routes: routes);
  }
}
