import 'dart:convert';

import 'package:weather_app/constants/string.dart';
import 'package:weather_app/model/weatherData.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weatherdata_current.dart';
import 'package:weather_app/model/weatherdata_daily.dart';
import 'package:weather_app/model/weatherdata_hourly.dart';

class FetchWeatherAPI{

  WeatherData?weatherData;

String apiURl(var lat,var lon){
  String url;
  url="https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely";
  return url;
}
  //
  Future<WeatherData>processData(lat,lon)async{
    var response= await http.get(Uri.parse(apiURl(lat, lon)));
    var jsonString =jsonDecode(response.body);
    weatherData =WeatherData(WeatherDataCurrent.fromJson(jsonString),WeatherDataHourly.fromJson(jsonString),
    WeatherDataDaily.fromJson(jsonString)
    );
    return weatherData!;
  }
}