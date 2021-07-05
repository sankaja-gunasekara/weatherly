import 'package:flutter/material.dart';
import 'package:weatherly/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    String cityName;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/city.png"),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 100),
                TextField(
                  onChanged: (typedCityName) {
                    cityName = typedCityName;
                  },
                  style: kCitySearchTextStyle,
                  decoration: kCitySearchBoxStyle,
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 45,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, cityName);
                    },
                    style: kGetWeatherButtonStyle,
                    child: Text(
                      'Get Weather',
                      style: kSearchTextStyle,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
