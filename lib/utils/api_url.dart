import 'package:weather_app/constants/string.dart';

String apiURl(var lat,var lon){
  String url;
  url="https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely";
  return url;
}