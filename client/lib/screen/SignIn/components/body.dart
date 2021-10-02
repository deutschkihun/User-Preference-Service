import 'package:flutter/material.dart';
import 'package:upp/components/no_accoount_text.dart';
import 'package:upp/components/social_card.dart';
import 'package:upp/size_config.dart';
import 'package:upp/screen/SignIn/components/sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.04),
                    Text(
                      "Let's Start",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(28),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Sign in with your email and password \n or sign in with your social media account",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    SignForm(),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    NoAccountText()
                  ],
                )))));
  }
}
