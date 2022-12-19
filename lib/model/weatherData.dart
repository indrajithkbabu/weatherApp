import 'package:weather_app/model/weatherdata_current.dart';
import 'package:weather_app/model/weatherdata_daily.dart';
import 'package:weather_app/model/weatherdata_hourly.dart';

class WeatherData{

  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;
WeatherData([this.current,this.hourly,this.daily]);

WeatherDataCurrent getCurrentWeather()=>current!;
WeatherDataHourly getHourlyWeather()=>hourly!;
WeatherDataDaily getDailyWeather()=>daily!;


}