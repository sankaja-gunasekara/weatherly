import 'location.dart';
import 'network.dart';

class Weather {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();

    Network network = Network('${location.latitude},${location.longitude}');
    var decodedData = await network.getDecodedData();
    return decodedData;
  }

  Future<dynamic> getCityWeather(String city) async {
    Network network = Network(city);
    var decodedData = await network.getDecodedData();
    return decodedData;
  }
}
