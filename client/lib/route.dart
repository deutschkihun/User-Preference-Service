import 'package:flutter/widgets.dart';
import 'package:upp/screen/Edit/editscreen.dart';
import 'package:upp/screen/SignUp/sign_up_screen.dart';
import 'package:upp/screen/home/home_screen.dart';
import 'package:upp/screen/splash/splash_screen.dart';
import 'package:upp/screen/SignIn/signinScreen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  EditScreen.routeName: (context) => EditScreen(),
};
