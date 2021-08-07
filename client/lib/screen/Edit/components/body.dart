import 'package:flutter/material.dart';
import 'package:upp/constants.dart';
import 'package:upp/size_config.dart';
import 'edit_form.dart';
import '../../../size_config.dart';

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
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Text("Edit preference page", style: headingStyle),
                Text(
                  "Edit and reave your preference \nvia our mobility platform!!",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                EditForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
