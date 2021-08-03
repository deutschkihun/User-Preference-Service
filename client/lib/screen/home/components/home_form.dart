import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:upp/components/default_button.dart';
import 'package:upp/components/form_error.dart';
import 'package:upp/helper/keyboard.dart';
import 'package:upp/screen/SignIn/signinScreen.dart';
import 'package:http/http.dart' as http;

import '../../../size_config.dart';

class HomeForm extends StatefulWidget {
  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String url = "http://localhost:8080/dynamic_preference_profile";
  String environmentalFriendliness;
  String lightRailTravel;
  String privateTransportation;
  String livingStreet;
  String favoritePlace;
  String preferredTransportation;
  String roadSurface;
  String sharingTransportation;
  int travelCost;
  int travelTime;
  int waitingTime;
  int transfer;
  int roadInclination;

  List<String> environmentalFriendlinessList = ['Yes', 'No'];
  List<String> lightRailTravelList = ['Yes', 'No'];
  List<String> favoritePlaceList = ['Yes', 'No'];
  List<String> livingStreetList = ['Yes', 'No'];
  List<String> preferredTransportationList = [
    'Bus',
    'Train',
    'Tram',
    'Taxi',
    'Sharing transportation',
    'Private Transportation',
    'Not preferred'
  ];
  List<String> roadSurfaceList = [
    'Paved surface',
    'Rough surface',
    'Riding surface',
    'Concrete',
    'Asphalte',
    'Grass',
    'Wood'
  ];

  List<String> privateTransporationList = [
    'Automobile',
    'Bicycle',
    'Electric scooter',
    'Motorcycle',
    'Skateboard',
    'Not preferred'
  ];
  List<String> sharingTransportationList = [
    'Stadtmobil',
    'NextBike',
    'Electric-scooter (Tier)',
    'Electric-scooter (Bird)',
    'Electric-scooter (VOI)',
    'Not preferred'
  ];

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
          'Environmental friendliness': environmentalFriendliness,
          'Light rail travel': lightRailTravel,
          'Travel cost': travelCost,
          'Travel time': travelTime,
          'Transfer': transfer,
          'Private Transportation': privateTransportation,
          'Waiting time': waitingTime,
          'Favorite place': favoritePlace,
          'Living street': livingStreet,
          'Preferred transportation': privateTransportation,
          'Road inclination': roadInclination,
          'Road surface': roadSurface,
          'Sharing Transportation': sharingTransportation
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
          buildEnviromentalFriendlinessFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          //buildWeightFormField(),
          buildLightRailTravelFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTravelCostFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTravelTimeFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTransferFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPrivateTransportationFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildWaitingTimeFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildFavoritePlaceFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLivingStreetFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPreferredTransportationFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildRoadInclinationFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildRoadSurfaceFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildSharingTransportationFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          //situational context ???
          //FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Save",
            press: () {
              if (_formKey.currentState.validate()) {
                // _formKey.currentState.save();
                //save();
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, SignInScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  DropdownButtonFormField buildEnviromentalFriendlinessFormField() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: "Environmental friendliness",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      value: environmentalFriendliness,
      hint: Text(
        'Do you prefer?',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          environmentalFriendliness = value;
        });
      },
      onSaved: (value) {
        setState(() {
          environmentalFriendliness = value;
        });
      },
      items: environmentalFriendlinessList.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }

  DropdownButtonFormField buildLightRailTravelFormField() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: "Light rail travel",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      value: lightRailTravel,
      hint: Text(
        'Do you prefer?',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          lightRailTravel = value;
        });
      },
      onSaved: (value) {
        setState(() {
          lightRailTravel = value;
        });
      },
      items: lightRailTravelList.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }

  TextFormField buildTravelCostFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => travelCost = newValue as int,
      decoration: InputDecoration(
        labelText: "Travel cost",
        hintText: "Max. travel cost",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixText: '\$',
      ),
    );
  }

  TextFormField buildTravelTimeFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => travelCost = newValue as int,
      decoration: InputDecoration(
        labelText: "Travel time",
        hintText: "Max. travel time",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixText: 'minute(s)',
      ),
    );
  }

  TextFormField buildTransferFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => travelCost = newValue as int,
      decoration: InputDecoration(
        labelText: "Transfer",
        hintText: "Max. number of transfers",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixText: 'time(s)',
      ),
    );
  }

  DropdownButtonFormField buildPrivateTransportationFormField() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: "Private Transportation",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      value: privateTransportation,
      hint: Text(
        'Select preference',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          privateTransportation = value;
        });
      },
      onSaved: (value) {
        setState(() {
          privateTransportation = value;
        });
      },
      items: privateTransporationList.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }

  TextFormField buildWaitingTimeFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => waitingTime = newValue as int,
      decoration: InputDecoration(
        labelText: "Waiting time",
        hintText: "Max. waiting time",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixText: 'minute(s)',
      ),
    );
  }

  DropdownButtonFormField buildFavoritePlaceFormField() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: "Saving favorite place function",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      value: favoritePlace,
      hint: Text(
        'Do you prefer?',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          favoritePlace = value;
        });
      },
      onSaved: (value) {
        setState(() {
          favoritePlace = value;
        });
      },
      items: favoritePlaceList.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }

  DropdownButtonFormField buildLivingStreetFormField() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: "Living street",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      value: livingStreet,
      hint: Text(
        'Do you prefer?',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          livingStreet = value;
        });
      },
      onSaved: (value) {
        setState(() {
          livingStreet = value;
        });
      },
      items: livingStreetList.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }

  DropdownButtonFormField buildPreferredTransportationFormField() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: "Preferred transportation",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      value: preferredTransportation,
      hint: Text(
        'Select preference',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          preferredTransportation = value;
        });
      },
      onSaved: (value) {
        setState(() {
          preferredTransportation = value;
        });
      },
      items: preferredTransportationList.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }

  TextFormField buildRoadInclinationFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => roadInclination = newValue as int,
      decoration: InputDecoration(
        labelText: "Road inclination",
        hintText: "Max. road inclination",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixText: '°(degree)',
      ),
    );
  }

  DropdownButtonFormField buildRoadSurfaceFormField() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: "Road surface",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      value: roadSurface,
      hint: Text(
        'Select preference',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          roadSurface = value;
        });
      },
      onSaved: (value) {
        setState(() {
          roadSurface = value;
        });
      },
      items: roadSurfaceList.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }

  DropdownButtonFormField buildSharingTransportationFormField() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: "Sharing Transportation",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      value: sharingTransportation,
      hint: Text(
        'Select preference',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          sharingTransportation = value;
        });
      },
      onSaved: (value) {
        setState(() {
          sharingTransportation = value;
        });
      },
      items: sharingTransportationList.map((String val) {
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
