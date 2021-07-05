import 'package:flutter/material.dart';

const kWeatcherDataURL = 'https://api.ambeedata.com';
const kWeatherDataAPI =
    '0bed73e25ffe08dbead8a4d7705940294cc88f81609c412615154ede043d2582';
const kBackgroundColor = Color(0xFFEBF1FD);
const kPurple = Color(0xFF582CE4);
const kLightGrey = Color(0xFF99A3BF);
const kDarkBlue = Color(0xFF25386E);
const kIconBackgroundColor = Color(0xFFDCE3F1);
const kBorderRadius = 20.0;
const kDarkPurple = Color(0xFF592CE7);

const kLightGreyTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 20,
  color: kLightGrey,
);

const kDarkBlueTextSTyle = TextStyle(
  fontFamily: 'Montserrat',
  color: kDarkBlue,
  fontSize: 40,
  fontWeight: FontWeight.bold,
);

const kParameterLabelTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 18,
  color: kLightGrey,
);

const kSearchTextStyle = TextStyle(
  fontSize: 20,
  fontFamily: 'Montserrat',
  color: kBackgroundColor,
  fontWeight: FontWeight.w500,
);

const kCitySearchTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 18,
);

const kCitySearchBoxStyle = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(30.0),
    ),
    borderSide: BorderSide.none,
  ),
  fillColor: kIconBackgroundColor,
  filled: true,
  contentPadding: EdgeInsets.only(left: 23),
  hintText: 'Enter a city',
  hintStyle: kCitySearchTextStyle,
);

var kSearchNewCityButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40.0),
    ),
  ),
  backgroundColor: MaterialStateProperty.all(
    kDarkPurple,
  ),
  elevation: MaterialStateProperty.all(4),
  shadowColor: MaterialStateProperty.all(kDarkBlue),
);

var kGetWeatherButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40.0),
    ),
  ),
  backgroundColor: MaterialStateProperty.all(kDarkPurple),
  elevation: MaterialStateProperty.all(4),
  shadowColor: MaterialStateProperty.all(kDarkBlue),
);
