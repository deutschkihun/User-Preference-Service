import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:upp/components/custom_surfix_icon.dart';
import 'package:upp/components/default_button.dart';
import 'package:upp/components/form_error.dart';
import 'package:upp/helper/keyboard.dart';
import 'package:upp/screen/SignIn/signinScreen.dart';
import 'package:upp/screen/SignUp/components/user.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String gender;
  String paymentMethod;
  String subscription;
  String handicapped;
  String confirmPassword;
  List<String> paymentMethodList = [
    'CreditCard',
    'Girodirekt',
    'Paypal',
    'Applepay'
  ];
  List<String> genderList = ['male', 'female'];
  List<String> subscriptionList = ['BahnCard', 'Nextbike', 'Stadtmobil'];
  List<String> handicappedList = ['Yes', 'No'];

  String url = "http://localhost:8080/register";
  User user = User("", "", 0);
  bool remember = false;
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

  Future save() async {
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'Email': user.email,
          'Password': user.password,
          'Age': user.age,
          'Gender': gender,
          'Subscription': subscription,
          'PaymentMethod': paymentMethod,
          'Handicapped': handicapped
        }));
    print(res.body);
    if (res.body != null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfirmPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          Text("Static user profile", style: headingStyle),
          Text(
            "finish your static user profile",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          buildAgeFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildGenderFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildSubscriptionFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPaymentMethodsFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildHandicappedFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                // _formKey.currentState.save();
                //save();
                //debugPrint('movieTitle: $user.email');
                print(user.email); // working
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, SignInScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConfirmPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && user.password == confirmPassword) {
          removeError(error: kMatchPassError);
        }
        confirmPassword = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((user.password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => user.password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        user.password = value;
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
      controller: TextEditingController(text: user.email),
      //onSaved: (newValue) => user.email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        user.email = value;
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

  TextFormField buildAgeFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => user.age = newValue as int,
      /*validator: (newValue) {
        if (newValue.isEmpty) {
          return "can't empty";
        } else {
          return null;
        }
      },*/
      decoration: InputDecoration(
        labelText: "Age",
        hintText: "Enter your age",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  DropdownButtonFormField buildGenderFormField() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Gender",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
      value: gender,
      hint: Text(
        'Select gender',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          gender = value;
        });
      },
      onSaved: (value) {
        setState(() {
          gender = value;
        });
      },
      items: genderList.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }

  DropdownButtonFormField buildSubscriptionFormField() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: "Mobility subscription service",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Chat bubble Ircon.svg"),
      ),
      value: subscription,
      hint: Text(
        'Select subscription',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          subscription = value;
        });
      },
      onSaved: (value) {
        setState(() {
          subscription = value;
        });
      },
      items: subscriptionList.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }

  DropdownButtonFormField buildPaymentMethodsFormField() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: "Payment method",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Cash.svg"),
      ),
      value: paymentMethod,
      hint: Text(
        'Select payment method',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          paymentMethod = value;
        });
      },
      onSaved: (value) {
        setState(() {
          paymentMethod = value;
        });
      },
      items: paymentMethodList.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }

  DropdownButtonFormField buildHandicappedFormField() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: "For the physically handicapped",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
      value: handicapped,
      hint: Text(
        'Need any rsupport?',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          handicapped = value;
        });
      },
      onSaved: (value) {
        setState(() {
          handicapped = value;
        });
      },
      items: handicappedList.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }
}
