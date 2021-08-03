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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialCard(
                            icon: "assets/icons/facebook-2.svg",
                            press: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Warning message'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text("This feature is not ready."),
                                            Text("Comming soon.")
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                            child: const Text('Close'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            })
                                      ],
                                    );
                                  });
                            }),
                        SocialCard(
                            icon: "assets/icons/twitter.svg",
                            press: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Warning message'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text("This feature is not ready."),
                                            Text("Comming soon.")
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                            child: const Text('Close'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            })
                                      ],
                                    );
                                  });
                            }),
                        SocialCard(
                            icon: "assets/icons/google-icon.svg",
                            press: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Warning message'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text("This feature is not ready."),
                                            Text("Comming soon.")
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                            child: const Text('Close'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            })
                                      ],
                                    );
                                  });
                            }),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    NoAccountText()
                  ],
                )))));
  }
}
