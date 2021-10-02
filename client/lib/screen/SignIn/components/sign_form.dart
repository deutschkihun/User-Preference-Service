import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upp/components/custom_surfix_icon.dart';
import 'package:upp/components/default_button.dart';
import 'package:upp/components/form_error.dart';
import 'package:upp/constants.dart';
import 'package:upp/helper/keyboard.dart';
import 'package:upp/screen/menu/menu_screen.dart';
import 'package:upp/size_config.dart';
import 'package:http/http.dart' as http;

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool isLoading = false;
  String url = "http://localhost:8080/api/login/";
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  Future signIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }));

    /*if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        sharedPreferences.setString("token", jsonData['token']);
      });
    } else {
      print(response.body);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        buildEmailFormField(),
        SizedBox(height: getProportionateScreenHeight(20)),
        buildPasswordFormField(),
        SizedBox(height: getProportionateScreenHeight(20)),
        FormError(errors: errors),
        SizedBox(height: getProportionateScreenHeight(20)),
        DefaultButton(
          text: "Continue",
          press: () {
            if (_formKey.currentState.validate()) {
              signIn();
              KeyboardUtil.hideKeyboard(context);
              Navigator.pushNamed(context, MenuScreen.routeName);
            }
          },
        )
      ]),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: TextEditingController(text: password),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: TextEditingController(text: email),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        email = value;

        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
