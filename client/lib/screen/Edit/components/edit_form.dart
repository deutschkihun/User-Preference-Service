import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:upp/components/default_button.dart';
import 'package:upp/helper/keyboard.dart';
import 'package:upp/screen/SignIn/signinScreen.dart';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';

class EditForm extends StatefulWidget {
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String url = "http://localhost:8080/dynamic_preference_profile";
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
      age,
      gender,
      paymentMethod,
      subscription,
      handicapped;
  int travelCost, travelTime, waitingTime, transfer, roadInclination;
  List<String> environmentalFriendlinessList = ['Yes', 'No'];
  List<String> lightRailTravelList = ['Yes', 'No'];
  List<String> favoritePlaceList = ['Yes', 'No'];
  List<String> livingStreetList = ['Yes', 'No'];
  List<String> currentLoactionList = ['Yes', 'No'];
  List<String> trafficCondtionList = ['Yes', 'No'];
  List<String> paymentMethodList = [
    'CreditCard',
    'Girodirekt',
    'Paypal',
    'Applepay'
  ];
  List<String> genderList = ['male', 'female'];
  List<String> subscriptionList = [
    'BahnCard',
    'Nextbike',
    'Stadtmobil',
    'Nothing'
  ];
  List<String> handicappedList = ['Yes', 'No'];

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
          Text("1.Static user profile",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(25),
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.5,
              )),
          Text(
            "edit your static user profile",
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
          Text("2.Dynamic preference",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(25),
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.5,
              )),
          Text(
            "edit your dynamic preference profile",
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
          Text("3.Situational context",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(25),
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.5,
              )),
          Text(
            "edit your situational context",
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
            text: "Resave",
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

  TextFormField buildAgeFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (value.isNotEmpty) {
          age = value;
        }
      },
      validator: (newValue) {
        if (newValue.isEmpty) {
          return "can't empty";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: "Age",
        hintText: "Enter your age",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  DropdownButtonFormField buildGenderFormField() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Gender",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      value: gender,
      hint: Text(
        'Select your gender',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          gender = value;
        });
      },
      validator: (value) => value == null ? 'Please fill in your gender' : null,
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
      validator: (value) =>
          value == null ? 'Please fill in your subscription' : null,
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
      validator: (value) =>
          value == null ? 'Please fill in your payment method' : null,
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
      ),
      value: handicapped,
      hint: Text(
        'Need support?',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          handicapped = value;
        });
      },
      validator: (value) =>
          value == null ? 'Please fill in whether you need support' : null,
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

  ///////////////////////////////////////////////////////////////////

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
      onSaved: (newValue) => travelCost = newValue as int,
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
      validator: (newValue) {
        if (newValue.isEmpty) {
          return "can't empty";
        } else {
          return null;
        }
      },
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
      validator: (newValue) {
        if (newValue.isEmpty) {
          return "can't empty";
        } else {
          return null;
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
      onSaved: (newValue) => waitingTime = newValue as int,
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
      onSaved: (newValue) => roadInclination = newValue as int,
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
      onSaved: (newValue) => roadInclination = newValue as int,
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
