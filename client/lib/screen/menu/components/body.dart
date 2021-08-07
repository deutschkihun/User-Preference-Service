import 'package:flutter/material.dart';
import 'package:upp/components/default_button.dart';
import 'package:upp/screen/Edit/editscreen.dart';
import 'package:upp/screen/SignIn/signinScreen.dart';
import 'package:upp/size_config.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.25),
                Text("Menu Page", style: headingStyle),
                Text(
                  "Click button to edit your preferences \n or log out your account.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                SizedBox(
                  width: SizeConfig.screenWidth * 0.6,
                  child: DefaultButton(
                    text: "Edit preferences",
                    press: () {
                      Navigator.pushNamed(context, EditScreen.routeName);
                    },
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                SizedBox(
                  width: SizeConfig.screenWidth * 0.6,
                  child: DefaultButton(
                    text: "Log out",
                    press: () {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
