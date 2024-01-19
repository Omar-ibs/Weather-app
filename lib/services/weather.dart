import 'package:clima/services/location.dart';
import 'package:clima/services/natworking.dart';

const apikey = '1271318221cea9ec826949223ce23c8b';
const urlweathermap = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getweathercity(String weathercity) async {
    Networkhelper weathe = Networkhelper(
        '$urlweathermap?q=$weathercity&appid=$apikey&units=metric');
    var weatherdata = weathe.getdata();
    return weatherdata;
  }

  Future<dynamic> getlocation() async {
    double latitude;
    double longitude;
    Location location = Location();
    await location.getcurrentlocation();
    latitude = location.latitude;
    longitude = location.longitude;
    Networkhelper networkhelper = Networkhelper(
        "$urlweathermap?lat=$latitude&lon=$longitude&appid=$apikey&units=metric");
    // ignore: unused_local_variable
    var weatherman = await networkhelper.getdata();
    return weatherman;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
