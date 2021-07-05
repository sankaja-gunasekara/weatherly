import 'package:http/http.dart' as http;
import 'dart:convert';

const kWeatherDataURL = 'https://api.weatherapi.com/v1/current.json';
const kWeatherDataAPI = '7d8b9ba1216847f8b13185513210207';

class Network {
  Network(this.q);
  final String q;

  Future<dynamic> getDecodedData() async {
    var url = Uri.parse('$kWeatherDataURL?key=$kWeatherDataAPI&q=$q');
    var response = await http.post(url);

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      return decode;
    } else {
      print('Error');
    }
  }
}
