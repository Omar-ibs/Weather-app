import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
    fontFamily: 'Spartan MB', fontSize: 100.0, fontWeight: FontWeight.bold);

const kMessageTextStyle = TextStyle(
    fontFamily: 'Spartan MB', fontSize: 40.0, fontWeight: FontWeight.bold);

const kButtonTextStyle =
    TextStyle(fontSize: 30.0, fontFamily: 'Spartan MB', color: Colors.white);

const kConditionTextStyle = TextStyle(
  fontSize: 80.0,
);
const ktextdecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintText: 'Enter a city name',
    hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide.none,
    ));
