import 'package:flutter/material.dart';
import 'package:weatherly/services/weather.dart';
import 'weather_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherly/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationWeather();
  }

  void getLocationWeather() async {
    var decodeData = await Weather().getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherScreen(decodeData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitThreeBounce(
          color: kPurple,
          size: 40,
        ),
      ),
    );
  }
}
