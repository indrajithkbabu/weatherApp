

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/constants/string.dart';
import 'package:weather_app/model/weatherdata_current.dart';

class CurrentWeatherWidget extends StatelessWidget {

  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({Key? key,required this.weatherDataCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //temp
        temperatureAreaWidget(),
        SizedBox(height: 10,),


        //clouds,winds,humidity
        CurrentWeatherMoreDetailsWidget(),
        
      ],
    );
    
  }

  Widget temperatureAreaWidget(){
    return Padding(
      padding: const EdgeInsets.only(left:18.0,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",height: 80,width: 80,),
             RichText(text: TextSpan(
                            children: [
                              TextSpan(
                                 text: "${weatherDataCurrent.current.temp}${degree}",style: TextStyle(
                              color: Colors.black87,
                              fontSize: 65
                            )
                              ),
                                   TextSpan(
                                 text: "${weatherDataCurrent.current.weather![0].description}",style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                              //letterSpacing: 1
                            )
                              ),
                            ],
                           
                          ))
        
        ],

      ),
    );
  }

   Widget CurrentWeatherMoreDetailsWidget(){
    return    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: 
                      List.generate(3, (index) {
                        var iconList =["assets/icons/clouds.png", "assets/icons/humidity.png","assets/icons/windspeed.png"];
                        var datavalues =["${weatherDataCurrent.current.clouds}%","${weatherDataCurrent.current.humidity}%","${weatherDataCurrent.current.windSpeed}km/hr"];
              
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200]
                              ),
                              child: Image.asset(iconList[index],height: 50,width: 50,)),
                              SizedBox(height: 10,),
                              Text(datavalues[index],style: TextStyle(color: Colors.grey[700]),)
                              
                          ],
                        );
                      })
                    ,
                  );
  }
}