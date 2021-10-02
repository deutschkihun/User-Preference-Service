import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upp/components/default_button.dart';
import 'package:upp/screen/SignIn/signinScreen.dart';
import 'package:upp/size_config.dart';

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  SharedPreferences sharedPreferences;

  /*@override
  void initState() {
    super.initState();
    checkoutLoginStatus();
  }

  checkoutLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.pushNamed(context, SignInScreen.routeName);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: SizeConfig.screenWidth * 0.6,
        child: DefaultButton(
          text: "Log out",
          press: () {
            //sharedPreferences.clear();
            // ignore: deprecated_member_use
            //sharedPreferences.commit();
            Navigator.pushNamed(context, SignInScreen.routeName);
          },
        ),
      ),
    );
  }
}
