import 'package:flutter/material.dart';
import 'package:weatherly/utilities/constants.dart';
import 'package:weatherly/utilities/components.dart';
import 'package:intl/intl.dart';
import 'package:weatherly/services/weather.dart';
import 'city_serach_screen.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen(this.decodedData);
  final decodedData;
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String wind;
  String temp;
  String humidity;
  String city;
  String image;
  String condition;
  static final DateTime now = DateTime.now();
  final String date = DateFormat('d').format(now);
  final String month = DateFormat('MMMM').format(now);

  @override
  void initState() {
    updateValues(widget.decodedData);
    super.initState();
  }

  void updateValues(dynamic decodedData) {
    setState(() {
      city = decodedData['location']['name'];
      condition = decodedData['current']['condition']['text'];
      wind = decodedData['current']['wind_kph'].toString();
      temp = decodedData['current']['temp_c'].toString();
      humidity = decodedData['current']['humidity'].toString();
      image = 'https:${decodedData['current']['condition']['icon']}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today, $date $month',
                          style: kLightGreyTextStyle,
                        ),
                        Text(
                          city,
                          style: kDarkBlueTextSTyle,
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () async {
                        var decodeData = await Weather().getLocationWeather();
                        updateValues(decodeData);
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xFFDCE3F1),
                        ),
                      ),
                      child: Icon(
                        Icons.my_location,
                        color: kDarkBlue,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Image(
                              image: NetworkImage(
                            image,
                            scale: 0.4,
                          )),
                          Text(
                            condition,
                            textAlign: TextAlign.center,
                            style: kDarkBlueTextSTyle,
                          ),
                        ],
                      ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Parameters(
                              text: 'Wind',
                              value: wind,
                            ),
                            VerticalDivider(
                              thickness: 1,
                              indent: 15,
                              endIndent: 15,
                              color: kLightGrey,
                            ),
                            Parameters(
                              text: 'Temp °C',
                              value: temp,
                            ),
                            VerticalDivider(
                              thickness: 1,
                              indent: 15,
                              endIndent: 15,
                              color: kLightGrey,
                            ),
                            Parameters(
                              text: 'Humidity',
                              value: '$humidity%',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 30,
                  ),
                  child: TextButton(
                    onPressed: () async {
                      var city = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                      if (city != null) {
                        var decodedData = await Weather().getCityWeather(city);
                        updateValues(decodedData);
                      }
                    },
                    style: kSearchNewCityButtonStyle,
                    child: Text(
                      'Search new city',
                      style: kSearchTextStyle,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
