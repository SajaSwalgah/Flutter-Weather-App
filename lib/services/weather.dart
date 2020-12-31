import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

double lat = 30.8029534;
double long = 35.5996939;
const apiKey = '8bffe6082b6c556d227e337259212ba0';
const openWeatherMapUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=$lat&lon=$long&appid=$apiKey&units=metric');
    var weatherData =
        await networkHelper.getDate(); //should be at the end ot the function
    // Location currentLocation = Location();
    // await currentLocation.getCurrentLocation();
    // lat = currentLocation.lat;
    // long = currentLocation.long;

    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityname) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?q=$cityname&appid=$apiKey&units=metric');
    var weatherData =
        await networkHelper.getDate(); //should be at the end ot the function
    return weatherData;
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
