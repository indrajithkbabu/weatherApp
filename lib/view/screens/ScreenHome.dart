import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/dataController.dart';
import 'package:weather_app/view/widgets/current_weather.dart';
import 'package:weather_app/view/widgets/daily_weather.dart';
import 'package:weather_app/view/widgets/header.dart';
import 'package:weather_app/view/widgets/hourly_weather.dart';

class ScreenHome extends StatelessWidget {
   ScreenHome({Key? key}) : super(key: key);
  final DataController controller =Get.put(DataController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:SafeArea(
        
        child:Obx(() {
          return controller.checkLoading().isTrue ? Center(child: CircularProgressIndicator(),):
          ListView(
            physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: 20,),
              HeaderWidget(),

              //for current weather
              CurrentWeatherWidget(weatherDataCurrent: controller.getData().getCurrentWeather()),
             SizedBox(height: 20,),
              //for hourly weather
              HourlyWeatherWidget(weatherDataHourly: controller.getData().getHourlyWeather()),
              SizedBox(height: 20,),

              //for daily weather
              DailyWeatherWidget(weatherDataDaily: controller.getData().getDailyWeather()),

            ],
          );
        },) ) ,
    );
  }
}