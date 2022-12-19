// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/string.dart';

import 'package:weather_app/model/weatherdata_hourly.dart';

class HourlyWeatherWidget extends StatelessWidget {

  final WeatherDataHourly weatherDataHourly;
  const HourlyWeatherWidget({Key? key, required this.weatherDataHourly}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          alignment: Alignment.topCenter,
          child:Text("Today",style: TextStyle(fontSize: 15),)
          
        ),
        hourlyList(),
      ],
    );
    
    
  }
  Widget hourlyList(){
    return Container(
      height: 150,
      padding: EdgeInsets.only(top: 10,bottom: 10),
      child:ListView.builder(
         physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length >6 ? 6 :weatherDataHourly.hourly.length,
        itemBuilder: (context, index) {
           var time =DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(weatherDataHourly.hourly[index].dt!.toInt()*1000));
          return  GestureDetector(child: Container(
              padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
        
        
                        ),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(12),
            //   boxShadow: [BoxShadow(offset: Offset(0.5, 0),blurRadius: 30,spreadRadius: 1,)],
            //   gradient: LinearGradient(colors: [Colors.blue,Colors.grey])
            // ),
            child:HourlyDetails(temp: weatherDataHourly.hourly[index].temp!,
            timeStamp: weatherDataHourly.hourly[index].dt!,
            weatherIcon: weatherDataHourly.hourly[index].weather![0].icon!,
            time: time,
            
            ) ,
          ));
        
      },)
    );
  }
}

class HourlyDetails extends StatelessWidget {
  int temp;
  int timeStamp;
  String weatherIcon;
  String time;
   
 HourlyDetails({
    Key? key,
   required this.temp,
    required this.timeStamp,
    required this.weatherIcon,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Text(time),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Image.asset("assets/weather/$weatherIcon.png",height: 50,width: 70,),
        ),
         Container(
          margin: EdgeInsets.only(top: 10),
          child: Text("${temp}$degree")
        )

      ],
    );
    
  }
}
