import 'package:flutter/material.dart';
import 'package:upp/components/default_button.dart';
import 'package:upp/screen/Edit/editscreen.dart';
import 'package:upp/screen/menu/menu_screen.dart';
import 'package:upp/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Successfully saved \nyour preferences",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Continue",
            press: () {
              Navigator.pushNamed(context, MenuScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
