import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/string.dart';
import 'package:weather_app/model/weatherdata_daily.dart';

class DailyWeatherWidget extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
 DailyWeatherWidget({Key? key, required this.weatherDataDaily}) : super(key: key);

// String getDay(final day){
//   DateTime time=DateTime.fromMillisecondsSinceEpoch(day*1000);
//   final x=DateFormat("EEEE").format(time);
//   return x;
// }


  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 400,
      margin: EdgeInsets.only(left:10,right:10,),
//       padding: EdgeInsets.all(15),

//  decoration: BoxDecoration(
//    color: Colors.grey[200],
//   borderRadius: BorderRadius.circular(20)
//  ),
 child: Column(
  children: [
    Container(alignment: Alignment.topLeft,
    child: Padding(
      padding: const EdgeInsets.only(left:6.0),
      child: Text("Next Days",style: TextStyle(fontSize: 15),),
    ),
    ),
    SizedBox(height: 10,),
    dailyList(),
  ],
 ),
    
    );
    
  }
  Widget dailyList() {
    return SizedBox(
      height: 300,
      // child:ListView.builder(
      //   itemCount: weatherDataDaily.daily.length >7 ? 7:weatherDataDaily.daily.length,
      //   itemBuilder: (context, index) {
      //    // var day=DateFormat("EEEE").format(DateTime.now().add(Duration(days: index+1)));
      //     return Column(
      //       children: [
      //         Container(
      //           child: Text(getDay(weatherDataDaily.daily[index].dt)),

      //         )
      //       ],
      //     );
        
      // },)
      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:  weatherDataDaily.daily.length >7 ? 7:weatherDataDaily.daily.length,
                      itemBuilder: (context, index) {
                        var day=DateFormat("EEEE").format(DateTime.now().add(Duration(days: index+1)));
                        return Card(
                          color: Colors.grey[200],
                         
                          
                          child: Container(
                            height: 70,
                            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                            child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                 Expanded(child:
                                 Text(day),
                                  ),
                                Expanded(
                                  child:
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                     children: [
                                       TextButton.icon(onPressed: (){},
                                       icon:Image.asset("assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png",width: 40 ,), 
                                       label:  Text("${weatherDataDaily.daily[index].temp!.max}$degree /${weatherDataDaily.daily[index].temp!.min}$degree",
                                       style: TextStyle(color:Colors.black),
                                       ),
                                       ),
                                       

                                     ],
                                   ),
                                  //  Text("38$degree / 24$degree")
                                  
                                ),
                               
                        
                              ],
                        
                        
                            ),
                          ),
                        );
                      
                    },)
    );
      
}
}