import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:upp/components/default_button.dart';
import 'package:upp/helper/keyboard.dart';
//import 'package:upp/screen/Edit/editscreen.dart';
import 'package:http/http.dart' as http;
import 'package:upp/screen/success/success_screen.dart';

import '../../../size_config.dart';

class HomeForm extends StatefulWidget {
  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String url = "http://localhost:8080/api/mobilityPreferences/";
  String environmentalFriendliness,
      lightRailTravel,
      privateTransportation,
      livingStreet,
      favoritePlace,
      preferredTransportation,
      roadSurface,
      sharingTransportation,
      weather,
      currentLocation,
      trafficCondtion,
      travelCost,
      travelTime,
      waitingTime,
      transfer,
      roadInclination,
      capacityUtilization;
  List<String> environmentalFriendlinessList = ['Yes', 'No'];
  List<String> lightRailTravelList = ['Yes', 'No'];
  List<String> favoritePlaceList = ['Yes', 'No'];
  List<String> livingStreetList = ['Yes', 'No'];
  List<String> currentLoactionList = ['Yes', 'No'];
  List<String> trafficCondtionList = ['Yes', 'No'];

  List<String> preferredTransportationList = [
    'Bus',
    'Train',
    'Tram',
    'Taxi',
    'Sharing transportation',
    'Private Transportation',
    'Nothing'
  ];
  List<String> weatherList = ['Sunny', 'Rainy', 'Cloudy', 'Snowy', 'Windy'];
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

  Future save() async {
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'environmentalFriendliness': environmentalFriendliness,
          'lightRailTravel': lightRailTravel,
          'travelCost': travelCost,
          'travelTime': travelTime,
          'transfer': transfer,
          'privateTransportation': privateTransportation,
          'waitingTime': waitingTime,
          'favoritePlace': favoritePlace,
          'livingStreet': livingStreet,
          'preferredTransportation': privateTransportation,
          'roadInclination': roadInclination,
          'roadSurface': roadSurface,
          'sharingTransportation': sharingTransportation,
          'capacityUtilization': capacityUtilization,
          'weather': weather,
          'currentLocation': currentLocation,
          'trafficCondition': trafficCondtion,
        }));
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text("1.Dynamic preference",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(25),
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.5,
              )),
          Text(
            "Fill in your dynamic preference",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEnviromentalFriendlinessFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
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
          Text("2.Situational context",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(25),
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.5,
              )),
          Text(
            "Fill in your situational context",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCapacityFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildWeatherFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCurrentLocationFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTrafficConditionFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Save",
            press: () {
              if (_formKey.currentState.validate()) {
                // _formKey.currentState.save();
                save();
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, SuccessScreen.routeName);
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
      validator: (value) =>
          value == null ? 'Please fill your preference' : null,
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
      validator: (value) =>
          value == null ? 'Please fill your preference' : null,
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
      onSaved: (newValue) => travelCost = newValue,
      decoration: InputDecoration(
        labelText: "Travel cost",
        hintText: "Max. travel cost",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixText: '\$',
      ),
      validator: (newValue) {
        if (newValue.isEmpty) {
          return "can't empty";
        } else {
          return null;
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          travelCost = value;
        }
      },
    );
  }

  TextFormField buildTravelTimeFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => travelTime = newValue,
      decoration: InputDecoration(
        labelText: "Travel time",
        hintText: "Max. travel time",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixText: 'minute(s)',
      ),
      validator: (newValue) {
        if (newValue.isEmpty) {
          return "can't empty";
        } else {
          return null;
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          travelTime = value;
        }
      },
    );
  }

  TextFormField buildTransferFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => transfer = newValue,
      decoration: InputDecoration(
        labelText: "Transfer",
        hintText: "Max. number of transfers",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixText: 'time(s)',
      ),
      validator: (newValue) {
        if (newValue.isEmpty) {
          return "can't empty";
        } else {
          return null;
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          transfer = value;
        }
      },
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
        'Select your preference',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          privateTransportation = value;
        });
      },
      validator: (value) =>
          value == null ? 'Please fill your preference' : null,
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
      onSaved: (newValue) => waitingTime = newValue,
      decoration: InputDecoration(
        labelText: "Waiting time",
        hintText: "Max. waiting time",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixText: 'minute(s)',
      ),
      validator: (newValue) {
        if (newValue.isEmpty) {
          return "can't empty";
        } else {
          return null;
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          waitingTime = value;
        }
      },
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
      validator: (value) =>
          value == null ? 'Please fill your preference' : null,
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
      validator: (value) =>
          value == null ? 'Please fill your preference' : null,
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
        'Select your preference',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          preferredTransportation = value;
        });
      },
      validator: (value) =>
          value == null ? 'Please fill your preference' : null,
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
      onSaved: (newValue) => roadInclination = newValue,
      decoration: InputDecoration(
        labelText: "Road inclination",
        hintText: "Max. road inclination",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixText: '°(degree)',
      ),
      validator: (newValue) {
        if (newValue.isEmpty) {
          return "can't empty";
        } else {
          return null;
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          roadInclination = value;
        }
      },
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
        'Select your preference',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          roadSurface = value;
        });
      },
      validator: (value) =>
          value == null ? 'Please fill your preference' : null,
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
        'Select your preference',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          sharingTransportation = value;
        });
      },
      validator: (value) =>
          value == null ? 'Please fill your preference' : null,
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

  TextFormField buildCapacityFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => capacityUtilization = newValue,
      decoration: InputDecoration(
        labelText: "Capacity utilization of pulbic transportation",
        hintText: "Min. rate of capacity utilization",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixText: '%(percent)',
      ),
      validator: (newValue) {
        if (newValue.isEmpty) {
          return "can't empty";
        } else {
          return null;
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          capacityUtilization = value;
        }
      },
    );
  }

  DropdownButtonFormField buildWeatherFormField() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: "Weather",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      value: weather,
      hint: Text(
        'Select your preference',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          weather = value;
        });
      },
      validator: (value) =>
          value == null ? 'Please fill your preference' : null,
      items: weatherList.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }

  DropdownButtonFormField buildCurrentLocationFormField() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: "Current Location service",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      value: currentLocation,
      hint: Text(
        'Do you prefer?',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          currentLocation = value;
        });
      },
      validator: (value) =>
          value == null ? 'Please fill your preference' : null,
      items: currentLoactionList.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }

  DropdownButtonFormField buildTrafficConditionFormField() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: "Real-time traffic condition service",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      value: trafficCondtion,
      hint: Text(
        'Do you prefer?',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          trafficCondtion = value;
        });
      },
      validator: (value) =>
          value == null ? 'Please fill your preference' : null,
      items: trafficCondtionList.map((String val) {
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
